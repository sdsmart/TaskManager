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
    var colorScheme = UIConstants.Colors.ColorScheme.Default
    var taskNeedingToBeDeleted: TaskManaged?
    var managedObjectContext: NSManagedObjectContext!
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
        
        implementColorScheme()
        loadData()
    }
    
    private func implementColorScheme() {
        self.navigationController?.navigationBar.tintColor = UIConstants.Colors.DefaultColorScheme.backButtonColor
        self.tableView.backgroundColor = UIConstants.Colors.DefaultColorScheme.mainBackgroundColor
        self.tableView.separatorColor = UIColor.blackColor()
        optionsButton.tintColor = UIConstants.Colors.DefaultColorScheme.optionsButtonColor
        newButton.tintColor = UIConstants.Colors.DefaultColorScheme.newButtonColor
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
        sortDescriptorKey = sortOrder
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
            }
        }
    }
    
    private func prepareForDetailsSegue(sender: AnyObject?, detailsSegue: UIStoryboardSegue) {
        if let destinationVC = detailsSegue.destinationViewController as? TaskDetailsViewController {
            if let selectedIndex = self.tableView.indexPathForSelectedRow() {
                if let task = self.fetchedResultsController.objectAtIndexPath(selectedIndex) as? TaskManaged {
                    destinationVC.managedObjectContext = self.managedObjectContext
                    destinationVC.taskManaged = task
                    
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
            
            switch sortDescriptorKey {
            case CoreDataConstants.sortDescriptorKeyImportance:
                destinationVC.initialSegmentedControlIndex = 0
            case CoreDataConstants.sortDescriptorKeyDueDate:
                destinationVC.initialSegmentedControlIndex = 1
            case CoreDataConstants.sortDescriptorKeyCreatedDate:
                destinationVC.initialSegmentedControlIndex = 2
            default:
                println("printing from default case of the prepareForOptionsSegue method in the ToDoListTableViewController class")
            }
        }
    }
}
