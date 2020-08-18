//
//  ASTextFieldClassic.swift
//  superapp
//
//  Created by Amit on 30/6/20.
//  Copyright © 2020 Amit. All rights reserved.
//

import Foundation
import UIKit

public class ASTextFieldClassic: ASTextField {
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    public init(_ delegate: ASTextFieldDelegate) {
        super.init(frame: CGRect.zero)
        self.delegate = delegate
        setup()
    }
    
    public func setup() {
        type = .classic
        initUIElements() 
        setupUIElements()
        setupConstraints()
    }
    
    public func setupUIElements() {
        // MARK: - Container --->
        container?.layer.rasterizationScale = UIScreen.main.scale
        container?.layer.shouldRasterize = true
        setBordeColor(UIColor(red: 200.0/255.0, green: 200.0/255.0, blue: 200.0/255.0, alpha: 1.0))
        setBordeWidth(1.0)
        setCornerRadius50Percent()
        // MARK: - Container <---
        
        // MARK: - TextField --->
        textField?.textColor=UIColor.black
        textField?.textAlignment = .left
        textField?.delegate = self
        textField?.placeholder = "Enter something here."
        textField?.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        // MARK: - TextField <---
        
        // MARK: - LeftImageView --->
        leftImageView?.backgroundColor = .clear
        // MARK: - LeftImageView <---
        
        // MARK: - RightImageView --->
        rightImageView?.backgroundColor = .clear
        // MARK: - RightImageView <---
        
        // MARK: - ErrorLabel --->
        errorLabel?.font = UIFont.systemFont(ofSize: 10)
        errorLabel?.textColor = .red
        errorLabel?.textAlignment = .left
        errorLabel?.text = ""
        // MARK: - ErrorLabel <---
    }
}


