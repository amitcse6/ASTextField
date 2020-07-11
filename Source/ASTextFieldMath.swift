//
//  ASTextFieldMath.swift
//  superapp
//
//  Created by Amit on 30/6/20.
//  Copyright © 2020 Amit. All rights reserved.
//

import Foundation


public class ASTextFieldMath {
}

extension String {
    func applyPatternOnNumbers(pattern:String = "+# (###) ###-####", replacmentCharacter:Character = "#") -> String {
        var pureNumber = self.replacingOccurrences( of: "[^0-9]", with: "", options: .regularExpression)
        for index in 0 ..< pattern.count {
            guard index < pureNumber.count else { return pureNumber }
            let stringIndex = String.Index(encodedOffset: index) 
            let patternCharacter = pattern[stringIndex]
            guard patternCharacter != replacmentCharacter else { continue }
            pureNumber.insert(patternCharacter, at: stringIndex)
        }
        return pureNumber
    }
}
