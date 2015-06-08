//
//  ToDoItemsTableViewController.swift
//  ToDoList
//
//  Created by Steve Smart on 5/26/15.
//  Copyright (c) 2015 Steve Smart. All rights reserved.
//

import UIKit
import CoreData

class ToDoListController: UITableViewController, NSFetchedResultsControllerDelegate, UIActionSheetDelegate, UIPopoverPresentationControllerDelegate, OptionsDelegate {
    
    // MARK: Properties
    var managedObjectContext: NSManagedObjectContext!
    var taskNeedingToBeDeleted: TaskManaged?
    var colorScheme = UIConstants.Colors.ColorScheme.defaultScheme {
        didSet {
            let defaults = NSUserDefaults.standardUserDefaults()
            defaults.setObject(colorScheme, forKey: NSUserDefaultsConstants.colorSchemeKey)
            
            implementColorScheme()
            
            let numberOfRows = self.tableView.numberOfRowsInSection(0)
            for i in 0..<numberOfRows {
                let indexPath = NSIndexPath(forRow: i, inSection: 0)
                if let cell = self.tableView.cellForRowAtIndexPath(indexPath) as? TaskCell {
                    cell.colorScheme = colorScheme
                }
            }
        }
    }
    
    var sortDescriptorKey = CoreDataConstants.sortDescriptorKeyImportance {
        didSet {
            let defaults = NSUserDefaults.standardUserDefaults()
            defaults.setObject(sortDescriptorKey, forKey: NSUserDefaultsConstants.sortDescriptorKey)
            
            let sortDescriptor = NSSortDescriptor(key: sortDescriptorKey, ascending: false)
            fetchedResultsController.fetchRequest.sortDescriptors = [sortDescriptor]
            loadData()
        }
    }
    
    lazy var fetchedResultsController: NSFetchedResultsController = {
        [unowned self] in
        
        let taskFetchRequest = NSFetchRequest(entityName: CoreDataConstants.taskEntityName)
        let sortDescriptor = NSSortDescriptor(key: self.sortDescriptorKey, ascending: false)
        taskFetchRequest.sortDescriptors = [sortDescriptor]
        
        let frc = NSFetchedResultsController(fetchRequest: taskFetchRequest, managedObjectContext: self.managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
        
        frc.delegate = self
        
        return frc
    }()
    
    @IBOutlet weak var optionsButton: UIBarButtonItem!
    @IBOutlet weak var newButton: UIBarButtonItem!
    
    // MARK: View Controller Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialViewSetup()
        implementColorScheme()
        loadData()
    }
    
    private func initialViewSetup() {
        let defaults = NSUserDefaults.standardUserDefaults()
        if let sortMethod = defaults.stringForKey(NSUserDefaultsConstants.sortDescriptorKey) {
            sortDescriptorKey = sortMethod
        }
        if let cs = defaults.stringForKey(NSUserDefaultsConstants.colorSchemeKey) {
            colorScheme = cs
        }
    }
    
    private func implementColorScheme() {
        func implementColorSchemeHelper(scheme: ColorSchemeProtocol) {
            self.tableView.backgroundColor = scheme.mainBackgroundColor
            self.tableView.separatorColor = UIColor.blackColor()
            self.navigationController?.navigationBar.tintColor = scheme.buttonColor
            
            optionsButton.tintColor = scheme.buttonColor
            newButton.tintColor = scheme.buttonColor
        }
        
        switch colorScheme {
        case UIConstants.Colors.ColorScheme.defaultScheme:
            implementColorSchemeHelper(UIConstants.Colors.DefaultColorScheme())
        case UIConstants.Colors.ColorScheme.blueScheme:
            implementColorSchemeHelper(UIConstants.Colors.BlueColorScheme())
        case UIConstants.Colors.ColorScheme.redScheme:
            implementColorSchemeHelper(UIConstants.Colors.YellowColorScheme())
        default:
            break
        }
    }
    
