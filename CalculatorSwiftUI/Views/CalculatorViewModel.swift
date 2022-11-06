//
//  CalculatorViewModel.swift
//  CalculatorSwiftUI
//
//  Created by Anna Tsvetkova on 05.11.2022.
//

import Foundation
import Combine

extension CalculatorView {
    final class ViewModel: ObservableObject {
        
        //MARK: - Properties
        
        @Published private var calculator = Calculator()
        
        var displayText: String {
            return calculator.displayText
        }
        
        var buttonTypes: [[ButtonType]] {
            let clearType: ButtonType = calculator.showAllClear ? .allClear : .clear
            return [
                [clearType, .negative, .percent, .operation(operation: .division)],
                [.digit(digit: .seven), .digit(digit: .eight), .digit(digit: .nine), .operation(operation: .multiplication)],
                [.digit(digit: .four), .digit(digit: .five), .digit(digit: .six), .operation(operation: .subtracting)],
                [.digit(digit: .one), .digit(digit: .two), .digit(digit: .three), .operation(operation: .addition)],
                [.digit(digit: .zero), .decimal, .equals]
            ]
        }
        
        //MARK: - Actions
        
        func performAction(for buttonType: ButtonType) {
            switch buttonType {
            case .digit(let digit):
                calculator.setDigit(digit: digit)
            case .operation(let operation):
                calculator.setOperation(operation: operation)
            case .percent:
                calculator.setPercent()
            case .negative:
                calculator.toggleSign()
            case .decimal:
                calculator.setDecimal()
            case .equals:
                calculator.evaluate()
            case .clear:
                calculator.clear()
            case .allClear:
                calculator.allClear()
            }
        }
        
        //MARK: - Helpers
        
        func buttonTypeIsHighlighted(buttonType: ButtonType) -> Bool {
            guard case .operation(let operation) = buttonType else  { return false }
            return calculator.operationIsHighlighted(operation: operation)
        }
    }
}
