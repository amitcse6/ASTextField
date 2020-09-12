//
//  ASTextField.swift
//  superapp
//
//  Created by Amit on 23/6/20.
//  Copyright © 2020 Amit. All rights reserved.
//

import Foundation
import UIKit


public class ASTextField: UIView {
    // MARK: - Delegate --->
    public var delegate: ASTextFieldDelegate?
    // MARK: - Delegate <---
    
    // MARK: - Const --->
    final let padding0: CGFloat = 0
    final let padding2: CGFloat = 2
    final let padding4: CGFloat = 4
    final let padding8: CGFloat = 8
    final let padding16: CGFloat = 16
    final let padding24: CGFloat = 24
    final let padding32: CGFloat = 32
    final var padding: CGFloat = 8
    // MARK: - Const <---
    
    // MARK: - Internal --->
    final var index = 0
    
    final var titleMultiplier: CGFloat = 0.3
    
    final var type: ASTextFieldType = .classic
    final var boxHorizontalPadding: CGFloat = 20
    final var boxVerticalPadding: CGFloat = 8
    final var boxDHorizontalPadding: CGFloat = 20
    final var boxDVerticalPadding: CGFloat = 8
    
    final var isEditable = true
    final var isPhoneTextField = false
    final var iscCornerRadius = true
    final var alwaysLowercase = false
    final var alwaysUppercase = false
    
    final var container: UIView?
    final var imageView: UIImageView?
    final var textField: UITextField?
    final var titleLabel: UILabel?
    final var errorLabel: UILabel?
    final var views: [ASTView]? = [ASTView]()
    
    final var autoResetErrorTarget: AnyObject?
    final var autoInvalidTarget: AnyObject?
    
    final var autoInvalidAction: Selector?
    final var autoResetErrorAction: Selector?
    
    final var name: String?
    final var phoneMask: String? = "+XXX (XX) XXXX XXXX"
    final var phoneMaskRev: String? = "+XXXXXXXXXXXXX"
    final var defaultValue: String?
    
    final var state = [String?]()
    // MARK: - Internal --->
}

