//
//  ASTextField+Init.swift
//  ASForm_Example
//
//  Created by Amit on 18/8/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import UIKit

extension ASTextField {
    public func initUIElements() {
        container = UIView()
        addSubview(container.unsafelyUnwrapped)
        
        titleLabel = UILabel()
        addSubview(titleLabel.unsafelyUnwrapped)
        
        errorLabel = UILabel()
        addSubview(errorLabel.unsafelyUnwrapped)
        
        textField = UITextField()
        container?.addSubview(textField.unsafelyUnwrapped)
        
        leftImageView = ASTImageView()
        leftImageView?.contentMode = .scaleAspectFit
        container?.addSubview(leftImageView.unsafelyUnwrapped)
        
        rightImageView = ASTImageView()
        rightImageView?.contentMode = .scaleAspectFit
        container?.addSubview(rightImageView.unsafelyUnwrapped)
        
        dropDownIcon = ASDropDownIcon()
        container?.addSubview(dropDownIcon.unsafelyUnwrapped)
    }
}
