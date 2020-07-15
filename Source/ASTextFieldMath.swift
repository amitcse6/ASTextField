//
//  ASTextFieldMath.swift
//  superapp
//
//  Created by Amit on 30/6/20.
//  Copyright © 2020 Amit. All rights reserved.
//

import Foundation
import UIKit

public class ASTextFieldMath {
}

extension String {
    //    func applyPatternOnNumbers(pattern:String = "+# (###) ###-####", replacmentCharacter:Character = "#") -> String {
    //        var pureNumber = self.replacingOccurrences( of: "[^0-9]", with: "", options: .regularExpression)
    //        for index in 0 ..< pattern.count {
    //            guard index < pureNumber.count else { return pureNumber }
    //            let stringIndex = String.Index(encodedOffset: index)
    //            let patternCharacter = pattern[stringIndex]
    //            guard patternCharacter != replacmentCharacter else { continue }
    //            pureNumber.insert(patternCharacter, at: stringIndex)
    //        }
    //        return pureNumber
    //    }
    
    func format(with mask: String) -> String {
        let numbers = self.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        var result = ""
        var index = numbers.startIndex // numbers iterator
        // iterate over the mask characters until the iterator of numbers ends
        for ch in mask where index < numbers.endIndex {
            if ch == "X" {
                // mask requires a number in this place, so take the next one
                result.append(numbers[index])
                // move numbers iterator to the next index
                index = numbers.index(after: index)
            } else {
                result.append(ch) // just append a mask character
            }
        }
        return result
    }
    
    func deformat(with mask: String) -> String {
        let numbers = self.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        var result = ""
        var index = numbers.startIndex // numbers iterator
        // iterate over the mask characters until the iterator of numbers ends
        for ch in mask where index < numbers.endIndex {
            if ch == "X" {
                // mask requires a number in this place, so take the next one
                result.append(numbers[index])
                // move numbers iterator to the next index
                index = numbers.index(after: index)
            } else {
                result.append(ch) // just append a mask character
            }
        }
        return result
    }
}

