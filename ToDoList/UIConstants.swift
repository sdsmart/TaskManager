//
//  UIConstants.swift
//  ToDoList
//
//  Created by Steve Smart on 5/28/15.
//  Copyright (c) 2015 Steve Smart. All rights reserved.
//

import Foundation
import UIKit

public struct UIConstants {
    
    public struct Appearance {
        static let taskEditorTitleForAdd = "Add Task"
        static let taskEditorTitleForEdit = "Edit Task"
        static let textViewBorderRadius: CGFloat = 4.0
        static let optionsViewControllerSize = CGSize(width: CGFloat(320.0), height: CGFloat(125.0))
    }
    
    public struct Animation {
        static let keyboardSlideAnimationDistanceOffset: CGFloat = 75
        static let keyboardSlideViewAnimationUpDuration = 0.28
        static let keyboardSlideViewAnimationDownDuration = 0.18
    }
    
    public struct Colors {
        static let mainBackgroundColor = UIColor(red: CGFloat(255/255.0), green: CGFloat(246/255.0), blue: CGFloat(150/255.0), alpha: CGFloat(1.0))
        static let secondaryBackgroundColor = UIColor(red: CGFloat(255/255.0), green: CGFloat(246/255.0), blue: CGFloat(200/255.0), alpha: CGFloat(1.0))
        static let cellBackgroundColor = UIColor(red: CGFloat(255/255.0), green: CGFloat(246/255.0), blue: CGFloat(100/255.0), alpha: CGFloat(1.0))
        static let highImportanceColor = UIColor(red: CGFloat(235/255.0), green: CGFloat(0/255.0), blue: CGFloat(0/255.0), alpha: CGFloat(1.0))
        static let mediumImportanceColor = UIColor(red: CGFloat(240/255.0), green: CGFloat(100/255.0), blue: CGFloat(0/255.0), alpha: CGFloat(1.0))
        static let lowImportanceColor = UIColor(red: CGFloat(0/255.0), green: CGFloat(196/255.0), blue: CGFloat(0/255.0), alpha: CGFloat(1.0))
    }
}