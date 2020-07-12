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
    
    //    var firstNameTextField: ASTextField?
    //    var lastNameTextField: ASTextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        firstNameTextField.backgroundColor = .clear
        firstNameTextField
            .setTextColor(.black)
            .setFont(UIFont.systemFont(ofSize: 15))
            .setName("First Name", true)
        
        lastNameTextField.backgroundColor = .clear
        lastNameTextField
            .setTextColor(.black)
            .setFont(UIFont.systemFont(ofSize: 15))
            .setName("Last Name", true)
            .setPhoneTextField(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

