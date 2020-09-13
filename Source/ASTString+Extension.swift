//
//  String+Extension.swift
//  ASTextField
//
//  Created by Amit on 13/9/20.
//

import Foundation
import UIKit

extension String {
    public var asttrimmingCharacters: String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
