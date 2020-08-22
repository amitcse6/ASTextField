//
//  ASTextField+Action.swift
//  ASForm_Example
//
//  Created by Amit on 18/8/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import UIKit

extension ASTextField {
    @objc public static func hideKeyboardWhenTappedAround(_ view: UIView) {
        let tapGesture = ASTKeyboardGesture(target: ASTextField.self, action: #selector(hideKeyboard(_:)))
        tapGesture.setFirstObject(view)
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc public static func hideKeyboard(_ sender: ASTKeyboardGesture) {
        if let view = sender.getFirstObject() as? UIView {
            view.endEditing(true)
        }
    }
}
