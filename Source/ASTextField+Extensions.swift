//
//  ASTextField+Extension.swift
//  superapp
//
//  Created by Amit on 8/7/20.
//  Copyright © 2020 Amit. All rights reserved.
//

import Foundation

extension ASTextField {
    public func setupConstraints() { 
        container?.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 9.0, *) {
            container?.topAnchor.constraint(equalTo: topAnchor, constant: PADDING).isActive = true
            container?.leftAnchor.constraint(equalTo: leftAnchor, constant: PADDING).isActive = true
            container?.rightAnchor.constraint(equalTo: rightAnchor, constant: -PADDING).isActive = true
            container?.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -PADDING).isActive = true
            
            textField?.translatesAutoresizingMaskIntoConstraints = false
            textField?.topAnchor.constraint(equalTo: container.unsafelyUnwrapped.topAnchor, constant: PADDING).isActive = true
            textField?.leftAnchor.constraint(equalTo: container.unsafelyUnwrapped.leftAnchor, constant: PADDING).isActive = true
            textFieldRightConstraint = textField?.rightAnchor.constraint(equalTo: container.unsafelyUnwrapped.rightAnchor, constant: -PADDING)
            textFieldRightConstraint?.isActive = true
            textField?.bottomAnchor.constraint(equalTo: container.unsafelyUnwrapped.bottomAnchor, constant: -PADDING).isActive = true
            
            errorLabel?.translatesAutoresizingMaskIntoConstraints = false
            errorLabel?.leftAnchor.constraint(equalTo: self.leftAnchor, constant: PADDING).isActive = true
            errorLabel?.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -PADDING).isActive = true
            errorLabel?.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 5).isActive = true
        } else {
            // Fallback on earlier versions
        }
    }
}
