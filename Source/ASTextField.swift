//
//  ASTextField.swift
//  superapp
//
//  Created by Amit on 23/6/20.
//  Copyright © 2020 Amit. All rights reserved.
//

import Foundation
import UIKit

@objc public protocol ASTextFieldDelegate {
    @objc optional func textFieldShouldBeginEditing(_ asTextField: ASTextField)
    @objc optional func textFieldDidBeginEditing(_ asTextField: ASTextField)
    @objc optional func textField(_ asTextField: ASTextField, shouldChangeCharactersIn range: NSRange, replacementString string: String)
    @objc optional func textField(_ asTextField: ASTextField, changeCharactersIn range: NSRange, replacementString string: String)
    @objc optional func textFieldDidChange(_ asTextField: ASTextField)
    @objc optional func textFieldDidChangeSelection(_ asTextField: ASTextField)
}

public typealias ASTextFieldDropDown = Int
public typealias ASTextFieldDropDownClosure = (ASTextFieldDropDown, ASTextField) -> Void

public class ASTextField: UIView {
    var delegate: ASTextFieldDelegate?
    var index = 0
    var container: UIView?
    var textField: UITextField?
    var errorLabel: UILabel?
    var dropDownIcon: ASDropDownIcon?
    var textFieldRightConstraint: NSLayoutConstraint?
    var autoResetErrorTarget: AnyObject?
    var autoResetErrorAction: Selector?
    var autoInvalidTarget: AnyObject?
    var autoInvalidAction: Selector?
    var PADDING: CGFloat = 10
    var name: String?
    var isEditable: Bool = true
    var isPhoneTextField: Bool = false
    var iscCornerRadius = true
    var selectionAction: ASTextFieldDropDownClosure?
    var phoneMask: String? = "+XXX (XX) XXXX XXXX"
    var phoneMaskRev: String? = "+XXXXXXXXXXXXX"
    var alwaysLowercase = false
    var alwaysUppercase = false
    var defaultValue: String?
    var state = [String?]()
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        if iscCornerRadius {
            let cornerRadius = (container?.bounds.size.height ?? 0 - PADDING*2) * 0.5
            container?.layer.cornerRadius = cornerRadius
        }
    }
    
    @objc public func errorResetAll() {
        // For Reference. It's action is not here
    }
    
    @objc public func publicValidationHandler() {
        // For Reference. It's action is not here
    }
    
    @objc public func applyForError() {
        // For Reference. It's action is not here
    }
}

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
    public func setDropDown(_ selectionAction: @escaping ASTextFieldDropDownClosure, _ size: CGSize?, _ color: UIColor?) -> ASTextField {
        self.selectionAction = selectionAction
        dropDownIcon = ASDropDownIcon(size: size, color: color)
        container?.addSubview(dropDownIcon.unsafelyUnwrapped)
        dropDownIcon?.backgroundColor = .clear
        dropDownIcon?.isUserInteractionEnabled = true
        let tapGestureRecognizer = ASTextFieldGestureRecognizer(target: self, action: #selector(dropDownEvent(_:)))
        tapGestureRecognizer.firstObject = nil
        dropDownIcon?.addGestureRecognizer(tapGestureRecognizer)
        setupConstraints()
        return self
    }
    
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
}

//let startPosition: UITextPosition = textField.beginningOfDocument
//let endPosition: UITextPosition = textField.endOfDocument
//let cursorPosition = textField.offset(from: textField.beginningOfDocument, to: selectedRange.start)
//textField.selectedTextRange = textField.textRange(from: cursorPosition, to: cursorPosition)
//print("cursorPosition: \(cursorPosition)")

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

extension ASTextField {
    @objc public func dropDownEvent(_ sender: ASTextFieldGestureRecognizer? = nil) {
        selectionAction?(index, self)
    }
}

extension ASTextField {
    public func getDropDownIcon() -> ASDropDownIcon? {
        return dropDownIcon
    }
    
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
            return textField?.text?.format(with: phoneMaskRev) ?? ""
        }else {
            return textField?.text ?? ""
        }
    }
    
    public func getNormalBorderColor() -> CGColor? {
        return container?.layer.borderColor
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
        PADDING = value
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
}

public class ASTextFieldGestureRecognizer: UITapGestureRecognizer {
    public var firstObject: Any?
    
    func setFirstObject(_ sender: Any?) {
        self.firstObject = sender
    }
    
    func getFirstObject() -> Any? {
        return self.firstObject
    }
}

extension ASTextField {
    @objc public static func hideKeyboardWhenTappedAround(_ view: UIView) {
        let tapGesture = ASTTapGestureRecognizer(target: ASTextField.self, action: #selector(hideKeyboard(_:)))
        tapGesture.setFirstObject(view)
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc public static func hideKeyboard(_ sender: ASTTapGestureRecognizer) {
        if let view = sender.getFirstObject() as? UIView {
            view.endEditing(true)
        }
    }
}

public class ASTTapGestureRecognizer: UITapGestureRecognizer {
    var firstObject: Any?
    func setFirstObject(_ sender: Any?) {
        self.firstObject = sender
    }
    func getFirstObject() -> Any? {
        return self.firstObject
    }
}
