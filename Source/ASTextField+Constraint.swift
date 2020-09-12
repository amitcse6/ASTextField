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
                // MARK: - ImageView --->
                imageView?.ast_deactivateAllConstraints()
                imageView?.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
                imageView?.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
                imageView?.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
                imageView?.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
                // MARK: - ImageView <---
                
                
                // MARK: - TitleLabel --->
                titleLabel?.ast_deactivateAllConstraints()
                titleLabel?.topAnchor.constraint(equalTo: topAnchor, constant: boxVerticalPadding).isActive = true
                titleLabel?.leftAnchor.constraint(equalTo: leftAnchor, constant: boxHorizontalPadding).isActive = true
                titleLabel?.rightAnchor.constraint(equalTo: rightAnchor, constant: -boxHorizontalPadding).isActive = true
                titleLabel?.heightAnchor.constraint(equalTo: heightAnchor, multiplier: titleMultiplier).isActive = true
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
                // MARK: - ImageView --->
                imageView?.ast_deactivateAllConstraints()
                imageView?.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
                imageView?.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
                imageView?.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
                imageView?.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
                // MARK: - ImageView <---
                
                // MARK: - TitleLabel --->
                titleLabel?.ast_deactivateAllConstraints()
                titleLabel?.topAnchor.constraint(equalTo: topAnchor, constant: boxVerticalPadding).isActive = true
                titleLabel?.leftAnchor.constraint(equalTo: leftAnchor, constant: boxHorizontalPadding).isActive = true
                titleLabel?.rightAnchor.constraint(equalTo: rightAnchor, constant: -boxHorizontalPadding).isActive = true
                titleLabel?.heightAnchor.constraint(equalTo: heightAnchor, multiplier: titleMultiplier).isActive = true
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
                // MARK: - ImageView --->
                imageView?.ast_deactivateAllConstraints()
                imageView?.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
                imageView?.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
                imageView?.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
                imageView?.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
                // MARK: - ImageView <---
                
                // MARK: - TitleLabel --->
                titleLabel?.ast_deactivateAllConstraints()
                titleLabel?.topAnchor.constraint(equalTo: topAnchor, constant: boxVerticalPadding).isActive = true
                titleLabel?.leftAnchor.constraint(equalTo: leftAnchor, constant: padding0).isActive = true
                titleLabel?.rightAnchor.constraint(equalTo: rightAnchor, constant: -padding0).isActive = true
                titleLabel?.heightAnchor.constraint(equalTo: heightAnchor, multiplier: titleMultiplier).isActive = true
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
            case .decorated:
                // MARK: - ImageView --->
                imageView?.ast_deactivateAllConstraints()
                imageView?.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
                imageView?.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
                imageView?.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
                imageView?.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
                // MARK: - ImageView <---
                
                
                // MARK: - TitleLabel --->
                titleLabel?.ast_deactivateAllConstraints()
                titleLabel?.topAnchor.constraint(equalTo: topAnchor, constant: boxDVerticalPadding).isActive = true
                titleLabel?.leftAnchor.constraint(equalTo: leftAnchor, constant: boxDHorizontalPadding).isActive = true
                titleLabel?.rightAnchor.constraint(equalTo: rightAnchor, constant: -boxDHorizontalPadding).isActive = true
                titleLabel?.heightAnchor.constraint(equalTo: heightAnchor, multiplier: titleMultiplier).isActive = true
                // MARK: - TitleLabel <---
                
                // MARK: - ErrorLabel --->
                errorLabel?.ast_deactivateAllConstraints()
                errorLabel?.leftAnchor.constraint(equalTo: leftAnchor, constant: boxDHorizontalPadding).isActive = true
                errorLabel?.rightAnchor.constraint(equalTo: rightAnchor, constant: -boxDHorizontalPadding).isActive = true
                errorLabel?.bottomAnchor.constraint(equalTo: bottomAnchor, constant: padding0).isActive = true
                // MARK: - ErrorLabel <---
                
                // MARK: - Container --->
                container?.ast_deactivateAllConstraints()
                container?.topAnchor.constraint(equalTo: topAnchor, constant: boxDVerticalPadding).isActive = true
                container?.leftAnchor.constraint(equalTo: leftAnchor, constant: boxDHorizontalPadding).isActive = true
                container?.rightAnchor.constraint(equalTo: rightAnchor, constant: -boxDHorizontalPadding).isActive = true
                container?.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -boxDVerticalPadding).isActive = true
                // MARK: - Container <---
            }
            
            // MARK: - LeftViews --->
            if let views = views?.filter({$0.alignType == .left}) {
                for (index, iconView) in views.enumerated() {
                    iconView.ast_deactivateAllConstraints()
                    iconView.setupConstraints()
                    if index == 0 {
                        iconView.leftAnchor.constraint(equalTo: container.unsafelyUnwrapped.leftAnchor, constant: boxHorizontalPadding).isActive = true
                    }else {
                        iconView.leftAnchor.constraint(equalTo: views[index-1].rightAnchor, constant: padding4).isActive = true
                    }
                    iconView.centerYAnchor.constraint(equalTo: container.unsafelyUnwrapped.centerYAnchor).isActive = true
                    // MARK: - WidthAnchor HeightAnchor --->
                    if  iconView.isActive {
                        iconView.heightAnchor.constraint(equalTo: container.unsafelyUnwrapped.heightAnchor, multiplier: iconView.multiplier?.v ?? 1).isActive = true
                        if let multiplier = iconView.multiplier, multiplier.hAsWidth {
                            iconView.widthAnchor.constraint(equalTo: container.unsafelyUnwrapped.widthAnchor, multiplier: multiplier.h).isActive = true
                        }else if let multiplier = iconView.multiplier {
                            iconView.widthAnchor.constraint(equalTo: container.unsafelyUnwrapped.heightAnchor, multiplier: multiplier.h).isActive = true
                        }else {
                            iconView.widthAnchor.constraint(equalTo: iconView.heightAnchor).isActive = true
                        }
                    }else{
                        iconView.widthAnchor.constraint(equalToConstant: 0).isActive = true
                        iconView.heightAnchor.constraint(equalToConstant: 0).isActive = true
                    }
                    // MARK: - WidthAnchor HeightAnchor <---
                }
            }
            // MARK: - LeftViews <---
            
            // MARK: - RightViews --->
            if let views = views?.filter({$0.alignType == .right}) {
                for (index, iconView) in views.enumerated() {
                    iconView.ast_deactivateAllConstraints()
                    iconView.setupConstraints()
                    if index == 0 {
                        iconView.rightAnchor.constraint(equalTo: container.unsafelyUnwrapped.rightAnchor, constant: -boxHorizontalPadding).isActive = true
                    }else {
                        iconView.rightAnchor.constraint(equalTo: views[index-1].leftAnchor, constant: -padding4).isActive = true
                    }
                    iconView.centerYAnchor.constraint(equalTo: container.unsafelyUnwrapped.centerYAnchor).isActive = true
                    // MARK: - WidthAnchor HeightAnchor --->
                    if  iconView.isActive {
                        iconView.heightAnchor.constraint(equalTo: container.unsafelyUnwrapped.heightAnchor, multiplier: iconView.multiplier?.v ?? 1).isActive = true
                        if let multiplier = iconView.multiplier, multiplier.hAsWidth {
                            iconView.widthAnchor.constraint(equalTo: container.unsafelyUnwrapped.widthAnchor, multiplier: multiplier.h).isActive = true
                        }else if let multiplier = iconView.multiplier {
                            iconView.widthAnchor.constraint(equalTo: container.unsafelyUnwrapped.heightAnchor, multiplier: multiplier.h).isActive = true
                        }else {
                            iconView.widthAnchor.constraint(equalTo: iconView.heightAnchor).isActive = true
                        }
                    }else{
                        iconView.widthAnchor.constraint(equalToConstant: 0).isActive = true
                        iconView.heightAnchor.constraint(equalToConstant: 0).isActive = true
                    }
                    // MARK: - WidthAnchor HeightAnchor <---
                }
            }
            // MARK: - RightViews <---
            
            // MARK: - TextField --->
            textField?.ast_deactivateAllConstraints()
            textField?.topAnchor.constraint(equalTo: container.unsafelyUnwrapped.topAnchor, constant: padding4).isActive = true
            if let views = views?.filter({$0.alignType == .left}), let view = views.last {
                textField?.leftAnchor.constraint(equalTo: view.rightAnchor, constant: padding4).isActive = true
            }else{
                textField?.leftAnchor.constraint(equalTo: container.unsafelyUnwrapped.leftAnchor, constant: padding4).isActive = true
            }
            if let views = views?.filter({$0.alignType == .right}), let view = views.last {
                textField?.rightAnchor.constraint(equalTo: view.leftAnchor, constant: -padding4).isActive = true
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
