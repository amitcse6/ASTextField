//
//  ASTTapGestureRecognizer.swift
//  ASForm_Example
//
//  Created by Amit on 18/8/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import UIKit

public class ASTKeyboardGesture: UITapGestureRecognizer {
    var firstObject: Any?
    func setFirstObject(_ sender: Any?) {
        self.firstObject = sender
    }
    func getFirstObject() -> Any? {
        return self.firstObject
    }
}
