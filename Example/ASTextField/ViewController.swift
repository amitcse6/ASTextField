//
//  ViewController.swift
//  ASTextField
//
//  Created by amitpstu1@gmail.com on 07/05/2020.
//  Copyright (c) 2020 amitpstu1@gmail.com. All rights reserved.
//

import UIKit
import ASTextField

class ViewController: UIViewController {
    
    @IBOutlet weak var firstNameTextField: ASTextField!
    @IBOutlet weak var lastNameTextField: ASTextField!
    @IBOutlet weak var emailTextField: ASTextFieldClassicStyle!
    @IBOutlet weak var phoneTextField: ASTextFieldClassicStyle!
    @IBOutlet weak var countryTextField: ASTextFieldClassicStyle!
    @IBOutlet weak var passwordTextField: ASTextFieldClassicStyle!
    @IBOutlet weak var confirmPasswordTextField: ASTextFieldClassicStyle!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstNameTextField.backgroundColor = .clear
        firstNameTextField
            .setTextColor(.black)
            .setFont(UIFont.systemFont(ofSize: 15))
            .setName("First Name", true)
            .setDefaultValue("Amit") 
            .setDelegate(self)
        
        lastNameTextField.backgroundColor = .clear
        lastNameTextField
            .setTextColor(.black)
            .setFont(UIFont.systemFont(ofSize: 15))
            .setName("Last Name", true)
            .setDelegate(self)
        
        emailTextField.backgroundColor = .clear
        emailTextField
            .setTextColor(.black)
            .setFont(UIFont.systemFont(ofSize: 15))
            .setName("Email Address", true)
            .setText("arif1@gamil.com")
            .setAlwaysLowercase(true)
        
        phoneTextField.backgroundColor = .clear
        phoneTextField
            .setTextColor(.black)
            .setFont(UIFont.systemFont(ofSize: 15))
            .setName("Phone", true)
            .setPhomeMask("+XXX (XX) XXXX XXXX", "+XXXXXXXXXXXXX")
            .setText("", true)
            .setDelegate(self)
        
        countryTextField.backgroundColor = .clear
        countryTextField
            .setTextColor(.black)
            .setFont(UIFont.systemFont(ofSize: 15))
            .setName("Country", true)
            .setDropDown({index, object in
                print("index: \(index)")
            }, nil, nil)
            .setAlwaysUppercase(true)
            .setText("", true)
            .setDelegate(self)
        
        passwordTextField.backgroundColor = .clear
        passwordTextField
            .setTextColor(.black)
            .setFont(UIFont.systemFont(ofSize: 15))
            .setName("Password", true)
            .setSecureTextEntry(true)
            .setDelegate(self)
        
        
        confirmPasswordTextField.backgroundColor = .clear
        confirmPasswordTextField
            .setTextColor(.black)
            .setFont(UIFont.systemFont(ofSize: 15))
            .setName("Confirm Password", true)
            .setSecureTextEntry(true)
            .setDelegate(self)
        
        ASTextField.hideKeyboardWhenTappedAround(view)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func submitEvent(_ sender: Any) {
        print("First Name: \(firstNameTextField.getText())")
        print("Last Name: \(lastNameTextField.getText())")
        print("Email: \(emailTextField.getText())")
        print("Phone: \(phoneTextField.getText())")
        print("Country: \(countryTextField.getText())")
        print("Password: \(passwordTextField.getText())")
    }
}

extension ViewController: ASTextFieldDelegate {
    
}
