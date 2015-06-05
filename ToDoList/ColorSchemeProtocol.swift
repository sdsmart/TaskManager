//
//  ColorSchemeProtocol.swift
//  ToDoList
//
//  Created by Steve Smart on 5/31/15.
//  Copyright (c) 2015 Steve Smart. All rights reserved.
//

import Foundation
import UIKit

public protocol ColorSchemeProtocol {
    var mainBackgroundColor: UIColor { get }
    var secondaryBackgroundColor: UIColor { get }
    var cellBackgroundColor: UIColor { get }
    var buttonColor: UIColor { get }
    var labelColor: UIColor { get }
}