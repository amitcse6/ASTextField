//
//  ASTextFieldClassicStyleClassic.swift
//  superapp
//
//  Created by Amit on 30/6/20.
//  Copyright © 2020 Amit. All rights reserved.
//

import Foundation

public class ASTextFieldClassicStyle: ASTextField {
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
        setupUIElements()
        setupConstraints()
    }
    
    public func setupUIElements() {
        container = UIView()
        addSubview(self.container.unsafelyUnwrapped)
        container?.layer.rasterizationScale = UIScreen.main.scale
        container?.layer.shouldRasterize = true
        setBordeColor(UIColor(red: 200.0/255.0, green: 200.0/255.0, blue: 200.0/255.0, alpha: 1.0))
        setBordeWidth(1.0)
        
        textField = UITextField()
        container?.addSubview(self.textField.unsafelyUnwrapped)
        textField?.textColor=UIColor.black
        textField?.textAlignment = .left
        textField?.delegate = self
        textField?.placeholder = "Enter something here."
        textField?.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
        errorLabel = UILabel()
        self.addSubview(self.errorLabel.unsafelyUnwrapped)
        errorLabel?.font = UIFont.systemFont(ofSize: 10)
        errorLabel?.textColor = .red
        errorLabel?.textAlignment = .left
        errorLabel?.text = ""
    }
}


