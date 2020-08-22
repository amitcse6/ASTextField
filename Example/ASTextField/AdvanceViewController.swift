//
//  AdvanceViewController.swift
//  ASTextField_Example
//
//  Created by Amit on 22/8/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import ASTextField

class AdvanceViewController: UIViewController, ASTextFieldDelegate {
    @IBOutlet weak var firstNameTextField: ASTextFieldClassic!
    @IBOutlet weak var lastNameTextField: ASTextFieldClassic!
    @IBOutlet weak var emailTextField: ASTextFieldClassic!
    @IBOutlet weak var phoneTextField: ASTextFieldClassic!
    @IBOutlet weak var countryTextField: ASTextFieldClassic!
    @IBOutlet weak var passwordTextField: ASTextFieldClassic!
    @IBOutlet weak var confirmPasswordTextField: ASTextFieldClassic!
    
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
                .setText("")
                .setDelegate(self)
            
            countryTextField.backgroundColor = .clear
            countryTextField
                .setTextColor(.black)
                .setFont(UIFont.systemFont(ofSize: 15))
                .setName("Country", true)
                .setRightIcon(UIImage(named: "drop-down"), nil, 0.3, true) { (textField, textFieldIconView, isOnOrOff) in
                    print("isOnOrOff: \(isOnOrOff)")
            }
            .setAlwaysUppercase(true)
            .setText("")
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
        
        
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
         }
         */
        
        @IBAction func submitEvent(_ sender: Any) {
            print("First Name: \(firstNameTextField.getText())")
            print("Last Name: \(lastNameTextField.getText())")
            print("Email: \(emailTextField.getText())")
            print("Phone: \(phoneTextField.getText())")
            print("Country: \(countryTextField.getText())")
            print("Password: \(passwordTextField.getText())")
        }
    }
