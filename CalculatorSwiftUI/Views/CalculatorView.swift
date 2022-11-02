//
//  CalculatorView.swift
//  CalculatorSwiftUI
//
//  Created by Anna Tsvetkova on 02.11.2022.
//

import SwiftUI

struct CalculatorView: View {
    
    var buttonTypes: [[ButtonType]] =
    [[.allClear, .negative, .percent, .operation(operation: .division)],
     [.digit(digit: .seven), .digit(digit: .eight), .digit(digit: .nine), .operation(operation: .multiplication)],
     [.digit(digit: .four), .digit(digit: .five), .digit(digit: .six), .operation(operation: .subtracting)],
     [.digit(digit: .one), .digit(digit: .two), .digit(digit: .three), .operation(operation: .addition)],
     [.digit(digit: .zero), .decimal, .equals]]
    
    var body: some View {
        VStack {
            Spacer()
            displayText
            buttonPad
        }
        .padding(Constants.padding)
        .background(Color.black)
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}

extension CalculatorView {
    private var displayText: some View {
        Text("0")
            .padding()
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, alignment: .trailing)
            .font(.system(size: 88, weight: .light, design: .default))
            .lineLimit(1)
            .minimumScaleFactor(0.2)
    }
    
    private var buttonPad: some View {
        VStack(spacing: Constants.padding) {
            ForEach(buttonTypes, id: \.self) { row in
                HStack(spacing: Constants.padding) {
                    ForEach(row, id: \.self) { buttonType in
                       CalculatorButton(buttonType: buttonType)
                    }
                }
            }
        }
    }
}
