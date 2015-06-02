//
//  DatePickerViewController.swift
//  ToDoList
//
//  Created by Steve Smart on 6/1/15.
//  Copyright (c) 2015 Steve Smart. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {

    // MARK: Properties
    var delegate: DueDatePickerDelegate?
    var colorScheme = UIConstants.Colors.ColorScheme.defaultScheme
    
    override var preferredContentSize: CGSize {
        get {
            if presentingViewController != nil {
                let pickerSize = dueDatePicker.sizeThatFits(CGSizeZero)
                let size = CGSize(width: pickerSize.width, height: CGFloat(pickerSize.height + 50.0))
                return size
            } else {
                return super.preferredContentSize
            }
        } set {
            super.preferredContentSize = newValue
        }
    }
    
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    @IBOutlet weak var saveButton: UIButton!
    
    // MARK: View Controller Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        implementColorScheme()
    }
    
    private func implementColorScheme() {
        func implementColorSchemeHelper(scheme: ColorSchemeProtocol) {
            self.view.backgroundColor = scheme.secondaryBackgroundColor
            
            saveButton.tintColor = scheme.dueDateSaveButtonColor
        }
        
        switch colorScheme {
        case UIConstants.Colors.ColorScheme.defaultScheme:
            implementColorSchemeHelper(UIConstants.Colors.DefaultColorScheme())
        case UIConstants.Colors.ColorScheme.blueScheme:
            implementColorSchemeHelper(UIConstants.Colors.BlueColorScheme())
        case UIConstants.Colors.ColorScheme.redScheme:
            implementColorSchemeHelper(UIConstants.Colors.RedColorScheme())
        default:
            println("printing from the default case of the implementColorScheme method in the DatePickerViewController class")
        }
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        delegate?.didSelectDueDate(self, selectedDueDate: dueDatePicker.date)
    }
    
    // MARK: Action Methods
    @IBAction func saveButtonTapped(sender: UIButton) {
        delegate?.didSelectDueDate(self, selectedDueDate: dueDatePicker.date)
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
