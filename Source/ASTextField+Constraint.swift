//
//  ASTextField+Extension.swift
//  superapp
//
//  Created by Amit on 8/7/20.
//  Copyright © 2020 Amit. All rights reserved.
//

import Foundation
import UIKit

extension ASTextField {
    public func setupConstraints() {
        if #available(iOS 9.0, *) {
            switch type {
            case .classic:
                // MARK: - TitleLabel --->
                titleLabel?.ast_deactivateAllConstraints()
                titleLabel?.topAnchor.constraint(equalTo: topAnchor, constant: boxVerticalPadding).isActive = true
                titleLabel?.leftAnchor.constraint(equalTo: leftAnchor, constant: boxHorizontalPadding).isActive = true
                titleLabel?.rightAnchor.constraint(equalTo: rightAnchor, constant: -boxHorizontalPadding).isActive = true
                // MARK: - TitleLabel <---
                
                // MARK: - ErrorLabel --->
                errorLabel?.ast_deactivateAllConstraints()
                errorLabel?.leftAnchor.constraint(equalTo: leftAnchor, constant: boxHorizontalPadding).isActive = true
                errorLabel?.rightAnchor.constraint(equalTo: rightAnchor, constant: -boxHorizontalPadding).isActive = true
                errorLabel?.bottomAnchor.constraint(equalTo: bottomAnchor, constant: padding0).isActive = true
                // MARK: - ErrorLabel <---
                
                // MARK: - Container --->
                container?.ast_deactivateAllConstraints()
                container?.topAnchor.constraint(equalTo: topAnchor, constant: padding0).isActive = true
                container?.leftAnchor.constraint(equalTo: leftAnchor, constant: padding0).isActive = true
                container?.rightAnchor.constraint(equalTo: rightAnchor, constant: -padding0).isActive = true
                container?.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding16).isActive = true
                // MARK: - Container <---
                break
            case .advance:
                // MARK: - TitleLabel --->
                titleLabel?.ast_deactivateAllConstraints()
                titleLabel?.topAnchor.constraint(equalTo: topAnchor, constant: boxVerticalPadding).isActive = true
                titleLabel?.leftAnchor.constraint(equalTo: leftAnchor, constant: boxHorizontalPadding).isActive = true
                titleLabel?.rightAnchor.constraint(equalTo: rightAnchor, constant: -boxHorizontalPadding).isActive = true
                // MARK: - TitleLabel <---
                
                // MARK: - ErrorLabel --->
                errorLabel?.ast_deactivateAllConstraints()
                errorLabel?.leftAnchor.constraint(equalTo: leftAnchor, constant: boxHorizontalPadding).isActive = true
                errorLabel?.rightAnchor.constraint(equalTo: rightAnchor, constant: -boxHorizontalPadding).isActive = true
                errorLabel?.bottomAnchor.constraint(equalTo: bottomAnchor, constant: padding).isActive = true
                // MARK: - ErrorLabel <---
                
                // MARK: - Container --->
                container?.ast_deactivateAllConstraints()
                container?.topAnchor.constraint(equalTo: topAnchor, constant: padding0).isActive = true
                container?.leftAnchor.constraint(equalTo: leftAnchor, constant: padding0).isActive = true
                container?.rightAnchor.constraint(equalTo: rightAnchor, constant: -padding0).isActive = true
                container?.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding16).isActive = true
                // MARK: - Container <---
                break
            case .section:
                // MARK: - TitleLabel --->
                titleLabel?.ast_deactivateAllConstraints()
                titleLabel?.topAnchor.constraint(equalTo: topAnchor, constant: boxVerticalPadding).isActive = true
                titleLabel?.leftAnchor.constraint(equalTo: leftAnchor, constant: padding0).isActive = true
                titleLabel?.rightAnchor.constraint(equalTo: rightAnchor, constant: -padding0).isActive = true
                // MARK: - TitleLabel <---
                
                // MARK: - ErrorLabel --->
                errorLabel?.ast_deactivateAllConstraints()
                errorLabel?.leftAnchor.constraint(equalTo: leftAnchor, constant: padding0).isActive = true
                errorLabel?.rightAnchor.constraint(equalTo: rightAnchor, constant: -padding0).isActive = true
                errorLabel?.bottomAnchor.constraint(equalTo: bottomAnchor, constant: padding).isActive = true
                // MARK: - ErrorLabel <---
                