    private func loadData() {
        var error: NSError?
        if fetchedResultsController.performFetch(&error) == false {
            println("An error occurred: \(error?.localizedDescription)")
        }
        self.tableView.reloadData()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tableView.reloadData()
        
        if self.tableView.numberOfRowsInSection(0) > CoreDataConstants.maxNumberOfTasksThatShouldBeStored {
            self.navigationItem.rightBarButtonItem?.enabled = false
        }
    }

    // MARK: UITableViewDataSource Methods
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        if let sections = fetchedResultsController.sections {
            return sections.count
        }
        
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sections = fetchedResultsController.sections
        
        let currentSection = sections?[section] as! NSFetchedResultsSectionInfo
        
        return currentSection.numberOfObjects
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(StoryboardConstants.CellIdentifiers.prototypeCellID, forIndexPath: indexPath) as! TaskCell
        let task = fetchedResultsController.objectAtIndexPath(indexPath) as? TaskManaged
        
        cell.taskManaged = task
        cell.colorScheme = colorScheme

        return cell
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        switch editingStyle {
        case .Delete:
            if let task = fetchedResultsController.objectAtIndexPath(indexPath) as? TaskManaged {
                taskNeedingToBeDeleted = task
                confirmDeleteTask(task)
            }
        default:
            break
        }
    }
    
    override func tableView(tableView: UITableView, titleForDeleteConfirmationButtonForRowAtIndexPath indexPath: NSIndexPath) -> String! {
        return "Complete"
    }
    
    private func confirmDeleteTask(task: TaskManaged) {
        let confirmDeleteActionSheet = UIActionSheet(title: "Are you sure you have completed the task:\n\"\(task.name)\"?", delegate: self, cancelButtonTitle: "Keep Task", destructiveButtonTitle: "Complete")
        confirmDeleteActionSheet.showInView(self.view)
    }
    
    // MARK: UIActionSheetDelegate methods
    func actionSheet(actionSheet: UIActionSheet, clickedButtonAtIndex buttonIndex: Int) {
        if buttonIndex == 0 {
            deleteTask()
        } else {
            self.tableView.reloadData()
            taskNeedingToBeDeleted = nil
        }
    }
    
    private func deleteTask() {
        if let task = taskNeedingToBeDeleted {
            managedObjectContext.deleteObject(task)
            managedObjectContext.save(nil)
            taskNeedingToBeDeleted = nil
        }
    }
    
    // MARK: NSFetchedResultsControllerDelegate Methods
    func controllerWillChangeContent(controller: NSFetchedResultsController) {
        tableView.beginUpdates()
    }
    
    func controller(controller: NSFetchedResultsController, didChangeObject anObject: AnyObject, atIndexPath indexPath: NSIndexPath?, forChangeType type: NSFetchedResultsChangeType, newIndexPath: NSIndexPath?) {
        switch type {
        case .Delete:
            if let deleteIndexPath = indexPath {
                let cell = tableView.cellForRowAtIndexPath(deleteIndexPath) as! TaskCell
                cell.isDeleted = true
                tableView.deleteRowsAtIndexPaths([deleteIndexPath], withRowAnimation: UITableViewRowAnimation.Fade)
            }
        case .Insert:
            if let insertIndexPath = newIndexPath {
                tableView.insertRowsAtIndexPaths([insertIndexPath], withRowAnimation: UITableViewRowAnimation.Fade)
            }
        case .Update:
            if let updateIndexPath = newIndexPath {
                let cell = tableView.cellForRowAtIndexPath(updateIndexPath) as! TaskCell
                let task = fetchedResultsController.objectAtIndexPath(updateIndexPath) as? TaskManaged
                
                cell.taskManaged = task
            }
        case .Move:
            if let deleteIndexPath = indexPath {
                tableView.deleteRowsAtIndexPaths([deleteIndexPath], withRowAnimation: UITableViewRowAnimation.Fade)
            }
            if let insertIndexPath = newIndexPath {
                tableView.insertRowsAtIndexPaths([insertIndexPath], withRowAnimation: UITableViewRowAnimation.Fade)
            }
        default:
            break
        }
    }
    
    func controllerDidChangeContent(controller: NSFetchedResultsController) {
        tableView.endUpdates()
    }
    
    // MARK: UIPopoverPresentationControllerDelegate Methods
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController!, traitCollection: UITraitCollection!) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.None
    }
    
    // MARK: OptionsDelegate Methods
    func didSetSortOrder(sender: OptionsController, selectedSortOrder: String) {
        sortDescriptorKey = selectedSortOrder
    }
    
    func didSetColorScheme(sender: OptionsController, selectedColorScheme: String) {
        colorScheme = selectedColorScheme
    }

    // MARK: Navigation Methods
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier {
            switch identifier {
            case StoryboardConstants.SegueIdentifiers.addTaskSegue:
                prepareForAddTaskSegue(sender, addSegue: segue)
            case StoryboardConstants.SegueIdentifiers.taskDetailsSegue:
                prepareForDetailsSegue(sender, detailsSegue: segue)
            case StoryboardConstants.SegueIdentifiers.optionsSegue:
                prepareForOptionsSegue(sender, optionsSegue: segue)
            default:
                break
            }
        }
    }
    
    private func prepareForAddTaskSegue(sender: AnyObject?, addSegue: UIStoryboardSegue) {
        if let destinationVC = addSegue.destinationViewController as? UINavigationController {
            if let taskEditorController = destinationVC.viewControllers[0] as? TaskEditorController {
                taskEditorController.managedObjectContext = self.managedObjectContext
                taskEditorController.title = UIConstants.Appearance.taskEditorTitleForAdd
                taskEditorController.colorScheme = colorScheme
            }
        }
    }
    
    private func prepareForDetailsSegue(sender: AnyObject?, detailsSegue: UIStoryboardSegue) {
        if let destinationVC = detailsSegue.destinationViewController as? TaskDetailsController {
            if let selectedIndex = self.tableView.indexPathForSelectedRow() {
                if let task = self.fetchedResultsController.objectAtIndexPath(selectedIndex) as? TaskManaged {
                    destinationVC.managedObjectContext = self.managedObjectContext
                    destinationVC.taskManaged = task
                    destinationVC.colorScheme = colorScheme
                    destinationVC.title = task.name
                    
                    self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .Plain, target: self, action: nil)
                }
            }
        }
    }
    
    private func prepareForOptionsSegue(sender: AnyObject?, optionsSegue: UIStoryboardSegue) {
        if let destinationVC = optionsSegue.destinationViewController as? OptionsController {
            if let popVC = destinationVC.popoverPresentationController {
                popVC.delegate = self
            }
            
            destinationVC.delegate = self
            destinationVC.colorScheme = colorScheme
            
            switch sortDescriptorKey {
            case CoreDataConstants.sortDescriptorKeyImportance:
                destinationVC.initialSortBySegmentedControlIndex = 0
            case CoreDataConstants.sortDescriptorKeyDueDate:
                destinationVC.initialSortBySegmentedControlIndex = 1
            case CoreDataConstants.sortDescriptorKeyCreatedDate:
                destinationVC.initialSortBySegmentedControlIndex = 2
            default:
                break
            }
            
            switch colorScheme {
            case UIConstants.Colors.ColorScheme.defaultScheme:
                destinationVC.initialColorSchemeSegmentedControlIndex = 0
            case UIConstants.Colors.ColorScheme.blueScheme:
                destinationVC.initialColorSchemeSegmentedControlIndex = 1
            case UIConstants.Colors.ColorScheme.redScheme:
                destinationVC.initialColorSchemeSegmentedControlIndex = 2
            default:
                break
            }
        }
    }
}
