//
//  ArithmeticOperations.swift
//  CalculatorSwiftUI
//
//  Created by Anna Tsvetkova on 03.11.2022.
//

import Foundation

enum ArithmeticOperations: CaseIterable, CustomStringConvertible {
    
    case addition, subtracting, multiplication, division
    
    var description: String {
        switch self {
        case .addition:
            return "+"
        case .subtracting:
            return "-"
        case .multiplication:
            return "×"
        case .division:
            return "÷"
        }
    }
}
