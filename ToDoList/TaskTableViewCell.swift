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
    @IBOutlet weak var dueDateLabel: UILabel!
    
    // MARK: UpdateUI Methods
    override func awakeFromNib() {
        implementColorScheme()
    }
    
    private func implementColorScheme() {
        func implementColorSchemeHelper(scheme: ColorSchemeProtocol) {
            self.backgroundColor = scheme.mainBackgroundColor
            self.contentView.backgroundColor = scheme.cellBackgroundColor
            dueDateLabel.textColor = scheme.subtitleDueDateOnCellColor
        }
        
        switch colorScheme {
        case UIConstants.Colors.ColorScheme.defaultScheme:
            implementColorSchemeHelper(UIConstants.Colors.DefaultColorScheme())
        case UIConstants.Colors.ColorScheme.blueScheme:
            implementColorSchemeHelper(UIConstants.Colors.BlueColorScheme())
        case UIConstants.Colors.ColorScheme.redScheme:
            implementColorSchemeHelper(UIConstants.Colors.RedColorScheme())
        default:
            println("printing from the implementColorScheme method in the TaskTableViewCell class")
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
            
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateStyle = NSDateFormatterStyle.LongStyle
            let dueDateText = dateFormatter.stringFromDate(taskManaged!.dueDate)
            let splitDateTextOnComma = split(dueDateText){$0 == ","}
            let dueDateMonthDayOnly = splitDateTextOnComma.first
            dueDateLabel.text = dueDateMonthDayOnly
            
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
                println("printing from default case of the updateUI method in the TaskTableViewCell class")
            }
        }
    }
}