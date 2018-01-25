//
//  Extensions.swift
//  TechCodeApp
//
//  Created by Mac on 24/01/2018.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit

extension String {
    
    subscript (bounds: CountableClosedRange<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[start...end])
    }
    
    subscript (bounds: CountableRange<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[start..<end])
    }
    
    func leftPadding(toLength: Int, withPad character: Character) -> String {
        
        let newLength = self.characters.count
        if newLength < toLength {
            return String(repeatElement(character, count: toLength - newLength)) + self
        } else {
            return self.substring(from: index(self.startIndex, offsetBy: newLength - toLength))
        }
    }
}


//perform an inclusive range in between date check.
extension String {
    func isBetweeen(startTime : String, EndTime : String) -> Bool {
        var x = self.compare(startTime) == .orderedDescending
        var y = self.compare(EndTime) == .orderedAscending
        var z = x && y
        var zz = x||y
        return (self.compare(startTime) == .orderedDescending  && self.compare(EndTime) == .orderedAscending )
    }
}
