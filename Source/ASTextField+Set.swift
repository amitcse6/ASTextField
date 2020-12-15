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
    public func setIndex(_ index: Int) -> ASTextField {
        self.index = index
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
    public func setTextFromName(_ textProps: ASTTextProps? = nil, _ isCheck: Bool? = false) -> ASTextField {
        if let title = getName() {
            textField?.text = title
        }
        if let font = textProps?.font {
            textField?.font = font
        }
        if let textColor = textProps?.textColor {
            textField?.textColor = textColor
        }
        if let isCheck = isCheck, isCheck, let textField = textField {
            textFieldDidChange(textField)
        }
        return self
    }
    
    @discardableResult
    public func setText(_ title: String?, _ textProps: ASTTextProps? = nil, _ isCheck: Bool? = false) -> ASTextField {
        if let title = title {
            textField?.text = title
        }else if let title = getName() {
            textField?.text = title
        }
        if let font = textProps?.font {
            textField?.font = font
        }
        if let textColor = textProps?.textColor {
            textField?.textColor = textColor
        }
        if let isCheck = isCheck, isCheck, let textField = textField {
            textFieldDidChange(textField)
        }
        return self
    }
    
    @discardableResult
    public func setText(_ title: String?, _ placeholder: String?, _ textProps: ASTTextProps? = nil, _ isCheck: Bool? = false) -> ASTextField {
        if let title = title {
            textField?.text = title
        }else if let title = getName() {
            textField?.text = title
        }
        if let font = textProps?.font {
            textField?.font = font
        }
        if let textColor = textProps?.textColor {
            textField?.textColor = textColor
        }
        if let isCheck = isCheck, isCheck, let textField = textField {
            textFieldDidChange(textField)
        }
        if let placeholder = placeholder{
            setPlaceholder(placeholder)
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
    public func setTitleFromName(_ textProps: ASTTextProps? = nil, _ multiplier: CGFloat? = nil) -> ASTextField {
        if let title = getName() {
            titleLabel?.text = title
        }
        if let font = textProps?.font {
            titleLabel?.font = font
        }
        if let textColor = textProps?.textColor {
            titleLabel?.textColor = textColor
        }
        titleMultiplier = multiplier ?? 0.3
        setupConstraints()
        return self
    }
    
    @discardableResult
    public func setTitle(_ title: String? = nil, _ textProps: ASTTextProps? = nil) -> ASTextField {
        if let title = title {
            titleLabel?.text = title
        }else if let title = getName() {
            titleLabel?.text = title
        }
        if let font = textProps?.font {
            titleLabel?.font = font
        }
        if let textColor = textProps?.textColor {
            titleLabel?.textColor = textColor
        }
        return self
    }
    
    @discardableResult
    public func setNameAsTitle(_ textProps: ASTTextProps? = nil) -> ASTextField {
        setTitle(getName(), textProps)
        return self
    }
    
    @discardableResult
    public func setErrorTitleFromName(_ textProps: ASTTextProps? = nil) -> ASTextField {
        if let title = getName() {
            errorLabel?.text = title
        }
        if let font = textProps?.font {
            errorLabel?.font = font
        }
        if let textColor = textProps?.textColor {
            errorLabel?.textColor = textColor
        }
        return self
    }
    
    @discardableResult
    public func setErrorTitle(_ title: String? = nil, _ textProps: ASTTextProps? = nil) -> ASTextField {
        if let title = title {
            errorLabel?.text = title
        }else if let title = getName() {
            errorLabel?.text = title
        }
        if let font = textProps?.font {
            errorLabel?.font = font
        }
        if let textColor = textProps?.textColor {
            errorLabel?.textColor = textColor
        }
        return self
    }
    
    @discardableResult
    public func setBoxHorizontalPadding(_ padding: CGFloat) -> ASTextField {
        boxHorizontalPadding = padding
        setupConstraints()
        return self
    }
    
    @discardableResult
    public func setBoxVerticalPadding(_ padding: CGFloat) -> ASTextField {
        boxVerticalPadding = padding
        setupConstraints()
        return self
    }
    
    @discardableResult
    public func setDBoxVerticalPadding(_ padding: CGFloat) -> ASTextField {
        boxDVerticalPadding = padding
        setupConstraints()
        return self
    }
    
    @discardableResult
    public func setDBoxHorizontalPadding(_ padding: CGFloat) -> ASTextField {
        boxDHorizontalPadding = padding
        setupConstraints()
        return self
    }
    
    @discardableResult
    public func setDBoxPadding(_ padding: CGSize) -> ASTextField {
        boxDVerticalPadding = padding.height
        boxDHorizontalPadding = padding.width
        setupConstraints()
        return self
    }
    
    @discardableResult
    public func setBoxXYPadding(_ paddingX: CGFloat, _ paddingY: CGFloat) -> ASTextField {
        boxHorizontalPadding = paddingX
        boxVerticalPadding = paddingY
        setupConstraints()
        return self
    }
    
    @discardableResult
    public func setPlaceholder(_ placeholder: String? = nil, _ isPlaceholder: Bool? = true) -> ASTextField {
        textField?.placeholder = (isPlaceholder ?? false) ? (placeholder ?? "") : ""
        return self
    }
    
    @discardableResult
    public func setPlaceholder(_ placeholder: String? = nil, _ attrs: [NSAttributedString.Key : Any], _ isPlaceholder: Bool? = true) -> ASTextField {
        textField?.attributedPlaceholder = NSAttributedString(string: (isPlaceholder ?? false) ? (placeholder ?? "") : "", attributes: attrs)
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
    public func setDisableEditing(_ color: UIColor) -> ASTextField {
        isEditable = false
        container?.backgroundColor = color
        return self
    }
    
    @discardableResult
    public func enableEditing() -> ASTextField {
        isEditable = true
        return self
    }
}

// MARK: - Container
extension ASTextField {
    @discardableResult
    public func setBorderWith(borderColor:UIColor, borderWidth:CGFloat) -> ASTextField {
        container?.layer.borderColor = borderColor.cgColor
        container?.layer.borderWidth = borderWidth
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
    func setBackgroundColor(_ color: UIColor) -> ASTextField {
        self.backgroundColor = color
        return self
    }
    
    @discardableResult
    func setTintBackgroundColor(_ color: UIColor) -> ASTextField {
        self.container?.backgroundColor = color
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
}

// MARK: - LEFT RIGHT VIEW
extension ASTextField {
    @discardableResult
    public func setLeftIcon(_ icon: Any?, _ multiplier: ASTMultiplier? = nil, _ closure: ASTextFieldIconClosure?) -> ASTextField {
        let iconView = ASTView(self, icon, multiplier, closure, .left)
        container?.addSubview(iconView)
        views?.append(iconView)
        setupConstraints()
        return self
    }
    
    @discardableResult
    public func setBackgroundIcon(_ icon: UIImage?) -> ASTextField {
        imageView?.image = icon
        return self
    }
    
    @discardableResult
    public func setLeftIcon(_ imageOn: Any?, _ imageOff: ASTextFieldChildViewClosure?, _ multiplier: ASTMultiplier? = nil, _ defaultType: Bool, _ closure: ASTextFieldIconClosure?) -> ASTextField {
        let iconView = ASTView(self, imageOn, imageOff, multiplier, defaultType, closure, .left)
        container?.addSubview(iconView)
        views?.append(iconView)
        setupConstraints()
        return self
    }
    
    @discardableResult
    public func setRightIcon(_ icon: Any?, _ multiplier: ASTMultiplier? = nil, _ closure: ASTextFieldIconClosure?) -> ASTextField {
        let iconView = ASTView(self, icon, multiplier, closure, .right)
        container?.addSubview(iconView)
        views?.append(iconView)
        setupConstraints()
        return self
    }
    
    @discardableResult
    public func setRightIcon(_ imageOn: Any?, _ imageOff: Any?, _ multiplier: ASTMultiplier? = nil, _ defaultType: Bool, _ closure: ASTextFieldIconClosure?) -> ASTextField {
        let iconView = ASTView(self, imageOn, imageOff, multiplier, defaultType, closure, .right)
        container?.addSubview(iconView)
        views?.append(iconView)
        setupConstraints()
        return self
    }
    
    
    @discardableResult
    public func setRightIcon(_ imageOn: Any?, _ imageOff: Any?, _ multiplier: ASTMultiplier? = nil, _ defaultType: Bool, _ isAutoEvent: Bool, _ closure: ASTextFieldIconClosure?) -> ASTextField {
        let iconView = ASTView(self, imageOn, imageOff, multiplier, defaultType, isAutoEvent, closure, .right)
        container?.addSubview(iconView)
        views?.append(iconView)
        setupConstraints()
        return self
    }
}