                // MARK: - Container --->
                container?.ast_deactivateAllConstraints()
                container?.topAnchor.constraint(equalTo: titleLabel.unsafelyUnwrapped.bottomAnchor, constant: boxVerticalPadding).isActive = true
                container?.leftAnchor.constraint(equalTo: leftAnchor, constant: padding0).isActive = true
                container?.rightAnchor.constraint(equalTo: rightAnchor, constant: -padding0).isActive = true
                container?.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding16).isActive = true
                // MARK: - Container <---
                break
            }
            
            // MARK: - LeftIconViews --->
            if let iconViews = leftIconViews {
                for (index, iconView) in iconViews.enumerated() {
                    iconView.ast_deactivateAllConstraints()
                    iconView.setupConstraints()
                    if index == 0 {
                        iconView.leftAnchor.constraint(equalTo: container.unsafelyUnwrapped.leftAnchor, constant: boxHorizontalPadding).isActive = true
                    }else {
                        iconView.leftAnchor.constraint(equalTo: iconViews[index-1].rightAnchor, constant: padding4).isActive = true
                    }
                    iconView.centerYAnchor.constraint(equalTo: container.unsafelyUnwrapped.centerYAnchor).isActive = true
                    iconView.heightAnchor.constraint(equalTo: container.unsafelyUnwrapped.heightAnchor, multiplier: iconView.multiplier).isActive = true
                    if  iconView.isActive {
                        iconView.widthAnchor.constraint(equalTo: iconView.heightAnchor).isActive = true
                    }else{
                        iconView.widthAnchor.constraint(equalToConstant: 0).isActive = true
                    }
                }
            }
            // MARK: - LeftIconViews <---
            
            // MARK: - RightIconViews --->
            if let iconViews = rightIconViews {
                for (index, iconView) in iconViews.enumerated() {
                    iconView.ast_deactivateAllConstraints()
                    iconView.setupConstraints()
                    if index == 0 {
                        iconView.rightAnchor.constraint(equalTo: container.unsafelyUnwrapped.rightAnchor, constant: -boxHorizontalPadding).isActive = true
                    }else {
                        iconView.rightAnchor.constraint(equalTo: iconViews[index-1].leftAnchor, constant: padding4).isActive = true
                    }
                    iconView.centerYAnchor.constraint(equalTo: container.unsafelyUnwrapped.centerYAnchor).isActive = true
                    iconView.heightAnchor.constraint(equalTo: container.unsafelyUnwrapped.heightAnchor, multiplier: iconView.multiplier).isActive = true
                    if  iconView.isActive {
                        iconView.widthAnchor.constraint(equalTo: iconView.heightAnchor).isActive = true
                    }else{
                        iconView.widthAnchor.constraint(equalToConstant: 0).isActive = true
                    }
                }
            }
            // MARK: - RightIconViews <---
            
            // MARK: - TextField --->
            textField?.ast_deactivateAllConstraints()
            textField?.topAnchor.constraint(equalTo: container.unsafelyUnwrapped.topAnchor, constant: padding4).isActive = true
            if let iconViews = leftIconViews, let iconView = iconViews.last {
                textField?.leftAnchor.constraint(equalTo: iconView.rightAnchor, constant: padding4).isActive = true
            }else{
                textField?.leftAnchor.constraint(equalTo: container.unsafelyUnwrapped.leftAnchor, constant: padding4).isActive = true
            }
            if let iconViews = rightIconViews, let iconView = iconViews.last {
                textField?.rightAnchor.constraint(equalTo: iconView.leftAnchor, constant: -padding4).isActive = true
            }else{
                textField?.rightAnchor.constraint(equalTo: container.unsafelyUnwrapped.rightAnchor, constant: -padding4).isActive = true
            }
            textField?.bottomAnchor.constraint(equalTo: container.unsafelyUnwrapped.bottomAnchor, constant: -padding4).isActive = true
            // MARK: - TextField <---
        } else {
            // Fallback on earlier versions
        }
    }
}
