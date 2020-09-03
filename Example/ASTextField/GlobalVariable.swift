//
//  GlobalVariable.swift
//  ASTextField_Example
//
//  Created by Amit on 24/8/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import ASTextField

class GlobalVariable {
    static let titleProps = ASTTextProps(UIFont.systemFont(ofSize: 10), .black)
    static let inputProps = ASTTextProps(UIFont.systemFont(ofSize: 12), .darkGray)
    static let errorProps = ASTTextProps(UIFont.systemFont(ofSize: 10), .red)
    static let titleMultiplier: CGFloat = 0.3

    static let setDefaultText = true
    static let inputIconMultiplier: CGFloat = 0.4
    static let leftInputIconMultiplier: CGFloat = 0.4
    static let rightInputIconMultiplier: CGFloat = 0.4
    static let boxHorizontalPadding: CGFloat = 15
    static let boxVerticalPadding: CGFloat = 0
    
    // MARK: - Input Icon --->
    static let userIcon = "avatar"
    static let lockIcon = "lock"
    static let openEyeIcon = "open-eye"
    static let closeEyeIcon = "close-eye"
    static let dropDownIcon = "drop-down"
    // MARK: - Input Field <---

}
