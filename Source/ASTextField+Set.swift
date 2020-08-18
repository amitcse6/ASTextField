//
//  ASTextField+Set.swift
//  ASForm_Example
//
//  Created by Amit on 18/8/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import UIKit

extension ASTextField {
    @discardableResult
    public func setBorderWith(borderColor:UIColor, borderWidth:CGFloat) -> ASTextField {
        container?.layer.borderColor = borderColor.cgColor
        container?.layer.borderWidth = borderWidth
        return self
    }
    
    @discardableResult
    public func setIndex(_ index: Int) -> ASTextField {
        self.index = index
        return self
    }
    
    @discardableResult
    public func setDropDown(_ dropDownClosure: @escaping ASTextFieldDropDownClosure, _ size: CGSize?, _ color: UIColor?) -> ASTextField {
        self.dropDownClosure = dropDownClosure
        if let _ = dropDownIcon {
            dropDownIcon?.removeFromSuperview()
            dropDownIcon = nil
        }
        dropDownIcon = ASDropDownIcon(size: size, color: color, isActive: true)
        dropDownIcon?.backgroundColor = .clear
        dropDownIcon?.isUserInteractionEnabled = true
        dropDownIcon?.addGestureRecognizer(ASTextFieldGestureRecognizer(target: self, action: #selector(dropDownEvent(_:))))
        container?.addSubview(dropDownIcon.unsafelyUnwrapped)
        setupConstraints()
        return self
    }
    
    @discardableResult
    public func setStateElement(_ value: String?) -> ASTextField {
        self.state.append(value)
        return self
    }
    
    @discardableResult
    public func removeLastStateElement() -> ASTextField {
        self.state.removeLast()
        return self
    }
    
    @discardableResult
    public func removeStateElement(_ index: Int) -> ASTextField {
        if index < state.count {
            self.state.remove(at: index)
        }
        return self
    }
    
    @discardableResult
    public func removeFirstStateElement() -> ASTextField {
        self.state.removeFirst()
        return self
    }
    
    @discardableResult
    public func setState(_ state: [String?]) -> ASTextField {
        self.state = state
        return self
    }
    
    @discardableResult
    public func setDelegate(_ delegate: ASTextFieldDelegate) -> ASTextField {
        self.delegate = delegate
        return self
    }
    
    @discardableResult
    public func setPhomeMask(_ phoneMask: String?, _ phoneMaskRev: String?) -> ASTextField {
        self.isPhoneTextField = true
        self.phoneMask = phoneMask
        self.phoneMaskRev = phoneMaskRev
        return self
    }
    
    @discardableResult
    public func setBordeColor(_ borderColor: UIColor) -> ASTextField {
        container?.layer.borderColor = borderColor.cgColor
        return self
    }
    
    @discardableResult
    public func setBordeWidth(_ borderWidth: CGFloat) -> ASTextField {
        container?.layer.borderWidth = borderWidth
        return self
    }
    
    @discardableResult
    public func setTintDepth(_ value: CGFloat) -> ASTextField {
        padding = value
        setupConstraints()
        return self
    }
    
    @discardableResult
    public func setCornerRadius(_ iscCornerRadius: Bool) -> ASTextField {
        self.iscCornerRadius = iscCornerRadius
        layoutSubviews()
        return self
    }
    
    @discardableResult
    public func setPhoneTextField(_ isPhoneTextField: Bool) -> ASTextField {
        self.isPhoneTextField = isPhoneTextField
        //textField?.keyboardType = .phonePad
        return self
    }
    
    @discardableResult
    public func setSecureTextEntry(_ isSecureTextEntry: Bool) -> ASTextField {
        textField?.isSecureTextEntry = isSecureTextEntry
        return self
    }
    
    // MARK: - Apply For Error Ignore Init Apply
    @discardableResult
    public func setAutoResetError(_ target: AnyObject?, _ isLoadTriggered: Bool, action: Selector? = nil) -> ASTextField {
        self.autoResetErrorTarget = target
        if let action = action {
            self.autoResetErrorAction = action
        }else{
            self.autoResetErrorAction = #selector(target?.applyForError)
        }
        return self
    }
    
    @discardableResult
    public func setInvalidAction(_ target: AnyObject?, _ isLoadTriggered: Bool, action: Selector? = nil) -> ASTextField {
        self.autoInvalidTarget = target
        if let action = action {
            self.autoInvalidAction = action
        }else{
            self.autoInvalidAction = #selector(target?.publicValidationHandler)
        }
        if isLoadTriggered {
            _ = autoInvalidTarget?.perform(autoInvalidAction)
        }
        return self
    }
    
    @discardableResult
    public func setAutoEventAll(_ target: AnyObject?, _ isLoadTriggered: Bool? = false) -> ASTextField {
        setAutoResetError(target, isLoadTriggered ?? false)
        setInvalidAction(target, isLoadTriggered ?? false)
        return self
    }
    
    @discardableResult
    public func setDelegate(_ delegate: ASTextFieldDelegate?) -> ASTextField {
        self.delegate = delegate
        return self
    }
    
    @discardableResult
    public func setText(_ value: String?, _ isCheck: Bool? = false) -> ASTextField {
        textField?.text = value ?? ""
        if let isCheck = isCheck, isCheck, let textField = textField {
            textFieldDidChange(textField)
        }
        return self
    }
    
    @discardableResult
    public func setTextColor(_ color: UIColor) -> ASTextField {
        textField?.textColor = color
        return self
    }
    
    @discardableResult
    public func setTextAlignment(_ textAlignment: NSTextAlignment) -> ASTextField {
        textField?.textAlignment = textAlignment
        return self
    }
    
    @discardableResult
    public func setFont(_ font: UIFont) -> ASTextField  {
        textField?.font = font
        return self
    }
    
    @discardableResult
    public func setDefaultValue(_ defaultValue: String?) -> ASTextField {
        self.defaultValue = defaultValue
        return self
    }
    
    @discardableResult
    public func setTitle(_ title: String?, _ font: UIFont? = nil) -> ASTextField {
        if let title = title {
            titleLabel?.text = title
        }else if let title = getName() {
            titleLabel?.text = title
        }
        if let font = font {
            titleLabel?.font = font
        }
        return self
    }
    
    @discardableResult
    public func setPlaceholder(_ placeholder: String? = nil, _ isPlaceholder: Bool? = true) -> ASTextField {
        textField?.placeholder = (isPlaceholder ?? false) ? (placeholder ?? "") : ""
        return self
    }
    
    @discardableResult
    public func setName(_ name: String?, _ isPlaceholder: Bool? = false) -> ASTextField {
        self.name = name
        setPlaceholder(("Enter \(name ?? "")"), isPlaceholder)
        return self
    }
    
    @discardableResult
    public func setAutocapitalizationType() -> ASTextField {
        textField?.autocapitalizationType = .allCharacters
        return self
    }
    
    @discardableResult
    public func setAlwaysLowercase(_ alwaysLowercase: Bool) -> ASTextField {
        self.alwaysLowercase = alwaysLowercase
        return self
    }
    
    @discardableResult
    public func setAlwaysUppercase(_ alwaysUppercase: Bool) -> ASTextField {
        self.alwaysUppercase = alwaysUppercase
        return self
    }
    
    
    @discardableResult
    public func setDisableEditing() -> ASTextField {
        isEditable = false
        return self
    }
    
    @discardableResult
    public func enableEditing() -> ASTextField {
        isEditable = true
        return self
    }
    
    @discardableResult
    public func setCornerRadius(_ cornerRadius: CGFloat) -> ASTextField {
        iscCornerRadius = false
        container?.layer.cornerRadius = cornerRadius
        return self
    }
    
    @discardableResult
    public func setCornerRadius50Percent() -> ASTextField {
        iscCornerRadius = true
        layoutSubviews()
        return self
    }
    
    @discardableResult
    public func setLeftImageIcon(_ icon: UIImage?) -> ASTextField {
        leftImageView?.image = icon
        return self
    }
    
    @discardableResult
    public func setRightImageIcon(_ icon: UIImage?) -> ASTextField {
        rightImageView?.image = icon
        return self
    }
    
    @discardableResult
    public func setLeftIcon(_ icon: UIImage?, _ closure: ASTextFieldLeftIconClosure?) -> ASTextField {
        setLeftImageIcon(icon)
        leftIconClosure = closure
        leftImageView?.isUserInteractionEnabled = true
        leftImageView?.isActive = true
        leftImageView?.addGestureRecognizer(ASTextFieldGestureRecognizer(target: self, action: #selector(leftIconEvent(_:))))
        setupConstraints()
        return self
    }
    
    @discardableResult
    public func setRightIcon(_ icon: UIImage?, _ closure: ASTextFieldLeftIconClosure?) -> ASTextField {
        setRightImageIcon(icon)
        rightIconClosure = closure
        rightImageView?.isUserInteractionEnabled = true
        rightImageView?.isActive = true
        rightImageView?.addGestureRecognizer(ASTextFieldGestureRecognizer(target: self, action: #selector(rightIconEvent(_:))))
        setupConstraints()
        return self
    }
}
