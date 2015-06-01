//
//  ToDoItemsTableViewController.swift
//  ToDoList
//
//  Created by Steve Smart on 5/26/15.
//  Copyright (c) 2015 Steve Smart. All rights reserved.
//

import UIKit
import CoreData

class ToDoListTableViewController: UITableViewController, NSFetchedResultsControllerDelegate, UIActionSheetDelegate, UIPopoverPresentationControllerDelegate, OptionsDelegate {
    
    // MARK: - Properties
    var taskNeedingToBeDeleted: TaskManaged?
    var managedObjectContext: NSManagedObjectContext!
    var colorScheme = UIConstants.Colors.ColorScheme.Default.rawValue {
        didSet {
            let defaults = NSUserDefaults.standardUserDefaults()
            defaults.setObject(colorScheme, forKey: NSUserDefaultsConstants.colorSchemeKey)
            
            implementColorScheme()
            
            let numberOfSections = self.tableView.numberOfSections()
            for i in 0..<numberOfSections {
                let numberOfRows = self.tableView.numberOfRowsInSection(i)
                for j in 0..<numberOfRows {
                    let indexPath = NSIndexPath(forRow: j, inSection: i)
                    if let cell = self.tableView.cellForRowAtIndexPath(indexPath) as? TaskTableViewCell {
                        cell.colorScheme = colorScheme
                    }
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
    
    // MARK: - View Controller Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = NSUserDefaults.standardUserDefaults()
        if let sortMethod = defaults.stringForKey(NSUserDefaultsConstants.sortDescriptorKey) {
            sortDescriptorKey = sortMethod
        }
        if let cs = defaults.stringForKey(NSUserDefaultsConstants.colorSchemeKey) {
            colorScheme = cs
        }
        
        implementColorScheme()
        loadData()
    }
    
    private func implementColorScheme() {
        switch colorScheme {
        case UIConstants.Colors.ColorScheme.Default.rawValue:
            self.tableView.backgroundColor = UIConstants.Colors.DefaultColorScheme.mainBackgroundColor
            self.tableView.separatorColor = UIColor.blackColor()
            optionsButton.tintColor = UIConstants.Colors.DefaultColorScheme.optionsButtonColor
            newButton.tintColor = UIConstants.Colors.DefaultColorScheme.newButtonColor
            self.navigationController?.navigationBar.tintColor = UIConstants.Colors.DefaultColorScheme.backButtonColor
        case UIConstants.Colors.ColorScheme.Blue.rawValue:
            self.tableView.backgroundColor = UIConstants.Colors.BlueColorScheme.mainBackgroundColor
            self.tableView.separatorColor = UIColor.blackColor()
            optionsButton.tintColor = UIConstants.Colors.BlueColorScheme.optionsButtonColor
            newButton.tintColor = UIConstants.Colors.BlueColorScheme.newButtonColor
            self.navigationController?.navigationBar.tintColor = UIConstants.Colors.BlueColorScheme.backButtonColor
        default:
            println("printing from the default case of implementColorScheme in the ToDoListTableViewController class")
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
    }

    // MARK: - UITableViewDataSource Methods
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        let sections = fetchedResultsController.sections!
        
        return sections.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sections = fetchedResultsController.sections
        
        let currentSection = sections?[section] as! NSFetchedResultsSectionInfo
        
        return currentSection.numberOfObjects
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(StoryboardConstants.CellIdentifiers.prototypeCellID, forIndexPath: indexPath) as! TaskTableViewCell
        let task = fetchedResultsController.objectAtIndexPath(indexPath) as? TaskManaged
        
        cell.taskManaged = task
        cell.colorScheme = self.colorScheme

        return cell
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        switch editingStyle {
        case .Delete:
            let task = fetchedResultsController.objectAtIndexPath(indexPath) as! TaskManaged
            taskNeedingToBeDeleted = task
            confirmDeleteTask(task)
        default:
            println("printing from default case of tableView-commitEditingStyle method")
        }
    }
    
    private func confirmDeleteTask(task: TaskManaged) {
        let confirmDeleteActionSheet = UIActionSheet(title: "Are you certain you want to delete task: \(task.name)?", delegate: self, cancelButtonTitle: "Cancel", destructiveButtonTitle: "Delete")
        confirmDeleteActionSheet.showInView(self.view)
    }
    
    // MARK - UIActionSheetDelegate methods
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
    
    // MARK: - NSFetchedResultsControllerDelegate Methods
    func controllerWillChangeContent(controller: NSFetchedResultsController) {
        tableView.beginUpdates()
    }
    
    func controller(controller: NSFetchedResultsController, didChangeObject anObject: AnyObject, atIndexPath indexPath: NSIndexPath?, forChangeType type: NSFetchedResultsChangeType, newIndexPath: NSIndexPath?) {
        switch type {
        case .Delete:
            if let deleteIndexPath = indexPath {
                let cell = tableView.cellForRowAtIndexPath(deleteIndexPath) as! TaskTableViewCell
                cell.isDeleted = true
                tableView.deleteRowsAtIndexPaths([deleteIndexPath], withRowAnimation: UITableViewRowAnimation.Fade)
            }
        case .Insert:
            if let insertIndexPath = newIndexPath {
                tableView.insertRowsAtIndexPaths([insertIndexPath], withRowAnimation: UITableViewRowAnimation.Fade)
            }
        case .Update:
            if let updateIndexPath = newIndexPath {
                let cell = tableView.cellForRowAtIndexPath(updateIndexPath) as! TaskTableViewCell
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
            println("printing from default case of controller-didChangeObject-atIndexPath method in ToDoListTableViewController class")
        }
    }
    
    func controllerDidChangeContent(controller: NSFetchedResultsController) {
        tableView.endUpdates()
    }
    
    // MARK: - UIPopoverPresentationControllerDelegate Methods
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController!, traitCollection: UITraitCollection!) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.None
    }
    
    // MARK: - OptionsDelegate Methods
    func didSetSortOrder(sender: OptionsViewController, sortOrder: String) {
        self.sortDescriptorKey = sortOrder
    }
    
    func didSetColorScheme(sender: OptionsViewController, colorScheme: String) {
        self.colorScheme = colorScheme
    }

    // MARK: - Navigation Methods
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
                println("printing from the prepareForSegue method in the ToDoListTableViewController class")
            }
        }
    }
    
    private func prepareForAddTaskSegue(sender: AnyObject?, addSegue: UIStoryboardSegue) {
        if let destinationVC = addSegue.destinationViewController as? UINavigationController {
            if let taskEditorController = destinationVC.viewControllers[0] as? TaskEditorViewController {
                taskEditorController.managedObjectContext = self.managedObjectContext
                taskEditorController.taskManaged = nil
                taskEditorController.title = UIConstants.Appearance.taskEditorTitleForAdd
                taskEditorController.colorScheme = self.colorScheme
            }
        }
    }
    
    private func prepareForDetailsSegue(sender: AnyObject?, detailsSegue: UIStoryboardSegue) {
        if let destinationVC = detailsSegue.destinationViewController as? TaskDetailsViewController {
            if let selectedIndex = self.tableView.indexPathForSelectedRow() {
                if let task = self.fetchedResultsController.objectAtIndexPath(selectedIndex) as? TaskManaged {
                    destinationVC.managedObjectContext = self.managedObjectContext
                    destinationVC.taskManaged = task
                    destinationVC.colorScheme = self.colorScheme
                    
                    self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .Plain, target: self, action: nil)
                }
            }
        }
    }
    
    private func prepareForOptionsSegue(sender: AnyObject?, optionsSegue: UIStoryboardSegue) {
        if let destinationVC = optionsSegue.destinationViewController as? OptionsViewController {
            if let popVC = destinationVC.popoverPresentationController {
                popVC.delegate = self
            }
            
            destinationVC.delegate = self
            destinationVC.colorScheme = self.colorScheme
            
            switch sortDescriptorKey {
            case CoreDataConstants.sortDescriptorKeyImportance:
                destinationVC.initialSortBySegmentedControlIndex = 0
            case CoreDataConstants.sortDescriptorKeyDueDate:
                destinationVC.initialSortBySegmentedControlIndex = 1
            case CoreDataConstants.sortDescriptorKeyCreatedDate:
                destinationVC.initialSortBySegmentedControlIndex = 2
            default:
                println("printing from default case (sortDescriptoryKey) of the prepareForOptionsSegue method in the ToDoListTableViewController class")
            }
            
            switch colorScheme {
            case UIConstants.Colors.ColorScheme.Default.rawValue:
                destinationVC.initialColorSchemeSegmentedControlIndex = 0
            case UIConstants.Colors.ColorScheme.Blue.rawValue:
                destinationVC.initialColorSchemeSegmentedControlIndex = 1
            // 3rd case
            default:
                println("printing from the default case (colorScheme) of the prepareForOptionsSegue method in the ToDoListTableViewController class")
            }
        }
    }
}
