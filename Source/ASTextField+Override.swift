//
//  ASTextField+Override.swift
//  ASForm_Example
//
//  Created by Amit on 18/8/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import UIKit

extension ASTextField {
    public override func layoutSubviews() {
        super.layoutSubviews()
        if iscCornerRadius {
            container?.layer.cornerRadius = getCornerRadius()
        }
    }
}
