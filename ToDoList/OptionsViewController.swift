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
    var parentVC: UIViewController?
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
    
    // MARK: - View Controller Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        sortBySegmentedControl.selectedSegmentIndex = initialSegmentedControlIndex
        self.view.backgroundColor = UIConstants.Colors.secondaryBackgroundColor
    }
    
    // MARK: - Action Methods
    @IBAction func valueChanged(sender: UISegmentedControl) {
        switch sortBySegmentedControl.selectedSegmentIndex {
        case 0:
            registerSortDescriptor(CoreDataConstants.sortDescriptorKeyImportance)
        case 1:
            registerSortDescriptor(CoreDataConstants.sortDescriptorKeyDueDate)
        case 2:
            registerSortDescriptor(CoreDataConstants.sortDescriptorKeyCreatedDate)
        default:
            println("printing from the valueChanged method in the OptionsViewController class")
        }
    }
    
    private func registerSortDescriptor(sortDescriptorKey: String) {
        if let pvc = parentVC as? ToDoListTableViewController {
            pvc.sortDescriptorKey = sortDescriptorKey
        }
    }
    
    @IBAction func dismissButtonTapped(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
