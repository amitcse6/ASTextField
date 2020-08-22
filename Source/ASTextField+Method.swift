//
//  ASTextField+Method.swift
//  ASForm_Example
//
//  Created by Amit on 18/8/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import UIKit

extension ASTextField {
    @discardableResult
    func mobileNumberFormatApply(_ updatedString: String?) -> Bool {
        if isPhoneTextField, let phoneMask = phoneMask {
            let oldText = textField?.text
            let selectedRange: UITextRange? = textField?.selectedTextRange
            textField?.text = updatedString?.format(with: phoneMask)
            let newText = textField?.text
            let diff = (newText?.count ?? 0) - (oldText?.count ?? 0)
            if let selectedRange = selectedRange {
                if let newPosition = textField?.position(from: selectedRange.start, offset: diff) {
                    textField?.selectedTextRange = textField?.textRange(from: newPosition, to: newPosition)
                }
            }
            return false
        }
        return true
    }
    
    @discardableResult
    func caseFormatApply(_ updatedString: String?) -> Bool {
        if alwaysUppercase || alwaysLowercase {
            let oldText = textField?.text
            let selectedRange: UITextRange? = textField?.selectedTextRange
            textField?.text = alwaysUppercase ? updatedString?.uppercased() : alwaysLowercase ? updatedString?.lowercased() : updatedString
            let newText = textField?.text
            let diff = (newText?.count ?? 0) - (oldText?.count ?? 0)
            if let selectedRange = selectedRange {
                if let newPosition = textField?.position(from: selectedRange.start, offset: diff) {
                    textField?.selectedTextRange = textField?.textRange(from: newPosition, to: newPosition)
                }
            }
            return false
        }
        return true
    }
    
    func textFieldHilightWithRightIconBehavior(_ isSecure: Bool) {
        setSecureTextEntry(!isSecure)
    }
}
