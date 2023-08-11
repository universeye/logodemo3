//
//  Double+Ext.swift
//  LogoDemo3
//
//  Created by Terry Kuo on 2023/8/11.
//

import Foundation

public extension Double{
    func integerPart() -> Int {
        let result = floor(abs(self)).description.dropLast(2).description
        let plusMinus = self < 0 ? "-" : ""
        return  Int(plusMinus + result)!
    }
    
    func fractionalPart(_ withDecimalQty:Int = 2) -> Int {
        let valDecimal = self.truncatingRemainder(dividingBy: 1)
        let formatted = String(format: "%.\(withDecimalQty)f", valDecimal)
        let dropQuantity = self < 0 ? 3:2
        return Int(formatted.dropFirst(dropQuantity).description)!
    }
}
