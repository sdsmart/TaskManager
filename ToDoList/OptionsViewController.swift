//
//  OptionsViewController.swift
//  ToDoList
//
//  Created by Steve Smart on 5/30/15.
//  Copyright (c) 2015 Steve Smart. All rights reserved.
//

import UIKit

class OptionsViewController: UIViewController {
    
    // MARK: - Properties
    var delegate: OptionsDelegate?
    
    var initialSegmentedControlIndex = 0
    override var preferredContentSize: CGSize {
        get {
            if presentingViewController != nil {
                return UIConstants.Appearance.optionsViewControllerSize
            } else {
                return super.preferredContentSize
            }
        } set {
            super.preferredContentSize = newValue
        }
    }
    
    @IBOutlet weak var sortBySegmentedControl: UISegmentedControl!
    @IBOutlet weak var sortByLabel: UILabel!
    @IBOutlet weak var dismissButton: UIButton!
    
    // MARK: - View Controller Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        implementColorScheme()
        sortBySegmentedControl.selectedSegmentIndex = initialSegmentedControlIndex
    }
    
    private func implementColorScheme() {
        self.view.backgroundColor = UIConstants.Colors.DefaultColorScheme.secondaryBackgroundColor
        sortByLabel.textColor = UIConstants.Colors.DefaultColorScheme.sortByLabelColor
        dismissButton.tintColor = UIConstants.Colors.DefaultColorScheme.dismissButtonColor
    }
    
    // MARK: - Action Methods
    @IBAction func valueChanged(sender: UISegmentedControl) {
        switch sortBySegmentedControl.selectedSegmentIndex {
        case 0:
            delegate?.didSetSortOrder(self, sortOrder: CoreDataConstants.sortDescriptorKeyImportance)
        case 1:
            delegate?.didSetSortOrder(self, sortOrder: CoreDataConstants.sortDescriptorKeyDueDate)
        case 2:
            delegate?.didSetSortOrder(self, sortOrder: CoreDataConstants.sortDescriptorKeyCreatedDate)
        default:
            println("printing from the valueChanged method in the OptionsViewController class")
        }
    }
    
    @IBAction func dismissButtonTapped(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
