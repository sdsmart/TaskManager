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
    var colorScheme = UIConstants.Colors.ColorScheme.defaultScheme
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
        func implementColorSchemeHelper(scheme: ColorSchemeProtocol) {
            self.view.backgroundColor = scheme.secondaryBackgroundColor
            sortByLabel.textColor = scheme.sortByLabelColor
            dismissButton.tintColor = scheme.dismissButtonColor
            colorSchemeLabel.textColor = scheme.colorSchemeLabelColor
        }
        
        switch colorScheme {
        case UIConstants.Colors.ColorScheme.defaultScheme:
            implementColorSchemeHelper(UIConstants.Colors.DefaultColorScheme())
        case UIConstants.Colors.ColorScheme.blueScheme:
            implementColorSchemeHelper(UIConstants.Colors.BlueColorScheme())
        case UIConstants.Colors.ColorScheme.redScheme:
            implementColorSchemeHelper(UIConstants.Colors.RedColorScheme())
        default:
            println("printing from the default case of the implementColorScheme method in the OptionsViewController clasas")
        }
    }
    
    // MARK: - Action Methods
    @IBAction func sortOrderChanged(sender: UISegmentedControl) {
        switch sortBySegmentedControl.selectedSegmentIndex {
        case 0:
            delegate?.didSetSortOrder(self, selectedSortOrder: CoreDataConstants.sortDescriptorKeyImportance)
        case 1:
            delegate?.didSetSortOrder(self, selectedSortOrder: CoreDataConstants.sortDescriptorKeyDueDate)
        case 2:
            delegate?.didSetSortOrder(self, selectedSortOrder: CoreDataConstants.sortDescriptorKeyCreatedDate)
        default:
            println("printing from the sortOrderChanged method in the OptionsViewController class")
        }
    }
    
    @IBAction func colorSchemeChanged(sender: UISegmentedControl) {
        switch colorSchemeSegmentedControl.selectedSegmentIndex {
        case 0:
            let cs = UIConstants.Colors.ColorScheme.defaultScheme
            colorScheme = cs
            implementColorScheme()
            delegate?.didSetColorScheme(self, selectedColorScheme: cs)
        case 1:
            let cs = UIConstants.Colors.ColorScheme.blueScheme
            colorScheme = cs
            implementColorScheme()
            delegate?.didSetColorScheme(self, selectedColorScheme: cs)
        case 2:
            let cs = UIConstants.Colors.ColorScheme.redScheme
            colorScheme = cs
            implementColorScheme()
            delegate?.didSetColorScheme(self, selectedColorScheme: cs)
        default:
            println("printing from the default case in the colorSchemeChanged method in the OptionsViewController class")
        }
    }
    
    @IBAction func dismissButtonTapped(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
