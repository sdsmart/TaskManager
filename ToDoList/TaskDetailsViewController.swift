//
//  ToDoItemDetailsViewController.swift
//  ToDoList
//
//  Created by Steve Smart on 5/27/15.
//  Copyright (c) 2015 Steve Smart. All rights reserved.
//

import UIKit
import CoreData

class TaskDetailsViewController: UIViewController {

    // MARK: Properties
    var managedObjectContext: NSManagedObjectContext!
    var taskManaged: TaskManaged? = nil
    var colorScheme = UIConstants.Colors.ColorScheme.defaultScheme
    
    @IBOutlet weak var importanceLabel: UILabel!
    @IBOutlet weak var createdDateLabel: UILabel!
    @IBOutlet weak var dueDateLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var importanceValueLabel: UILabel!
    @IBOutlet weak var detailsTextView: UITextView!
    @IBOutlet weak var createdDateValueLabel: UILabel!
    @IBOutlet weak var dueDateValueLabel: UILabel!
    @IBOutlet weak var editButton: UIBarButtonItem!
    
    // MARK: View Controller Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialViewSetup()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        updateUI()
    }
    
    private func initialViewSetup() {
        implementColorCheme()
        
        detailsTextView.layer.borderWidth = UIConstants.Appearance.textViewBorderWidth
        detailsTextView.layer.borderColor = UIColor.blackColor().CGColor
        detailsTextView.layer.cornerRadius = UIConstants.Appearance.textViewBorderRadius
        detailsTextView.clipsToBounds = true
    }
    
    private func implementColorCheme() {
        func implementColorSchemeHelper(scheme: ColorSchemeProtocol) {
            self.view.backgroundColor = scheme.mainBackgroundColor
            detailsTextView.backgroundColor = scheme.secondaryBackgroundColor
            
            importanceLabel.textColor = scheme.labelColor
            createdDateLabel.textColor = scheme.labelColor
            dueDateLabel.textColor = scheme.labelColor
            detailsLabel.textColor = scheme.labelColor
            editButton.tintColor = scheme.buttonColor
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
    
    private func updateUI() {
        if taskManaged != nil {
            updateImportanceTextColor()
            
            let createdDate = getStringFromDate(taskManaged!.createdDate)
            let dueDate = getStringFromDate(taskManaged!.dueDate)
            
            createdDateValueLabel.text = createdDate
            dueDateValueLabel.text = dueDate
            importanceValueLabel.text = "\(taskManaged!.importance)"
            detailsTextView.text = taskManaged!.details
        }
    }
    
    private func updateImportanceTextColor() {
        if let importance = taskManaged?.importance {
            switch importance {
            case 8...10:
                importanceValueLabel.textColor = UIConstants.Colors.highImportanceColor
            case 4...7:
                importanceValueLabel.textColor = UIConstants.Colors.mediumImportanceColor
            case 1...3:
                importanceValueLabel.textColor = UIConstants.Colors.lowImportanceColor
            default:
                break
            }
        }
    }
    
    // MARK: Navigation Methods
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier {
            switch identifier {
            case StoryboardConstants.SegueIdentifiers.editTaskSegue:
                if let destinationVC = segue.destinationViewController as? UINavigationController {
                    if let taskEditorController = destinationVC.viewControllers[0] as? TaskEditorViewController {
                        taskEditorController.managedObjectContext = self.managedObjectContext
                        if taskManaged != nil {
                            taskEditorController.taskManaged = taskManaged!
                            taskEditorController.title = UIConstants.Appearance.taskEditorTitleForEdit
                            taskEditorController.colorScheme = self.colorScheme
                            taskEditorController.dueDate = taskManaged!.dueDate
                        }
                    }
                }
            default:
                break
            }
        }
    }
}
