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
    var initialSortBySegmentedControlIndex = 0
    var initialColorSchemeSegmentedControlIndex = 0
    var colorScheme = UIConstants.Colors.ColorScheme.Default.rawValue
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
    
    @IBOutlet weak var sortByLabel: UILabel!
    @IBOutlet weak var sortBySegmentedControl: UISegmentedControl!
    @IBOutlet weak var colorSchemeLabel: UILabel!
    @IBOutlet weak var colorSchemeSegmentedControl: UISegmentedControl!
    @IBOutlet weak var dismissButton: UIButton!
    
    // MARK: - View Controller Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        implementColorScheme()
        sortBySegmentedControl.selectedSegmentIndex = initialSortBySegmentedControlIndex
        colorSchemeSegmentedControl.selectedSegmentIndex = initialColorSchemeSegmentedControlIndex
    }
    
    private func implementColorScheme() {
        switch colorScheme {
        case UIConstants.Colors.ColorScheme.Default.rawValue:
            self.view.backgroundColor = UIConstants.Colors.DefaultColorScheme.secondaryBackgroundColor
            sortByLabel.textColor = UIConstants.Colors.DefaultColorScheme.sortByLabelColor
            dismissButton.tintColor = UIConstants.Colors.DefaultColorScheme.dismissButtonColor
            colorSchemeLabel.textColor = UIConstants.Colors.DefaultColorScheme.colorSchemeLabelColor
        case UIConstants.Colors.ColorScheme.Blue.rawValue:
            self.view.backgroundColor = UIConstants.Colors.BlueColorScheme.secondaryBackgroundColor
            sortByLabel.textColor = UIConstants.Colors.BlueColorScheme.sortByLabelColor
            dismissButton.tintColor = UIConstants.Colors.BlueColorScheme.dismissButtonColor
            colorSchemeLabel.textColor = UIConstants.Colors.BlueColorScheme.colorSchemeLabelColor
        default:
            println("printing from the default case of the implementColorScheme method in the OptionsViewController clasas")
        }
    }
    
    // MARK: - Action Methods
    @IBAction func sortOrderChanged(sender: UISegmentedControl) {
        switch sortBySegmentedControl.selectedSegmentIndex {
        case 0:
            delegate?.didSetSortOrder(self, sortOrder: CoreDataConstants.sortDescriptorKeyImportance)
        case 1:
            delegate?.didSetSortOrder(self, sortOrder: CoreDataConstants.sortDescriptorKeyDueDate)
        case 2:
            delegate?.didSetSortOrder(self, sortOrder: CoreDataConstants.sortDescriptorKeyCreatedDate)
        default:
            println("printing from the sortOrderChanged method in the OptionsViewController class")
        }
    }
    
    @IBAction func colorSchemeChanged(sender: UISegmentedControl) {
        switch colorSchemeSegmentedControl.selectedSegmentIndex {
        case 0:
            let cs = UIConstants.Colors.ColorScheme.Default.rawValue
            colorScheme = cs
            implementColorScheme()
            delegate?.didSetColorScheme(self, colorScheme: cs)
        case 1:
            let cs = UIConstants.Colors.ColorScheme.Blue.rawValue
            colorScheme = cs
            implementColorScheme()
            delegate?.didSetColorScheme(self, colorScheme: cs)
        case 2:
            println("Not implemented Yet")
        default:
            println("printing from the default case in the colorSchemeChanged method in the OptionsViewController class")
        }
    }
    
    @IBAction func dismissButtonTapped(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
