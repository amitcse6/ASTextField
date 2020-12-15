//
//  ASTextField+Alias.swift
//  ASForm_Example
//
//  Created by Amit on 18/8/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import UIKit

public typealias ASTextFieldDropDown = Int
public typealias ASTextFieldIconView = ASTView
public typealias ASTIsOnOrOff = Bool
public typealias ASTextFieldDropDownClosure = (ASTextFieldDropDown, ASTextField) -> Void
public typealias ASTextFieldLeftIconClosure = (ASTextField, ASTextFieldIconView, ASTIsOnOrOff) -> Void
public typealias ASTextFieldRightIconClosure = (ASTextField, ASTextFieldIconView, ASTIsOnOrOff) -> Void
public typealias ASTextFieldIconClosure = (ASTextField, ASTextFieldIconView, ASTIsOnOrOff) -> Void
public typealias ASTextFieldChildViewClosure = () -> UIView

