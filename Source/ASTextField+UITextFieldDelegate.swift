//
//  ASTextField+UITextFieldDelegate.swift
//  ASForm_Example
//
//  Created by Amit on 18/8/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import UIKit


extension ASTextField: UITextFieldDelegate {
    public func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        delegate?.textFieldShouldBeginEditing?(self)
        return isEditable
    }
    
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        _ = autoResetErrorTarget?.perform(autoResetErrorAction)
        delegate?.textFieldDidBeginEditing?(self)
    }
    
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        var mobileNumberFormat = true
        var caseFormat = true
        delegate?.textField?(self, shouldChangeCharactersIn: range, replacementString: string)
        let updatedString = (textField.text as NSString?)?.replacingCharacters(in: range, with: string)
        if string != "\n" {
            mobileNumberFormat = mobileNumberFormatApply(updatedString ?? "")
            caseFormat = caseFormatApply(updatedString ?? "")
        }
        delegate?.textField?(self, changeCharactersIn: range, replacementString: string)
        let what = (mobileNumberFormat && caseFormat)
        if !what {
            textFieldDidChange(textField)
        }
        return what
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        mobileNumberFormatApply(textField.text)
        caseFormatApply(textField.text)
        _ = autoInvalidTarget?.perform(autoInvalidAction)
        delegate?.textFieldDidChange?(self)
    }
    
    public func textFieldDidChangeSelection(_ textField: UITextField) {
        delegate?.textFieldDidChangeSelection?(self)
    }
}

//let startPosition: UITextPosition = textField.beginningOfDocument
//let endPosition: UITextPosition = textField.endOfDocument
//let cursorPosition = textField.offset(from: textField.beginningOfDocument, to: selectedRange.start)
//textField.selectedTextRange = textField.textRange(from: cursorPosition, to: cursorPosition)
//print("cursorPosition: \(cursorPosition)")
