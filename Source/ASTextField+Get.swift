//
//  ASTextField+Get.swift
//  ASForm_Example
//
//  Created by Amit on 18/8/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import UIKit

extension ASTextField {
    public func getName() -> String? {
        return name
    }
    
    public func getBorderWidth() -> CGFloat? {
        return container?.layer.borderWidth
    }
    
    public func getPlaceholder() -> String? {
        return textField?.placeholder
    }
    
    public func getContainer() -> UIView? {
        return container
    }
    
    public func getErrorLabel() -> UILabel? {
        return errorLabel
    }
    
    public func getTextField() -> UITextField? {
        return textField
    }
    
    public func getDefaultValue() -> String? {
        return defaultValue
    }
    
    public func getNumberOfState() -> Int {
        return state.count
    }
    
    public func getState() -> [String?] {
        return state
    }
    
    public func getText() -> String {
        if isPhoneTextField, let phoneMaskRev = phoneMaskRev {
            return textField?.text?.format(with: phoneMaskRev).asttrimmingCharacters ?? ""
        }else {
            return textField?.text?.asttrimmingCharacters ?? ""
        }
    }
    
    public func getNormalText() -> String {
        if isPhoneTextField, let phoneMaskRev = phoneMaskRev {
            return textField?.text?.format(with: phoneMaskRev) ?? ""
        }else {
            return textField?.text ?? ""
        }
    }
    
    public func getNormalBorderColor() -> CGColor? {
        return container?.layer.borderColor
    }
    
    func getCornerRadius() -> CGFloat {
        return (container?.bounds.size.height ?? 0 - padding*2) * 0.5
    }
}
