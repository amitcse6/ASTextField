////
////  ASTImage.swift
////  ASForm_Example
////
////  Created by Amit on 18/8/20.
////  Copyright © 2020 CocoaPods. All rights reserved.
////

import Foundation
import UIKit

public enum ASTAlignType {
    case left
    case right
}

public class ASTView: UIView {
    public var isActive = false
    public var isAutoEvent = false
    public var isOn = false
    
    public var alignType = ASTAlignType.left
    
    public var container: UIView?
    public var imageView: UIImageView?
    
    public var imageOn: UIImage?
    public var imageOff: UIImage?
    
    public var multiplier: ASTMultiplier?
    
    public var iconClosure: ASTextFieldIconClosure?
    
    public var textField: ASTextField?
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    init(_ textField: ASTextField?, _ icon: UIImage?, _ multiplier: ASTMultiplier?, _ closure: ASTextFieldIconClosure?, _ alignType: ASTAlignType = .left) {
        super.init(frame: CGRect.zero)
        self.textField = textField
        self.imageOn = icon
        self.isActive = true
        self.multiplier = multiplier
        self.iconClosure = closure
        self.alignType = alignType
        setup()
    }
    
    init(_ textField: ASTextField?, _ imageOn: UIImage?, _ imageOff: UIImage?, _ multiplier: ASTMultiplier?, _ defaultType: Bool, _ closure: ASTextFieldIconClosure?, _ alignType: ASTAlignType = .left) {
        super.init(frame: CGRect.zero)
        self.textField = textField
        self.iconClosure = closure
        self.isActive = true
        self.multiplier = multiplier
        self.isOn = defaultType
        self.imageOn = imageOn
        self.imageOff = imageOff
        self.alignType = alignType
        self.iconHilightWithRightIconBehavior()
        textField?.textFieldHilightWithRightIconBehavior(self.isOn)
        setup()
    }
    
    init(_ textField: ASTextField?, _ imageOn: UIImage?, _ imageOff: UIImage?, _ multiplier: ASTMultiplier?, _ defaultType: Bool, _ isAutoEvent: Bool, _ closure: ASTextFieldIconClosure?, _ alignType: ASTAlignType = .left) {
        super.init(frame: CGRect.zero)
        self.textField = textField
        self.iconClosure = closure
        self.isActive = true
        self.isAutoEvent = isAutoEvent
        self.multiplier = multiplier
        self.isOn = defaultType
        self.imageOn = imageOn
        self.imageOff = imageOff
        self.alignType = alignType
        self.iconHilightWithRightIconBehavior()
        textField?.textFieldHilightWithRightIconBehavior(self.isOn)
        setup()
    }
    
    public func setup() {
        initUIElements()
        setupUIElements()
        setupConstraints()
    }
    
    public func initUIElements() {
        // MARK: - Container --->
        container = UIView()
        addSubview(container.unsafelyUnwrapped)
        // MARK: - Container <---
        
        // MARK: - ImageView --->
        imageView = UIImageView()
        container?.addSubview(imageView.unsafelyUnwrapped)
        // MARK: - ImageView <---
    }
    
    public func setupUIElements() {
        // MARK: - Self --->
        backgroundColor = .clear
        addGestureRecognizer(ASTextFieldGestureRecognizer(target: self, action: #selector(iconEvent(_:))))
        // MARK: - Self <---
        
        // MARK: - Container --->
        container?.backgroundColor = .clear
        // MARK: - Container <---
        
        // MARK: - ImageView --->
        iconHilightWithRightIconBehavior()
        imageView?.contentMode = .scaleAspectFit
        imageView?.backgroundColor = .clear
        // MARK: - ImageView <---
    }
    
    func setupConstraints() {
        if #available(iOS 9.0, *) {
            // MARK: - Container --->
            container?.ast_deactivateAllConstraints()
            container?.topAnchor.constraint(equalTo: topAnchor).isActive = true
            container?.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
            container?.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
            container?.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
            // MARK: - Container <---
            
            // MARK: - ImageView --->
            imageView?.ast_deactivateAllConstraints()
            imageView?.topAnchor.constraint(equalTo: container.unsafelyUnwrapped.topAnchor).isActive = true
            imageView?.leftAnchor.constraint(equalTo: container.unsafelyUnwrapped.leftAnchor).isActive = true
            imageView?.rightAnchor.constraint(equalTo: container.unsafelyUnwrapped.rightAnchor).isActive = true
            imageView?.bottomAnchor.constraint(equalTo: container.unsafelyUnwrapped.bottomAnchor).isActive = true
            imageView?.centerXAnchor.constraint(equalTo: container.unsafelyUnwrapped.centerXAnchor).isActive = true
            imageView?.centerYAnchor.constraint(equalTo: container.unsafelyUnwrapped.centerYAnchor).isActive = true
            // MARK: - ImageView <---
        } else {
            // Fallback on earlier versions
        }
    }
}

extension ASTView {
    @objc public func iconEvent(_ sender: ASTextFieldGestureRecognizer? = nil) {
        isOn.toggle()
        if isAutoEvent {
            iconHilightWithRightIconBehavior()
            textField?.textFieldHilightWithRightIconBehavior(isOn)
        }
        iconClosure?(textField.unsafelyUnwrapped, self, isOn)
    }
    
    func iconHilightWithRightIconBehavior() {
        if isAutoEvent, let imageOn = imageOn, let imageOff = imageOff {
            imageView?.image = isOn ? imageOn : imageOff
        }else if let imageOn = imageOn {
            imageView?.image = imageOn
        }
    }
}
