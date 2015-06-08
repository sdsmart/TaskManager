//
//  OptionsViewController.swift
//  ToDoList
//
//  Created by Steve Smart on 5/30/15.
//  Copyright (c) 2015 Steve Smart. All rights reserved.
//

import UIKit

class OptionsController: UIViewController {
    
    // MARK: Properties
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
    
    // MARK: View Controller Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sortBySegmentedControl.selectedSegmentIndex = initialSortBySegmentedControlIndex
        colorSchemeSegmentedControl.selectedSegmentIndex = initialColorSchemeSegmentedControlIndex
        implementColorScheme()
    }
    
    private func implementColorScheme() {
        func implementColorSchemeHelper(scheme: ColorSchemeProtocol) {
            self.view.backgroundColor = scheme.secondaryBackgroundColor
            sortByLabel.textColor = scheme.labelColor
            dismissButton.tintColor = scheme.buttonColor
            colorSchemeLabel.textColor = scheme.labelColor
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
    
    // MARK: Action Methods
    @IBAction func sortOrderChanged(sender: UISegmentedControl) {
        switch sortBySegmentedControl.selectedSegmentIndex {
        case 0:
            delegate?.didSetSortOrder(self, selectedSortOrder: CoreDataConstants.sortDescriptorKeyImportance)
        case 1:
            delegate?.didSetSortOrder(self, selectedSortOrder: CoreDataConstants.sortDescriptorKeyDueDate)
        case 2:
            delegate?.didSetSortOrder(self, selectedSortOrder: CoreDataConstants.sortDescriptorKeyCreatedDate)
        default:
            break
        }
    }
    
    @IBAction func colorSchemeChanged(sender: UISegmentedControl) {
        switch colorSchemeSegmentedControl.selectedSegmentIndex {
        case 0:
            colorScheme = UIConstants.Colors.ColorScheme.defaultScheme
            implementColorScheme()
            delegate?.didSetColorScheme(self, selectedColorScheme: colorScheme)
        case 1:
            colorScheme = UIConstants.Colors.ColorScheme.blueScheme
            implementColorScheme()
            delegate?.didSetColorScheme(self, selectedColorScheme: colorScheme)
        case 2:
            colorScheme = UIConstants.Colors.ColorScheme.redScheme
            implementColorScheme()
            delegate?.didSetColorScheme(self, selectedColorScheme: colorScheme)
        default:
            break
        }
    }
    
    @IBAction func dismissButtonTapped(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
