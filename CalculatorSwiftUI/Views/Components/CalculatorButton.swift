//
//  CalculatorButton.swift
//  CalculatorSwiftUI
//
//  Created by Anna Tsvetkova on 03.11.2022.
//

import SwiftUI

extension CalculatorView {
    struct CalculatorButton: View {
        
        let buttonType: ButtonType
        
        var body: some View {
            Button(buttonType.description) { }
            .buttonStyle(CalculatorButtonStyle(
                size: getButtonSize(),
                backgroundColor: buttonType.backgroundColor,
                foregroundColor: buttonType.foregroungColor,
                isWide: buttonType == .digit(digit: .zero))
            )
        }
        
        private func getButtonSize() -> CGFloat {
            let screenWidth = UIScreen.main.bounds.width
            let buttonCount: CGFloat = 4.0
            let spacingCount = buttonCount + 1
            return (screenWidth - (spacingCount * Constants.padding)) / buttonCount
        }
    }
}


struct CalculatorButton_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView.CalculatorButton(buttonType: .digit(digit: .seven))
    }
}
