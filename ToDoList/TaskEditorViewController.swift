//
//  AddToDoItemViewController.swift
//  ToDoList
//
//  Created by Steve Smart on 5/26/15.
//  Copyright (c) 2015 Steve Smart. All rights reserved.
//

import UIKit
import CoreData

class TaskEditorViewController: UIViewController, UITextViewDelegate, UIPopoverPresentationControllerDelegate, DatePickerDelegate {

    // MARK: Properties
    var managedObjectContext: NSManagedObjectContext!
    var taskManaged: TaskManaged? = nil
    var colorScheme = UIConstants.Colors.ColorScheme.defaultScheme
    var dueDate: NSDate? = nil
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var importanceLabel: UILabel!
    @IBOutlet weak var lowImportanceLabel: UILabel!
    @IBOutlet weak var highImportanceLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var dueDateLabel: UILabel!
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var changeButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var importanceSlider: UISlider!
    @IBOutlet weak var importanceValueLabel: UILabel!
    @IBOutlet weak var dueDateValueLabel: UILabel!
    @IBOutlet weak var detailsTextView: UITextView!
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
        
        if dueDate != nil {
            dueDateValueLabel.text = NSDateFormatter.getStringFromDateWithoutYear(dueDate!)
        } else {
            let currentDate = NSDate()
            let currentDatePlusOneDay = currentDate.dateByAddingTimeInterval(86400)
            dueDate = currentDatePlusOneDay
            dueDateValueLabel.text = NSDateFormatter.getStringFromDateWithoutYear(currentDatePlusOneDay)
        }
        
        lowImportanceLabel.textColor = UIConstants.Colors.lowImportanceColor
        highImportanceLabel.textColor = UIConstants.Colors.highImportanceColor
    }
    
    private func implementColorScheme() {
        func implementColorSchemeHelper(scheme: ColorSchemeProtocol) {
            self.view.backgroundColor = scheme.mainBackgroundColor
            nameTextField.backgroundColor = scheme.secondaryBackgroundColor
            detailsTextView.backgroundColor = scheme.secondaryBackgroundColor
            importanceSlider.tintColor = UIColor.blackColor()
            
            nameLabel.textColor = scheme.labelColor
            importanceLabel.textColor = scheme.labelColor
            detailsLabel.textColor = scheme.labelColor
            cancelButton.tintColor = scheme.buttonColor
            saveButton.tintColor = scheme.buttonColor
            
            dueDateLabel.textColor = scheme.labelColor
            changeButton.tintColor = scheme.buttonColor
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
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        updateUI()
    }
    
    private func updateUI() {
        if taskManaged != nil {
            importanceValueLabel.text = "\(taskManaged!.importance)"
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
            importanceValueLabel.textColor = UIConstants.Colors.highImportanceColor
        case 4...7:
            importanceValueLabel.textColor = UIConstants.Colors.mediumImportanceColor
        case 1...3:
            importanceValueLabel.textColor = UIConstants.Colors.lowImportanceColor
        default:
            break
        }
    }
    
    private func updateImportanceValueLabelToSliderValue(sliderValue: Int)
    {
        let importance = sliderValue
        importanceValueLabel.text = "\(importance)"
        importanceSlider.value = Float(importance)
        updateImportanceTextColor()
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
    
    // MARK: DatePickerDelegate Methods
    func didSelectDate(sender: DatePickerViewController, selectedDate: NSDate) {
        dueDate = selectedDate
        
        let dueDateText = NSDateFormatter.getStringFromDateWithoutYear(selectedDate)
        dueDateValueLabel.text = dueDateText
    }
    
    // MARK: Action Methods
    @IBAction func sliderValueChanged(sender: UISlider) {
        let sliderValue = Int(round(importanceSlider.value))
        updateImportanceValueLabelToSliderValue(sliderValue)
    }
    
    @IBAction func saveButtonTapped(sender: UIBarButtonItem) {
        if !nameTextField.text.isEmpty {
            if taskManaged != nil {
                
                if dueDate != nil {
                    taskManaged!.dueDate = dueDate!
                }
                taskManaged!.name = nameTextField.text
                taskManaged!.details = detailsTextView.text
                taskManaged!.importance = importanceValueLabel.text!.toInt()!
                
                removeLocalNotificationForExistingTask(taskManaged!)
                addLocalNotificationsForTask(taskManaged!)
            } else {
                let task = NSEntityDescription.insertNewObjectForEntityForName(CoreDataConstants.taskEntityName, inManagedObjectContext: managedObjectContext) as! TaskManaged
                
                if dueDate != nil {
                    task.dueDate = dueDate!
                }
                task.uuid = NSUUID().UUIDString
                task.name = nameTextField.text
                task.createdDate = NSDate()
                task.details = detailsTextView.text
                task.importance = importanceValueLabel.text!.toInt()!
                
                addLocalNotificationsForTask(task)
            }
            managedObjectContext.save(nil)
            
            self.view.endEditing(true)
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    private func addLocalNotificationsForTask(task: TaskManaged) {
        var overDueNotification = UILocalNotification()
        overDueNotification.alertBody = "Task: \"\(task.name)\" Is Overdue!"
        overDueNotification.alertAction = "open"
        overDueNotification.fireDate = task.dueDate
        overDueNotification.soundName = UILocalNotificationDefaultSoundName
        overDueNotification.userInfo = ["uuid": task.uuid]
        UIApplication.sharedApplication().scheduleLocalNotification(overDueNotification)
        
        var oneDayRemainingNotification = UILocalNotification()
        oneDayRemainingNotification.alertBody = "Task: \"\(task.name)\" Is Due In 24 Hours."
        oneDayRemainingNotification.alertAction = "open"
        oneDayRemainingNotification.fireDate = task.dueDate.dateByAddingTimeInterval(-86400)
        oneDayRemainingNotification.soundName = UILocalNotificationDefaultSoundName
        oneDayRemainingNotification.userInfo = ["uuid": task.uuid]
        UIApplication.sharedApplication().scheduleLocalNotification(oneDayRemainingNotification)
    }
    
    private func removeLocalNotificationForExistingTask(task: TaskManaged) {
        var app:UIApplication = UIApplication.sharedApplication()
        for event in app.scheduledLocalNotifications {
            var notification = event as! UILocalNotification
            let userInfoCurrent = notification.userInfo as! Dictionary<String,String>
            let uuid = userInfoCurrent["uuid"]
            if uuid == task.uuid {
                app.cancelLocalNotification(notification)
                break;
            }
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
                    destinationVC.minimumDate = NSDate().dateByAddingTimeInterval(60)
                    if dueDate != nil {
                        destinationVC.initialDate = dueDate!
                    }
                }
            default:
                break
            }
        }
    }
}
