//
//  DecoratedViewController.swift
//  ASTextField_Example
//
//  Created by Amit on 12/9/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import ASTextField

class DecoratedViewController: UIViewController, ASTextFieldDelegate {
    @IBOutlet weak var firstNameTextField: ASTextFieldDecorated!
    @IBOutlet weak var lastNameTextField: ASTextFieldDecorated!
    @IBOutlet weak var emailTextField: ASTextFieldDecorated!
    @IBOutlet weak var phoneTextField: ASTextFieldDecorated!
    @IBOutlet weak var countryTextField: ASTextFieldDecorated!
    @IBOutlet weak var passwordTextField: ASTextFieldDecorated!
    @IBOutlet weak var confirmPasswordTextField: ASTextFieldDecorated!
    
    let titleProps = GlobalVariable.titleDProps
    let inputProps = GlobalVariable.inputDProps
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
    
    let boxPadding = CGSize(width: 50, height: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 245/255.0, green: 245/255.0, blue: 245/255.0, alpha: 1.0)
        
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
            .setBackgroundIcon(UIImage(named: "input-bg"))
            .setDBoxPadding(boxPadding)
        
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
            .setBackgroundIcon(UIImage(named: "input-bg"))
            .setDBoxPadding(boxPadding)
        
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
            .setBackgroundIcon(UIImage(named: "input-bg"))
            .setDBoxPadding(boxPadding)
        
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
            .setBackgroundIcon(UIImage(named: "input-bg"))
            .setDBoxPadding(boxPadding)
        
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
            .setBackgroundIcon(UIImage(named: "input-bg"))
            .setDBoxPadding(boxPadding)
        
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
            .setBackgroundIcon(UIImage(named: "input-bg"))
            .setDBoxPadding(boxPadding)
        
        
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
            .setBackgroundIcon(UIImage(named: "input-bg"))
            .setDBoxPadding(boxPadding)
        
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
