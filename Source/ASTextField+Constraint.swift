//
//  ASTextField+Extension.swift
//  superapp
//
//  Created by Amit on 8/7/20.
//  Copyright © 2020 Amit. All rights reserved.
//

import Foundation
import UIKit

enum ASTextFieldType {
    case classic
    case advance
    case section
}

extension ASTextField {
    public func setupConstraints() {
        if #available(iOS 9.0, *) {
            switch type {
            case .classic:
                // MARK: - ErrorLabel --->
                errorLabel?.translatesAutoresizingMaskIntoConstraints = false
                errorLabel?.leftAnchor.constraint(equalTo: self.leftAnchor, constant: padding).isActive = true
                errorLabel?.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -padding).isActive = true
                errorLabel?.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: padding4).isActive = true
                // MARK: - ErrorLabel <---
                
                // MARK: - TitleLabel --->
                titleLabel?.translatesAutoresizingMaskIntoConstraints = false
                titleLabel?.topAnchor.constraint(equalTo: self.topAnchor, constant: padding8).isActive = true
                titleLabel?.leftAnchor.constraint(equalTo: self.leftAnchor, constant: padding16).isActive = true
                titleLabel?.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -padding16).isActive = true
                // MARK: - TitleLabel <---
                
                // MARK: - Container --->
                container?.translatesAutoresizingMaskIntoConstraints = false
                container?.topAnchor.constraint(equalTo: topAnchor, constant: padding).isActive = true
                container?.leftAnchor.constraint(equalTo: leftAnchor, constant: padding).isActive = true
                container?.rightAnchor.constraint(equalTo: rightAnchor, constant: -padding).isActive = true
                container?.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding).isActive = true
                container?.translatesAutoresizingMaskIntoConstraints = false
                // MARK: - Container <---
                
                // MARK: - LeftImageView --->
                leftImageView?.translatesAutoresizingMaskIntoConstraints = false
                leftImageView?.leftAnchor.constraint(equalTo: container.unsafelyUnwrapped.leftAnchor, constant: padding).isActive = true
                leftImageView?.heightAnchor.constraint(equalToConstant: 20).isActive = true
                leftImageView?.centerYAnchor.constraint(equalTo: container.unsafelyUnwrapped.centerYAnchor).isActive = true
                if let isActive = leftImageView?.isActive, isActive {
                    leftImageView?.widthAnchor.constraint(equalTo: leftImageView.unsafelyUnwrapped.heightAnchor, constant: -0).isActive = true
                }else{
                    leftImageView?.widthAnchor.constraint(equalToConstant: 0).isActive = true
                }
                // MARK: - LeftImageView <---
                
                // MARK: - LeftImageView --->
                dropDownIcon?.translatesAutoresizingMaskIntoConstraints = false
                dropDownIcon?.topAnchor.constraint(equalTo: container.unsafelyUnwrapped.topAnchor, constant: 0).isActive = true
                dropDownIcon?.rightAnchor.constraint(equalTo: container.unsafelyUnwrapped.rightAnchor, constant: 0).isActive = true
                dropDownIcon?.bottomAnchor.constraint(equalTo: container.unsafelyUnwrapped.bottomAnchor, constant: -0).isActive = true
                dropDownIcon?.centerYAnchor.constraint(equalTo: container.unsafelyUnwrapped.centerYAnchor).isActive = true
                if let dropDownIcon = dropDownIcon, dropDownIcon.isActive {
                    self.dropDownIcon?.widthAnchor.constraint(equalTo: self.dropDownIcon.unsafelyUnwrapped.heightAnchor, constant: -0).isActive = true
                }else{
                    dropDownIcon?.widthAnchor.constraint(equalToConstant: 0).isActive = true
                }
                // MARK: - LeftImageView <---
                
                // MARK: - LeftImageView --->
                rightImageView?.translatesAutoresizingMaskIntoConstraints = false
                rightImageView?.rightAnchor.constraint(equalTo: dropDownIcon.unsafelyUnwrapped.leftAnchor, constant: padding).isActive = true
                rightImageView?.heightAnchor.constraint(equalToConstant: 20).isActive = true
                rightImageView?.centerYAnchor.constraint(equalTo: container.unsafelyUnwrapped.centerYAnchor).isActive = true
                if let isActive = rightImageView?.isActive, isActive {
                    rightImageView?.widthAnchor.constraint(equalTo: rightImageView.unsafelyUnwrapped.heightAnchor, constant: -0).isActive = true
                }else{
                    rightImageView?.widthAnchor.constraint(equalToConstant: 0).isActive = true
                }
                // MARK: - LeftImageView <---
                
                // MARK: - TextField --->
                textField?.translatesAutoresizingMaskIntoConstraints = false
                textField?.topAnchor.constraint(equalTo: container.unsafelyUnwrapped.topAnchor, constant: padding).isActive = true
                textField?.leftAnchor.constraint(equalTo: leftImageView.unsafelyUnwrapped.rightAnchor, constant: padding2).isActive = true
                textField?.rightAnchor.constraint(equalTo: rightImageView.unsafelyUnwrapped.leftAnchor, constant: -padding2).isActive = true
                textField?.bottomAnchor.constraint(equalTo: container.unsafelyUnwrapped.bottomAnchor, constant: -padding).isActive = true
                // MARK: - TextField <---
                break
            case .advance:
                // MARK: - ErrorLabel --->
                errorLabel?.translatesAutoresizingMaskIntoConstraints = false
                errorLabel?.leftAnchor.constraint(equalTo: self.leftAnchor, constant: padding).isActive = true
                errorLabel?.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -padding).isActive = true
                errorLabel?.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: padding4).isActive = true
                // MARK: - ErrorLabel <---
                
                // MARK: - TitleLabel --->
                titleLabel?.translatesAutoresizingMaskIntoConstraints = false
                titleLabel?.topAnchor.constraint(equalTo: self.topAnchor, constant: padding8).isActive = true
                titleLabel?.leftAnchor.constraint(equalTo: self.leftAnchor, constant: padding16).isActive = true
                titleLabel?.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -padding16).isActive = true
                // MARK: - TitleLabel <---
                
                // MARK: - Container --->
                container?.translatesAutoresizingMaskIntoConstraints = false
                container?.topAnchor.constraint(equalTo: topAnchor, constant: padding).isActive = true
                container?.leftAnchor.constraint(equalTo: leftAnchor, constant: padding).isActive = true
                container?.rightAnchor.constraint(equalTo: rightAnchor, constant: -padding).isActive = true
                container?.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding).isActive = true
                container?.translatesAutoresizingMaskIntoConstraints = false
                // MARK: - Container <---
                
                // MARK: - LeftImageView --->
                leftImageView?.translatesAutoresizingMaskIntoConstraints = false
                leftImageView?.topAnchor.constraint(greaterThanOrEqualTo: container.unsafelyUnwrapped.topAnchor, constant: 0).isActive = true
                leftImageView?.leftAnchor.constraint(equalTo: container.unsafelyUnwrapped.leftAnchor, constant: 0).isActive = true
                leftImageView?.bottomAnchor.constraint(lessThanOrEqualTo: container.unsafelyUnwrapped.bottomAnchor, constant: -0).isActive = true
                leftImageView?.centerYAnchor.constraint(equalTo: container.unsafelyUnwrapped.centerYAnchor).isActive = true
                leftImageView?.centerYAnchor.constraint(equalTo: container.unsafelyUnwrapped.centerYAnchor).isActive = true
                if let isActive = leftImageView?.isActive, isActive {
                    leftImageView?.widthAnchor.constraint(equalTo: container.unsafelyUnwrapped.heightAnchor, constant: -0).isActive = true
                }else{
                    leftImageView?.widthAnchor.constraint(equalToConstant: 0).isActive = true
                }
                // MARK: - LeftImageView <---
                
                // MARK: - LeftImageView --->
                dropDownIcon?.translatesAutoresizingMaskIntoConstraints = false
                dropDownIcon?.topAnchor.constraint(equalTo: container.unsafelyUnwrapped.topAnchor, constant: 0).isActive = true
                dropDownIcon?.rightAnchor.constraint(equalTo: container.unsafelyUnwrapped.rightAnchor, constant: 0).isActive = true
                dropDownIcon?.bottomAnchor.constraint(equalTo: container.unsafelyUnwrapped.bottomAnchor, constant: -0).isActive = true
                dropDownIcon?.centerYAnchor.constraint(equalTo: container.unsafelyUnwrapped.centerYAnchor).isActive = true
                if let dropDownIcon = dropDownIcon, dropDownIcon.isActive {
                    self.dropDownIcon?.widthAnchor.constraint(equalTo: self.dropDownIcon.unsafelyUnwrapped.heightAnchor, constant: -0).isActive = true
                }else{
                    dropDownIcon?.widthAnchor.constraint(equalToConstant: 0).isActive = true
                }
                // MARK: - LeftImageView <---
                
                // MARK: - LeftImageView --->
                rightImageView?.translatesAutoresizingMaskIntoConstraints = false
                rightImageView?.topAnchor.constraint(greaterThanOrEqualTo: container.unsafelyUnwrapped.topAnchor, constant: 0).isActive = true
                rightImageView?.rightAnchor.constraint(equalTo: dropDownIcon.unsafelyUnwrapped.leftAnchor, constant: 0).isActive = true
                rightImageView?.bottomAnchor.constraint(lessThanOrEqualTo: container.unsafelyUnwrapped.bottomAnchor, constant: -0).isActive = true
                rightImageView?.centerYAnchor.constraint(equalTo: container.unsafelyUnwrapped.centerYAnchor).isActive = true
                rightImageView?.centerYAnchor.constraint(equalTo: container.unsafelyUnwrapped.centerYAnchor).isActive = true
                if let isActive = rightImageView?.isActive, isActive {
                    rightImageView?.widthAnchor.constraint(equalTo: container.unsafelyUnwrapped.heightAnchor, constant: -0).isActive = true
                }else{
                    rightImageView?.widthAnchor.constraint(equalToConstant: 0).isActive = true
                }
                // MARK: - LeftImageView <---
                
                // MARK: - TextField --->
                textField?.translatesAutoresizingMaskIntoConstraints = false
                textField?.topAnchor.constraint(equalTo: container.unsafelyUnwrapped.topAnchor, constant: padding).isActive = true
                textField?.leftAnchor.constraint(equalTo: leftImageView.unsafelyUnwrapped.rightAnchor, constant: padding2).isActive = true
                textField?.rightAnchor.constraint(equalTo: rightImageView.unsafelyUnwrapped.leftAnchor, constant: -padding2).isActive = true
                textField?.bottomAnchor.constraint(equalTo: container.unsafelyUnwrapped.bottomAnchor, constant: -padding).isActive = true
                // MARK: - TextField <---
                break
            case .section:
                // MARK: - TitleLabel --->
                titleLabel?.translatesAutoresizingMaskIntoConstraints = false
                titleLabel?.topAnchor.constraint(equalTo: self.topAnchor, constant: padding0).isActive = true
                titleLabel?.leftAnchor.constraint(equalTo: self.leftAnchor, constant: padding).isActive = true
                titleLabel?.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -padding).isActive = true
                titleLabel?.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.3).isActive = true
                // MARK: - TitleLabel <---
                
                // MARK: - ErrorLabel --->
                errorLabel?.translatesAutoresizingMaskIntoConstraints = false
                errorLabel?.leftAnchor.constraint(equalTo: self.leftAnchor, constant: padding).isActive = true
                errorLabel?.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -padding).isActive = true
                errorLabel?.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: padding4).isActive = true
                // MARK: - ErrorLabel <---
                
                // MARK: - Container --->
                container?.translatesAutoresizingMaskIntoConstraints = false
                container?.topAnchor.constraint(equalTo: titleLabel.unsafelyUnwrapped.bottomAnchor, constant: padding0).isActive = true
                container?.leftAnchor.constraint(equalTo: leftAnchor, constant: padding).isActive = true
                container?.rightAnchor.constraint(equalTo: rightAnchor, constant: -padding).isActive = true
                container?.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding).isActive = true
                // MARK: - Container <---

                // MARK: - LeftImageView --->
                leftImageView?.translatesAutoresizingMaskIntoConstraints = false
                leftImageView?.topAnchor.constraint(greaterThanOrEqualTo: container.unsafelyUnwrapped.topAnchor, constant: 0).isActive = true
                leftImageView?.leftAnchor.constraint(equalTo: container.unsafelyUnwrapped.leftAnchor, constant: 0).isActive = true
                leftImageView?.bottomAnchor.constraint(lessThanOrEqualTo: container.unsafelyUnwrapped.bottomAnchor, constant: -0).isActive = true
                leftImageView?.centerYAnchor.constraint(equalTo: container.unsafelyUnwrapped.centerYAnchor).isActive = true
                leftImageView?.centerYAnchor.constraint(equalTo: container.unsafelyUnwrapped.centerYAnchor).isActive = true
                if let isActive = leftImageView?.isActive, isActive {
                    leftImageView?.widthAnchor.constraint(equalTo: container.unsafelyUnwrapped.heightAnchor, constant: -0).isActive = true
                }else{
                    leftImageView?.widthAnchor.constraint(equalToConstant: 0).isActive = true
                }
                // MARK: - LeftImageView <---
                
                // MARK: - LeftImageView --->
                dropDownIcon?.translatesAutoresizingMaskIntoConstraints = false
                dropDownIcon?.topAnchor.constraint(equalTo: container.unsafelyUnwrapped.topAnchor, constant: 0).isActive = true
                dropDownIcon?.rightAnchor.constraint(equalTo: container.unsafelyUnwrapped.rightAnchor, constant: 0).isActive = true
                dropDownIcon?.bottomAnchor.constraint(equalTo: container.unsafelyUnwrapped.bottomAnchor, constant: -0).isActive = true
                dropDownIcon?.centerYAnchor.constraint(equalTo: container.unsafelyUnwrapped.centerYAnchor).isActive = true
                if let dropDownIcon = dropDownIcon, dropDownIcon.isActive {
                    self.dropDownIcon?.widthAnchor.constraint(equalTo: self.dropDownIcon.unsafelyUnwrapped.heightAnchor, constant: -0).isActive = true
                }else{
                    dropDownIcon?.widthAnchor.constraint(equalToConstant: 0).isActive = true
                }
                // MARK: - LeftImageView <---
                
                // MARK: - LeftImageView --->
                rightImageView?.translatesAutoresizingMaskIntoConstraints = false
                rightImageView?.topAnchor.constraint(greaterThanOrEqualTo: container.unsafelyUnwrapped.topAnchor, constant: 0).isActive = true
                rightImageView?.rightAnchor.constraint(equalTo: dropDownIcon.unsafelyUnwrapped.leftAnchor, constant: 0).isActive = true
                rightImageView?.bottomAnchor.constraint(lessThanOrEqualTo: container.unsafelyUnwrapped.bottomAnchor, constant: -0).isActive = true
                rightImageView?.centerYAnchor.constraint(equalTo: container.unsafelyUnwrapped.centerYAnchor).isActive = true
                rightImageView?.centerYAnchor.constraint(equalTo: container.unsafelyUnwrapped.centerYAnchor).isActive = true
                if let isActive = rightImageView?.isActive, isActive {
                    rightImageView?.widthAnchor.constraint(equalTo: container.unsafelyUnwrapped.heightAnchor, constant: -0).isActive = true
                }else{
                    rightImageView?.widthAnchor.constraint(equalToConstant: 0).isActive = true
                }
                // MARK: - LeftImageView <---
                
                // MARK: - TextField --->
                textField?.translatesAutoresizingMaskIntoConstraints = false
                textField?.topAnchor.constraint(equalTo: container.unsafelyUnwrapped.topAnchor, constant: padding).isActive = true
                textField?.leftAnchor.constraint(equalTo: leftImageView.unsafelyUnwrapped.rightAnchor, constant: padding2).isActive = true
                textField?.rightAnchor.constraint(equalTo: rightImageView.unsafelyUnwrapped.leftAnchor, constant: -padding2).isActive = true
                textField?.bottomAnchor.constraint(equalTo: container.unsafelyUnwrapped.bottomAnchor, constant: -padding).isActive = true
                // MARK: - TextField <---
                break
            }
        } else {
            // Fallback on earlier versions
        }
    }
}
