//
//  ClassicViewController.swift
//  ASTextField_Example
//
//  Created by Amit on 22/8/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import ASTextField

class ClassicViewController: UIViewController, ASTextFieldDelegate {
    @IBOutlet weak var firstNameTextField: ASTextFieldClassic!
    @IBOutlet weak var lastNameTextField: ASTextFieldClassic!
    @IBOutlet weak var emailTextField: ASTextFieldClassic!
    @IBOutlet weak var phoneTextField: ASTextFieldClassic!
    @IBOutlet weak var countryTextField: ASTextFieldClassic!
    @IBOutlet weak var passwordTextField: ASTextFieldClassic!
    @IBOutlet weak var confirmPasswordTextField: ASTextFieldClassic!
    
    let titleProps = GlobalVariable.titleProps
    let inputProps = GlobalVariable.inputProps
    let errorProps = GlobalVariable.errorProps
    let titleMultiplier: CGFloat = GlobalVariable.titleMultiplier
    
    let setDefaultText = GlobalVariable.setDefaultText
    let leftInputIconMultiplier: CGFloat = GlobalVariable.inputIconMultiplier
    let rightInputIconMultiplier: CGFloat = GlobalVariable.inputIconMultiplier
    let boxHorizontalPadding: CGFloat = GlobalVariable.boxHorizontalPadding
    let boxVerticalPadding: CGFloat = GlobalVariable.boxVerticalPadding
    
    let leftIconMultiplierV: CGFloat = GlobalVariable.leftInputIconMultiplier
    let leftIconMultiplierH: CGFloat = GlobalVariable.leftInputIconMultiplier
    let rightIconMultiplierH: CGFloat = GlobalVariable.rightInputIconMultiplier
    let rightIconMultiplierV: CGFloat = GlobalVariable.rightInputIconMultiplier
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstNameTextField.backgroundColor = .clear
        firstNameTextField
            .setName("First Name", true)
            .setDelegate(self)
            .setText("Amit", inputProps)
            .setTitleFromName(inputProps)
            .setErrorTitle("", errorProps)
            .setBoxHorizontalPadding(boxHorizontalPadding)
            .setBoxVerticalPadding(boxVerticalPadding)
            .setLeftIcon(UIImage(named: GlobalVariable.userIcon), ASTMultiplier(leftIconMultiplierH, leftIconMultiplierV), {textField, imageView, isOn in print(textField.getName() ?? "") })
        
        lastNameTextField.backgroundColor = .clear
        lastNameTextField
            .setName("Last Name", true)
            .setDelegate(self)
            .setText("Mondol", inputProps)
            .setTitleFromName(titleProps)
            .setErrorTitle("", errorProps)
            .setBoxHorizontalPadding(boxHorizontalPadding)
            .setBoxVerticalPadding(boxVerticalPadding)
            .setLeftIcon(UIImage(named: GlobalVariable.userIcon), ASTMultiplier(leftIconMultiplierH, leftIconMultiplierV), {textField, imageView, isOn in print(textField.getName() ?? "") })
        
        emailTextField.backgroundColor = .clear
        emailTextField
            .setName("Email", true)
            .setDelegate(self)
            .setText("amitpstu1@gmail.com", inputProps)
            .setTitleFromName(titleProps)
            .setErrorTitle("", errorProps)
            .setBoxHorizontalPadding(boxHorizontalPadding)
            .setBoxVerticalPadding(boxVerticalPadding)
            .setLeftIcon(UIImage(named: GlobalVariable.userIcon), ASTMultiplier(leftIconMultiplierH, leftIconMultiplierV), {textField, imageView, isOn in print(textField.getName() ?? "") })
            .setAlwaysLowercase(true)
            .setRightIcon(UIImage(named: GlobalVariable.dropDownIcon), ASTMultiplier(rightIconMultiplierH, rightIconMultiplierV)) { (textField, textFieldIconView, isOnOrOff) in print(textField.getName() ?? "")}
        
        phoneTextField.backgroundColor = .clear
        phoneTextField
            .setName("Phone", true)
            .setDelegate(self)
            .setText("+8801721048866", inputProps)
            .setTitleFromName(titleProps)
            .setErrorTitle("", errorProps)
            .setBoxHorizontalPadding(boxHorizontalPadding)
            .setBoxVerticalPadding(boxVerticalPadding)
            .setLeftIcon(UIImage(named: GlobalVariable.userIcon), ASTMultiplier(leftIconMultiplierH, leftIconMultiplierV), {textField, imageView, isOn in print(textField.getName() ?? "") })
            .setPhomeMask("+XXX (XX) XXXX XXXX", "+XXXXXXXXXXXXX")
        
        countryTextField.backgroundColor = .clear
        countryTextField
            .setName("Country", true)
            .setDelegate(self)
            .setText("Bangladesh", inputProps)
            .setTitleFromName(titleProps)
            .setErrorTitle("", errorProps)
            .setBoxHorizontalPadding(boxHorizontalPadding)
            .setBoxVerticalPadding(boxVerticalPadding)
            .setLeftIcon(UIImage(named: GlobalVariable.userIcon), ASTMultiplier(leftIconMultiplierH, leftIconMultiplierV), {textField, imageView, isOn in print(textField.getName() ?? "") })
            .setRightIcon(UIImage(named: GlobalVariable.dropDownIcon), UIImage(named: GlobalVariable.dropDownIcon), ASTMultiplier(rightIconMultiplierH, rightIconMultiplierV), false) { (textField, textFieldIconView, isOnOrOff) in print(textField.getName() ?? "")}
        
        passwordTextField.backgroundColor = .clear
        passwordTextField
            .setName("Password", true)
            .setDelegate(self)
            .setText("11111111", inputProps)
            .setTitleFromName(titleProps)
            .setErrorTitle("", errorProps)
            .setBoxHorizontalPadding(boxHorizontalPadding)
            .setBoxVerticalPadding(boxVerticalPadding)
            .setLeftIcon(UIImage(named: GlobalVariable.lockIcon), ASTMultiplier(leftIconMultiplierH, leftIconMultiplierV), {textField, imageView, isOn in print(textField.getName() ?? "") })
            .setRightIcon(UIImage(named: GlobalVariable.openEyeIcon), UIImage(named: GlobalVariable.closeEyeIcon), ASTMultiplier(rightIconMultiplierH, rightIconMultiplierV), false) { (textField, textFieldIconView, isOnOrOff) in print(textField.getName() ?? "")}
            .setSecureTextEntry(true)
        
        
        confirmPasswordTextField.backgroundColor = .clear
        confirmPasswordTextField
            .setName("Confirm Password", true)
            .setDelegate(self)
            .setText("11111111", inputProps)
            .setTitleFromName(titleProps)
            .setErrorTitle("", errorProps)
            .setBoxHorizontalPadding(boxHorizontalPadding)
            .setBoxVerticalPadding(boxVerticalPadding)
            .setLeftIcon(UIImage(named: GlobalVariable.lockIcon), ASTMultiplier(leftIconMultiplierH, leftIconMultiplierV), {textField, imageView, isOn in print(textField.getName() ?? "") })
            .setRightIcon(UIImage(named: GlobalVariable.openEyeIcon), UIImage(named: GlobalVariable.closeEyeIcon), ASTMultiplier(rightIconMultiplierH, rightIconMultiplierV), false) { (textField, textFieldIconView, isOnOrOff) in print(textField.getName() ?? "")}
            .setSecureTextEntry(true)
        
        ASTextField.hideKeyboardWhenTappedAround(view)
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
