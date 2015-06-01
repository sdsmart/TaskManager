//
//  AddToDoItemViewController.swift
//  ToDoList
//
//  Created by Steve Smart on 5/26/15.
//  Copyright (c) 2015 Steve Smart. All rights reserved.
//

import UIKit
import CoreData

class TaskEditorViewController: UIViewController, UITextViewDelegate {

    // MARK: - Properties
    var managedObjectContext: NSManagedObjectContext!
    var taskManaged: TaskManaged? = nil
    var viewNeedsToAnimate: Bool = false
    var colorScheme = UIConstants.Colors.ColorScheme.defaultScheme
    
    @IBOutlet weak var nameHeaderLabel: UILabel!
    @IBOutlet weak var importanceHeaderLabel: UILabel!
    @IBOutlet weak var lowImportanceLabel: UILabel!
    @IBOutlet weak var highImportanceLabel: UILabel!
    @IBOutlet weak var detailsHeaderLabel: UILabel!
    @IBOutlet weak var dueDateHeaderLabel: UILabel!
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var importanceSlider: UISlider!
    @IBOutlet weak var importanceLabel: UILabel!
    @IBOutlet weak var detailsTextView: UITextView!
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    @IBOutlet var swipeGestureRecognizer: UISwipeGestureRecognizer!
    @IBOutlet var tapGestureRecognizer: UITapGestureRecognizer!
    
    // MARK: - View Controller Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialViewSetup()
        updateUI()
    }
    
    private func initialViewSetup() {
        implementColorScheme()
        
        swipeGestureRecognizer.addTarget(self, action: "swipeGestureReceived")
        tapGestureRecognizer.addTarget(self, action: "tapGestureReceived")
        
        detailsTextView.layer.borderWidth = CGFloat(0.5)
        detailsTextView.layer.borderColor = UIColor.blackColor().CGColor
        detailsTextView.layer.cornerRadius = 4
        detailsTextView.clipsToBounds = true
        detailsTextView.delegate = self
        
        lowImportanceLabel.textColor = UIConstants.Colors.lowImportanceColor
        highImportanceLabel.textColor = UIConstants.Colors.highImportanceColor
    }
    
    private func implementColorScheme() {
        func implementColorSchemeHelper(scheme: ColorSchemeProtocol) {
            self.view.backgroundColor = scheme.mainBackgroundColor
            nameTextField.backgroundColor = scheme.secondaryBackgroundColor
            detailsTextView.backgroundColor = scheme.secondaryBackgroundColor
            importanceSlider.tintColor = UIColor.blackColor()
            
            nameHeaderLabel.textColor = scheme.nameLabelColor
            importanceHeaderLabel.textColor = scheme.importanceLabelColor
            detailsHeaderLabel.textColor = scheme.detailsLabelColor
            dueDateHeaderLabel.textColor = scheme.dueDateLabelColor
            cancelButton.tintColor = scheme.cancelButtonColor
            saveButton.tintColor = scheme.saveButtonColor
        }
        
        switch colorScheme {
        case UIConstants.Colors.ColorScheme.defaultScheme:
            implementColorSchemeHelper(UIConstants.Colors.DefaultColorScheme())
        case UIConstants.Colors.ColorScheme.blueScheme:
            implementColorSchemeHelper(UIConstants.Colors.BlueColorScheme())
        case UIConstants.Colors.ColorScheme.redScheme:
            implementColorSchemeHelper(UIConstants.Colors.RedColorScheme())
        default:
            println("printing from the default case of the implementColorScheme method in the TaskEditorViewController class")
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        updateUI()
    }
    
    private func updateUI() {
        if taskManaged != nil {
            importanceLabel.text = "\(taskManaged!.importance)"
            importanceSlider.value = Float(taskManaged!.importance)
            nameTextField.text = taskManaged!.name
            detailsTextView.text = taskManaged!.details
        }
        updateImportanceTextColor()
    }
    
    private func updateImportanceTextColor() {
        let importance = Int(importanceSlider.value)
        switch importance {
        case 8...10:
            importanceLabel.textColor = UIConstants.Colors.highImportanceColor
        case 4...7:
            importanceLabel.textColor = UIConstants.Colors.mediumImportanceColor
        case 1...3:
            importanceLabel.textColor = UIConstants.Colors.lowImportanceColor
        default:
            println("printing from the default case of the updateImportanceTextColor method in the TaskEditorViewController class")
        }
    }
    
    private func updateImportanceLabel()
    {
        updateImportanceTextColor()
        let importance = Int(round(importanceSlider.value))
        importanceLabel.text = "\(importance)"
        importanceSlider.value = Float(importance)
    }
    
    // MARK: - Gesture Recognizer Actions
    func swipeGestureReceived() {
        detailsTextView.resignFirstResponder()
        nameTextField.resignFirstResponder()
    }
    
    func tapGestureReceived() {
        detailsTextView.resignFirstResponder()
        nameTextField.resignFirstResponder()
    }
    
    // MARK: - UITextViewDelegate Methods
    func textViewDidBeginEditing(textView: UITextView) {
        animateViewWithKeyboard(up: true)
    }
    
    func textViewDidEndEditing(textView: UITextView) {
        animateViewWithKeyboard(up: false)
    }
    
    private func animateViewWithKeyboard(#up: Bool) {
        if up {
            UIView.animateWithDuration(UIConstants.Animation.keyboardSlideViewAnimationUpDuration, animations: { () -> Void in
                self.view.frame.origin.y -= (self.detailsLabel.frame.origin.y - UIConstants.Animation.keyboardSlideAnimationDistanceOffset)
            })
        } else {
            UIView.animateWithDuration(UIConstants.Animation.keyboardSlideViewAnimationDownDuration, animations: { () -> Void in
                self.view.frame.origin.y += (self.detailsLabel.frame.origin.y - UIConstants.Animation.keyboardSlideAnimationDistanceOffset)
            })
        }
    }
    
    // MARK: Action Methods
    @IBAction func valueChanged(sender: UISlider) {
        updateImportanceLabel()
    }
    
    @IBAction func saveButtonTapped(sender: UIBarButtonItem) {
        if !nameTextField.text.isEmpty {
            if taskManaged != nil {
                taskManaged!.dueDate = dueDatePicker.date
                taskManaged!.name = nameTextField.text
                taskManaged!.details = detailsTextView.text
                taskManaged!.importance = importanceLabel.text!.toInt()!
            } else {
                let task = NSEntityDescription.insertNewObjectForEntityForName(CoreDataConstants.taskEntityName, inManagedObjectContext: managedObjectContext) as! TaskManaged
                
                task.dueDate = dueDatePicker.date
                task.createdDate = NSDate()
                task.name = nameTextField.text
                task.details = detailsTextView.text
                task.importance = importanceLabel.text!.toInt()!
            }
            managedObjectContext.save(nil)
            
            self.view.endEditing(true)
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    @IBAction func cancelButtonTapped(sender: UIBarButtonItem) {
        self.view.endEditing(true)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
