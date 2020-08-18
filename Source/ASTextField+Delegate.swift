//
//  ASTextField+Delegate.swift
//  ASForm_Example
//
//  Created by Amit on 18/8/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import UIKit

@objc public protocol ASTextFieldDelegate {
    @objc optional func textFieldShouldBeginEditing(_ asTextField: ASTextField)
    @objc optional func textFieldDidBeginEditing(_ asTextField: ASTextField)
    @objc optional func textField(_ asTextField: ASTextField, shouldChangeCharactersIn range: NSRange, replacementString string: String)
    @objc optional func textField(_ asTextField: ASTextField, changeCharactersIn range: NSRange, replacementString string: String)
    @objc optional func textFieldDidChange(_ asTextField: ASTextField)
    @objc optional func textFieldDidChangeSelection(_ asTextField: ASTextField)
}

