//
//  ToDoItemTableViewCell.swift
//  ToDoList
//
//  Created by Steve Smart on 5/29/15.
//  Copyright (c) 2015 Steve Smart. All rights reserved.
//

import UIKit

class TaskTableViewCell: UITableViewCell {

    // MARK: - Properties
    var taskManaged: TaskManaged? {
        didSet {
            updateUI()
        }
    }
    var isDeleted: Bool = false
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var importanceLabel: UILabel!
    
    // MARK: - UpdateUI Methods
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if !isDeleted {
            updateUI()
        }
    }
    
    private func updateUI() {
        if taskManaged != nil {
            titleLabel.text = taskManaged!.name
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