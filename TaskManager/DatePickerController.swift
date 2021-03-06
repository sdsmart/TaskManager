//
//  DatePickerViewController.swift
//  ToDoList
//
//  Created by Steve Smart on 6/1/15.
//  Copyright (c) 2015 Steve Smart. All rights reserved.
//

import UIKit

class DatePickerController: UIViewController {

    // MARK: Properties
    var delegate: DatePickerDelegate?
    var colorScheme = UIConstants.Colors.ColorScheme.defaultScheme
    var initialDate: NSDate?
    var minimumDate: NSDate?
    
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
        
        if initialDate != nil {
            dueDatePicker.date = initialDate!
        }
        if minimumDate != nil {
            dueDatePicker.minimumDate = minimumDate
        }
        implementColorScheme()
    }
    
    private func implementColorScheme() {
        func implementColorSchemeHelper(scheme: ColorSchemeProtocol) {
            self.view.backgroundColor = scheme.secondaryBackgroundColor
            
            saveButton.tintColor = scheme.buttonColor
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
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        delegate?.didSelectDate(self, selectedDate: dueDatePicker.date)
    }
    
    // MARK: Action Methods
    @IBAction func saveButtonTapped(sender: UIButton) {
        delegate?.didSelectDate(self, selectedDate: dueDatePicker.date)
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
