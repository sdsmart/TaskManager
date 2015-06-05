//
//  ToDoItemTableViewCell.swift
//  ToDoList
//
//  Created by Steve Smart on 5/29/15.
//  Copyright (c) 2015 Steve Smart. All rights reserved.
//

import UIKit

class TaskTableViewCell: UITableViewCell {

    // MARK: Properties
    var colorScheme = UIConstants.Colors.ColorScheme.defaultScheme {
        didSet {
            implementColorScheme()
        }
    }
    
    var taskManaged: TaskManaged? {
        didSet {
            updateUI()
        }
    }
    
    var isDeleted: Bool = false
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var importanceLabel: UILabel!
    @IBOutlet weak var dueDateValueLabel: UILabel!
    
    // MARK: UpdateUI Methods
    override func awakeFromNib() {
        implementColorScheme()
    }
    
    private func implementColorScheme() {
        func implementColorSchemeHelper(scheme: ColorSchemeProtocol) {
            self.backgroundColor = scheme.mainBackgroundColor
            self.contentView.backgroundColor = scheme.cellBackgroundColor
            dueDateValueLabel.textColor = scheme.labelColor
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if !isDeleted {
            updateUI()
        }
    }
    
    private func updateUI() {
        if taskManaged != nil {
            titleLabel.text = taskManaged!.name
            
            let fullDueDateText = getStringFromDate(taskManaged!.dueDate)
            let splitDateTextOnSpace = split(fullDueDateText){$0 == " "}
            var displayDate = ""
            if fullDueDateText.lowercaseString.rangeOfString("today") != nil
                || fullDueDateText.lowercaseString.rangeOfString("tomorrow") != nil {
                displayDate = splitDateTextOnSpace[0]
            } else {
                displayDate = splitDateTextOnSpace[0] + " " + splitDateTextOnSpace[1]
            }
            dueDateValueLabel.text = displayDate
            
            let importance = taskManaged!.importance
            importanceLabel.text = "\(importance)"
            switch importance {
            case 1...3:
                importanceLabel.textColor = UIConstants.Colors.lowImportanceColor
            case 4...7:
                importanceLabel.textColor = UIConstants.Colors.mediumImportanceColor
            case 8...10:
                importanceLabel.textColor = UIConstants.Colors.highImportanceColor
            default:
                break
            }
        }
    }
}