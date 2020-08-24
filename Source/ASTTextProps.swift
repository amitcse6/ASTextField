//
//  ASTTextProp.swift
//  superapp
//
//  Created by Amit on 19/8/20.
//  Copyright © 2020 Amit. All rights reserved.
//

import Foundation
import UIKit

public class ASTTextProps {
    public var font: UIFont?
    public var textColor: UIColor?
    
    public init(_ font: UIFont?, _ textColor: UIColor?) {
        self.font = font
        self.textColor = textColor
    }
}
