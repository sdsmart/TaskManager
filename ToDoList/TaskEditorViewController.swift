//
//  AddToDoItemViewController.swift
//  ToDoList
//
//  Created by Steve Smart on 5/26/15.
//  Copyright (c) 2015 Steve Smart. All rights reserved.
//

import UIKit
import CoreData

class TaskEditorViewController: UIViewController, UITextViewDelegate, UIPopoverPresentationControllerDelegate, DueDatePickerDelegate {

    // MARK: Properties
    var managedObjectContext: NSManagedObjectContext!
    var taskManaged: TaskManaged? = nil
    var viewNeedsToAnimate: Bool = false
    var colorScheme = UIConstants.Colors.ColorScheme.defaultScheme
    var dueDate = NSDate()
    
    @IBOutlet weak var nameHeaderLabel: UILabel!
    @IBOutlet weak var importanceHeaderLabel: UILabel!
    @IBOutlet weak var lowImportanceLabel: UILabel!
    @IBOutlet weak var highImportanceLabel: UILabel!
    @IBOutlet weak var detailsHeaderLabel: UILabel!
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var selectDueDateButton: UIButton!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var importanceSlider: UISlider!
    @IBOutlet weak var importanceLabel: UILabel!
    @IBOutlet weak var dueDateLabel: UILabel!
    @IBOutlet weak var detailsTextView: UITextView!
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet var swipeGestureRecognizer: UISwipeGestureRecognizer!
    @IBOutlet var tapGestureRecognizer: UITapGestureRecognizer!
    
    // MARK: View Controller Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialViewSetup()
        updateUI()
    }
    
    private func initialViewSetup() {
        implementColorScheme()
        
        swipeGestureRecognizer.addTarget(self, action: "swipeGestureReceived")
        tapGestureRecognizer.addTarget(self, action: "tapGestureReceived")
        
        detailsTextView.layer.borderWidth = UIConstants.Appearance.textViewBorderWidth
        detailsTextView.layer.borderColor = UIColor.blackColor().CGColor
        detailsTextView.layer.cornerRadius = UIConstants.Appearance.textViewBorderRadius
        detailsTextView.clipsToBounds = true
        detailsTextView.delegate = self
        
        dueDateLabel.text = getStringFromDate(dueDate)
        
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
            cancelButton.tintColor = scheme.cancelButtonColor
            saveButton.tintColor = scheme.saveButtonColor
            selectDueDateButton.tintColor = scheme.selectDueDateButtonColor
            dueDateLabel.textColor = scheme.dueDateTextColor
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
    
    // MARK: Gesture Recognizer Methods
    func swipeGestureReceived() {
        detailsTextView.resignFirstResponder()
        nameTextField.resignFirstResponder()
    }
    
    func tapGestureReceived() {
        detailsTextView.resignFirstResponder()
        nameTextField.resignFirstResponder()
    }
    
    // MARK: UITextViewDelegate Methods
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
    
    // MARK: UIPopoverPresentationControllerDelegate Methods
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController!, traitCollection: UITraitCollection!) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.None
    }
    
    // MARK: DueDatePickerDelegate Methods
    func didSelectDueDate(sender: DatePickerViewController, selectedDueDate: NSDate) {
        dueDate = selectedDueDate
        
        let dueDateText = getStringFromDate(selectedDueDate)
        dueDateLabel.text = dueDateText
    }
    
    private func getStringFromDate(date: NSDate) -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.LongStyle
        dateFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
        let dueDateText = dateFormatter.stringFromDate(date)
        let stringLength = count(dueDateText)
        var ierror: NSError?
        var regex: NSRegularExpression = NSRegularExpression(pattern: ",\\s\\d+",
                                        options: NSRegularExpressionOptions.CaseInsensitive,
                                        error: &ierror)!
        var dueDateTextWithoutYear = regex.stringByReplacingMatchesInString(dueDateText,
                    options: nil, range: NSMakeRange(0, stringLength), withTemplate: "")
        return dueDateTextWithoutYear
    }
    
    // MARK: Action Methods
    @IBAction func valueChanged(sender: UISlider) {
        updateImportanceLabel()
    }
    
    @IBAction func saveButtonTapped(sender: UIBarButtonItem) {
        if !nameTextField.text.isEmpty {
            if taskManaged != nil {
                
                taskManaged!.dueDate = dueDate
                taskManaged!.name = nameTextField.text
                taskManaged!.details = detailsTextView.text
                taskManaged!.importance = importanceLabel.text!.toInt()!
            } else {
                let task = NSEntityDescription.insertNewObjectForEntityForName(CoreDataConstants.taskEntityName, inManagedObjectContext: managedObjectContext) as! TaskManaged
                
                task.dueDate = dueDate
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
    
    // MARK: Navigation Methods
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier {
            switch identifier {
            case StoryboardConstants.SegueIdentifiers.pickDateSegue:
                if let destinationVC = segue.destinationViewController as? DatePickerViewController {
                    if let popVC = destinationVC.popoverPresentationController {
                        popVC.delegate = self
                    }
                    
                    destinationVC.delegate = self
                    destinationVC.colorScheme = colorScheme
                }
            default:
                println("printing from the default case of the prepareForSegue method in the TaskEditorViewController class")
            }
        }
    }
}
