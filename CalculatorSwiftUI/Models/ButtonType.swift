//
//  ButtonType.swift
//  CalculatorSwiftUI
//
//  Created by Anna Tsvetkova on 03.11.2022.
//

import Foundation
import SwiftUI

enum ButtonType: Hashable, CustomStringConvertible {
    case digit(digit: Digits)
    case operation(operation: ArithmeticOperations)
    case percent
    case negative
    case decimal
    case equals
    case clear
    case allClear
    
    var description: String {
        switch self {
        case .digit(let digit):
            return digit.description
        case .operation(let operation):
            return operation.description
        case .percent:
            return "%"
        case .negative:
            return "±"
        case .decimal:
            return "."
        case .equals:
            return "="
        case .clear:
            return "C"
        case .allClear:
            return "AC"
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .digit, .decimal:
            return .secondary
        case .operation, .equals:
            return .orange
        case .percent, .negative, .clear, .allClear:
            return Color(uiColor: .lightGray)
        }
    }
    
    var foregroungColor: Color {
        switch self {
        case .percent, .negative, .clear, .allClear:
            return .black
        default:
            return .white
        }
    }
}
