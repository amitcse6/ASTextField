//
//  String+Extension.swift
//  ASTextField
//
//  Created by Amit on 13/9/20.
//

import Foundation
import UIKit

extension String {
    var asttrimmingCharacters: String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
