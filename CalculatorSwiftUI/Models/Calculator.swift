//
//  Calculator.swift
//  CalculatorSwiftUI
//
//  Created by Anna Tsvetkova on 05.11.2022.
//

import Foundation

struct Calculator {
    
    private struct ArithmeticExpression: Equatable {
        
        var number: Decimal
        
        var operation: ArithmeticOperations
        
        func evaluate(with secondNumber: Decimal) -> Decimal {
            switch operation {
            case .addition:
                return number + secondNumber
            case .subtracting:
                return number - secondNumber
            case .multiplication:
                return number * secondNumber
            case .division:
                return number / secondNumber
            }
        }
    }
    
    //MARK: - Properties
    
    private var newNumber: Decimal? {
        didSet {
            guard newNumber != nil else { return }
            carryingNegative = false
            carryingDecimal = false
            carryingZeroCount = 0
            pressedClear = false
        }
    }
    private var expression: ArithmeticExpression?
    private var result: Decimal?
    private var carryingNegative = false
    private var carryingDecimal = false
    private var carryingZeroCount: Int = 0
    private var pressedClear = false
    
    //MARK: - Computed Properties
    
    var displayText: String {
        return getNumberString(forNumber: number, withCommas: true)//"0"
    }
    
    // Current Displaying number
    
    private var number: Decimal? {
        if pressedClear || carryingDecimal {
            return newNumber
        }
        return newNumber ?? expression?.number ?? result
    }
    
    private var containsDecimal: Bool {
        return getNumberString(forNumber: number).contains(".")
    }
    
    var showAllClear: Bool {
        newNumber == nil && expression == nil && result == nil || pressedClear
    }
    
    //MARK: - Operations
    
    mutating func setDigit(digit: Digits) {
        if containsDecimal && digit == .zero {
            carryingZeroCount += 1
        } else if canAddDigit(digit: digit) {
            let numberString = getNumberString(forNumber: newNumber)
            newNumber = Decimal(string: numberString.appending("\(digit.rawValue)"))
        }
    }
    
    mutating func setOperation(operation: ArithmeticOperations) {
        guard var number = newNumber ?? result else { return }
        if let existingExpression = expression {
            number = existingExpression.evaluate(with: number)
        }
        expression = ArithmeticExpression(number: number, operation: operation)
        newNumber = nil
    }
    
    mutating func toggleSign() {
        if let number = newNumber {
            newNumber = -number
            return
        }
        if let number = result {
            result = -number
            return
        }
        carryingNegative.toggle()
    }
    
    mutating func setPercent() {
        if let number = newNumber {
            newNumber = number / 100
            return
        }
        if let number = result {
            result = number / 100
            return
        }
        
    }
    
    mutating func setDecimal() {
        if containsDecimal { return }
        carryingDecimal = true
    }
    
    mutating func evaluate() {
        guard let number = newNumber, let expressionToEvaluate = expression else { return }
        result = expressionToEvaluate.evaluate(with: number)
        newNumber = nil
        expression = nil
    }
    
    mutating func allClear() {
        newNumber = nil
        expression = nil
        result = nil
        carryingNegative = false
        carryingDecimal = false
        carryingZeroCount = 0
    }
    
    mutating func clear() {
        newNumber = nil
        carryingNegative = false
        carryingDecimal = false
        carryingZeroCount = 0
        
        pressedClear = true
    }
    
    //MARK: - Helpers
    
    func operationIsHighlighted(operation: ArithmeticOperations) -> Bool {
        return expression?.operation == operation && newNumber == nil
    }
        
    private func getNumberString(forNumber number: Decimal?, withCommas: Bool = false) -> String {
        var numberString = (withCommas ? number?.formatted(.number) : number.map(String.init)) ?? "0"
        
        if carryingNegative {
            numberString.insert("-", at: numberString.startIndex)
        }
        if carryingDecimal {
            numberString.insert(".", at: numberString.endIndex)
        }
        if carryingZeroCount > 0 {
            numberString.append(String(repeating: "0", count: carryingZeroCount))
        }
        
        return numberString
    }
    
    private func canAddDigit(digit: Digits) -> Bool {
        return number != nil || digit != .zero
    }
}
