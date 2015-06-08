//
//  UIConstants.swift
//  ToDoList
//
//  Created by Steve Smart on 5/28/15.
//  Copyright (c) 2015 Steve Smart. All rights reserved.
//

import Foundation
import UIKit

struct UIConstants {
    
    struct Appearance {
        static let taskEditorTitleForAdd = "Add Task"
        static let taskEditorTitleForEdit = "Edit Task"
        static let textViewBorderRadius: CGFloat = 4.0
        static let textViewBorderWidth: CGFloat = 0.5
        static let optionsViewControllerSize = CGSize(width: 295.0, height: 180.0)
    }
    
    struct Animation {
        static let keyboardSlideAnimationDistanceOffset: CGFloat = 75
        static let keyboardSlideViewAnimationUpDuration = 0.28
        static let keyboardSlideViewAnimationDownDuration = 0.18
    }
    
    struct Colors {
        static let highImportanceColor = UIColor.colorFromRGB(r: 190, g: 0, b: 0)
        static let mediumImportanceColor = UIColor.colorFromRGB(r: 220, g: 80, b: 0)
        static let lowImportanceColor = UIColor.colorFromRGB(r: 0, g: 160, b: 0)
        
        struct ColorScheme {
            static let defaultScheme = "DefaultColorScheme"
            static let blueScheme = "BlueColorScheme"
            static let redScheme = "YellowColorScheme"
        }
        
        struct DefaultColorScheme: ColorSchemeProtocol {
            var mainBackgroundColor = UIColor.colorFromRGB(r: 238, g: 238, b: 238)
            var secondaryBackgroundColor = UIColor.colorFromRGB(r: 255, g: 255, b: 255)
            var cellBackgroundColor = UIColor.colorFromRGB(r: 225, g: 225, b: 225)
            var buttonColor = UIColor.colorFromRGB(r: 0, g: 122, b: 255)
            var labelColor = UIColor.colorFromRGB(r: 55, g: 15, b: 100)
        }
        
        struct BlueColorScheme: ColorSchemeProtocol {
            var mainBackgroundColor = UIColor.colorFromRGB(r: 187, g: 222, b: 251)
            var secondaryBackgroundColor = UIColor.colorFromRGB(r: 225, g: 245, b: 254)
            var cellBackgroundColor = UIColor.colorFromRGB(r: 170, g: 205, b: 240)
            var buttonColor = UIColor.colorFromRGB(r: 117, g: 5, b: 0)
            var labelColor = UIColor.colorFromRGB(r: 0, g: 0, b: 0)
        }
        
        struct YellowColorScheme: ColorSchemeProtocol {
            var mainBackgroundColor = UIColor.colorFromRGB(r: 255, g: 245, b: 157)
            var secondaryBackgroundColor = UIColor.colorFromRGB(r: 255, g: 249, b: 196)
            var cellBackgroundColor = UIColor.colorFromRGB(r: 255, g: 241, b: 118)
            var buttonColor = UIColor.colorFromRGB(r: 0, g: 100, b: 235)
            var labelColor = UIColor.colorFromRGB(r: 0, g: 0, b: 0)
        }
    }
}
