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
    
    public init(_ delegate: ASTextFieldDelegate, _ titleMultiplier: CGFloat, _ name: String?, _ validator: AnyObject?) {
        super.init(frame: CGRect.zero)
        self.delegate = delegate
        self.titleMultiplier = titleMultiplier
        setName(name, true)
        setAutoEventAll(validator)
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
        setPlaceholder(("Enter \(name ?? "Enter something here.")"), true)
        // MARK: - TextField <---
        
        // MARK: - Views --->
        views?.forEach({ (view) in
            view.backgroundColor = .clear
        })
        // MARK: - Views <---
        
        // MARK: - TitleLabel --->
        //setTitle()
        // MARK: - TitleLabel <---
        
        // MARK: - ErrorLabel --->
        errorLabel?.font = UIFont.systemFont(ofSize: 10)
        errorLabel?.textColor = .red
        errorLabel?.textAlignment = .left
        errorLabel?.text = ""
        // MARK: - ErrorLabel <---
    }
}


