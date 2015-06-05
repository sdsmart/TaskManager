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
        static let textViewBorderWidth: CGFloat = 0.5
        static let optionsViewControllerSize = CGSize(width: 295.0, height: 180.0)
    }
    
    public struct Animation {
        static let keyboardSlideAnimationDistanceOffset: CGFloat = 75
        static let keyboardSlideViewAnimationUpDuration = 0.28
        static let keyboardSlideViewAnimationDownDuration = 0.18
    }
    
    public struct Colors {
        static let highImportanceColor = UIColor.colorFromRGB(r: 190, g: 0, b: 0)
        static let mediumImportanceColor = UIColor.colorFromRGB(r: 220, g: 80, b: 0)
        static let lowImportanceColor = UIColor.colorFromRGB(r: 0, g: 160, b: 0)
        
        public struct ColorScheme {
            static let defaultScheme = "DefaultColorScheme"
            static let blueScheme = "BlueColorScheme"
            static let redScheme = "YellowColorScheme"
        }
        
        public struct DefaultColorScheme: ColorSchemeProtocol {
            public var mainBackgroundColor = UIColor.colorFromRGB(r: 238, g: 238, b: 238)
            public var secondaryBackgroundColor = UIColor.colorFromRGB(r: 255, g: 255, b: 255)
            public var cellBackgroundColor = UIColor.colorFromRGB(r: 225, g: 225, b: 225)
            public var buttonColor = UIColor.colorFromRGB(r: 0, g: 122, b: 255)
            public var labelColor = UIColor.colorFromRGB(r: 106, g: 27, b: 154)
        }
        
        public struct BlueColorScheme: ColorSchemeProtocol {
            public var mainBackgroundColor = UIColor.colorFromRGB(r: 187, g: 222, b: 251)
            public var secondaryBackgroundColor = UIColor.colorFromRGB(r: 225, g: 245, b: 254)
            public var cellBackgroundColor = UIColor.colorFromRGB(r: 180, g: 212, b: 245)
            public var buttonColor = UIColor.colorFromRGB(r: 117, g: 5, b: 0)
            public var labelColor = UIColor.colorFromRGB(r: 54, g: 0, b: 107)
        }
        
        public struct YellowColorScheme: ColorSchemeProtocol {
            public var mainBackgroundColor = UIColor.colorFromRGB(r: 255, g: 238, b: 88)
            public var secondaryBackgroundColor = UIColor.colorFromRGB(r: 255, g: 249, b: 196)
            public var cellBackgroundColor = UIColor.colorFromRGB(r: 255, g: 234, b: 0)
            public var buttonColor = UIColor.colorFromRGB(r: 0, g: 100, b: 235)
            public var labelColor = UIColor.colorFromRGB(r: 13, g: 71, b: 161)
        }
    }
}

extension UIColor {
    class func colorFromRGB(#r: Int, g: Int, b: Int) -> UIColor {
        return UIColor(red: CGFloat(r) / CGFloat(255.0),
        green: CGFloat(g) / CGFloat(255.0),
        blue: CGFloat(b) / CGFloat(255.0),
        alpha: 1.0)
    }
}
