//
//  Digits.swift
//  CalculatorSwiftUI
//
//  Created by Anna Tsvetkova on 03.11.2022.
//

import Foundation

enum Digits: Int, CaseIterable, CustomStringConvertible {
    
    case zero, one, two, three, four, five, six, seven, eight, nine
    
    var description: String {
        "\(rawValue)"
    }
}
