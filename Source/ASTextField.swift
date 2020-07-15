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
    @objc optional func textFieldShouldBeginEditing(_ asTextField: ASTextField, _ textField: UITextField)
    @objc optional func textFieldDidBeginEditing(_ asTextField: ASTextField, _ textField: UITextField)
}

public typealias ASTextFieldDropDown = Int
public typealias ASTextFieldDropDownClosure = (ASTextFieldDropDown, ASTextField) -> Void

public class ASTextField: UIView {
    var delegate: ASTextFieldDelegate?
    var index = 0
    var container: UIView?
    var textField: UITextField?
    var errorLabel: UILabel?
    var dropDownIcon: DropDownIcon?
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
    
    @objc public func invalidAction() {
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
    public func setDropDown(_ selectionAction: @escaping ASTextFieldDropDownClosure) -> ASTextField {
        self.selectionAction = selectionAction
        textFieldRightConstraint?.constant = -30
        let color = UIColor(red: 150.0/255.0, green: 150.0/255.0, blue: 150.0/255.0, alpha: 1.0)
        dropDownIcon = DropDownIcon(frame: CGRect(x: 0, y: 0, width: 10, height: 15), pos: CGPoint(x: 15, y: 15), color: color)
        container?.addSubview(dropDownIcon.unsafelyUnwrapped)
        dropDownIcon?.backgroundColor = .clear
        dropDownIcon?.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 9.0, *) {
            dropDownIcon?.topAnchor.constraint(equalTo: container.unsafelyUnwrapped.topAnchor, constant: 0).isActive = true
            dropDownIcon?.rightAnchor.constraint(equalTo: container.unsafelyUnwrapped.rightAnchor, constant: -10).isActive = true
            dropDownIcon?.bottomAnchor.constraint(equalTo: container.unsafelyUnwrapped.bottomAnchor, constant: 0).isActive = true
            dropDownIcon?.widthAnchor.constraint(equalTo: dropDownIcon.unsafelyUnwrapped.heightAnchor, constant: 0).isActive = true
            dropDownIcon?.centerYAnchor.constraint(equalTo: container.unsafelyUnwrapped.centerYAnchor, constant: 0).isActive = true
        } else {
            // Fallback on earlier versions
        }
        dropDownIcon?.isUserInteractionEnabled = true
        let tapGestureRecognizer = ASTextFieldGestureRecognizer(target: self, action: #selector(dropDownEvent(_:)))
        tapGestureRecognizer.firstObject = nil
        dropDownIcon?.addGestureRecognizer(tapGestureRecognizer)
        return self
    }
    
    func mobileNumberFormatApply() {
        if isPhoneTextField, let phoneMask = phoneMask {
            //textField.text = textField.text?.applyPatternOnNumbers()
            textField?.text = textField?.text?.format(with: phoneMask)
        }
    }
}

extension ASTextField: UITextFieldDelegate {
    public func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        delegate?.textFieldShouldBeginEditing?(self, textField)
        return isEditable
    }
    
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        delegate?.textFieldDidBeginEditing?(self, textField)
        _ = autoResetErrorTarget?.perform(autoResetErrorAction)
    }
    
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let updatedString = (textField.text as NSString?)?.replacingCharacters(in: range, with: string)
        if alwaysLowercase {
            textField.text = updatedString?.lowercased();
            textFieldDidChange(textField)
            return false;
        }
        if alwaysUppercase {
            textField.text = updatedString?.uppercased();
            textFieldDidChange(textField)
            return false;
        }
        
        return true
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
         mobileNumberFormatApply()
        _ = autoInvalidTarget?.perform(autoInvalidAction)
    }
    
    public func textFieldDidChangeSelection(_ textField: UITextField) {
    }
}

extension ASTextField {
    @objc public func dropDownEvent(_ sender: ASTextFieldGestureRecognizer? = nil) {
        selectionAction?(index, self)
    }
}

extension ASTextField {
    public func getDropDownIcon() -> DropDownIcon? { 
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
    
    @discardableResult
    public func setAutoResetError(_ target: AnyObject?, _ isLoadTriggered: Bool, action: Selector? = nil) -> ASTextField {
        self.autoResetErrorTarget = target
        if let action = action {
            self.autoResetErrorAction = action
        }else{
            self.autoResetErrorAction = #selector(target?.errorResetAll)
        }
        return self
    }
    
    @discardableResult
    public func setInvalidAction(_ target: AnyObject?, _ isLoadTriggered: Bool, action: Selector? = nil) -> ASTextField {
        self.autoInvalidTarget = target
        if let action = action {
            self.autoInvalidAction = action
        }else{
            self.autoInvalidAction = #selector(target?.invalidAction)
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
    public func setPlaceholder(_ placeholder: String? = nil) -> ASTextField {
        textField?.placeholder = placeholder ?? name ?? ""
        return self
    }
    
    @discardableResult
    public func setName(_ name: String?, _ isPlaceholder: Bool? = false) -> ASTextField {
        self.name = name
        textField?.placeholder = (isPlaceholder ?? false) ? "Enter \(name ?? "")" : textField?.placeholder
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

public class DropDownIcon : UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit(pos: CGPoint(x: 10, y: 10), color: .black)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit(pos: CGPoint(x: 10, y: 10), color: .black)
    }
    
    init(frame: CGRect, pos: CGPoint, color: UIColor) {
        super.init(frame: frame)
        commonInit(pos: pos, color: color)
    }
    
    public func commonInit(pos: CGPoint, color: UIColor) {
        let size = frame.size
        let path = CGMutablePath()
        
        path.move(to: CGPoint(x: pos.x, y: pos.y))
        path.addLine(to: CGPoint(x: pos.x + size.width/2, y: pos.y + size.height/2))
        path.addLine(to: CGPoint(x:pos.x + size.width, y: pos.y + 0))
        path.addLine(to: CGPoint(x: pos.x, y: pos.y))
        
        let shape = CAShapeLayer()
        shape.path = path
        shape.fillColor = color.cgColor
        
        layer.insertSublayer(shape, at: 0)
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
