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
        @EnvironmentObject private var viewModel: ViewModel
        
        var body: some View {
            Button(buttonType.description) {
                viewModel.performAction(for: buttonType)
            }
            .buttonStyle(CalculatorButtonStyle(
                size: getButtonSize(),
                backgroundColor: getBackgroundColor(),
                foregroundColor: getForegroundColor(),
                isWide: buttonType == .digit(digit: .zero))
            )
        }
        
        private func getButtonSize() -> CGFloat {
            let screenWidth = UIScreen.main.bounds.width
            let buttonCount: CGFloat = 4.0
            let spacingCount = buttonCount + 1
            return (screenWidth - (spacingCount * Constants.padding)) / buttonCount
        }
        
        private func getBackgroundColor() -> Color {
            return viewModel.buttonTypeIsHighlighted(buttonType: buttonType) ? buttonType.foregroungColor : buttonType.backgroundColor
        }
        
        private func getForegroundColor() -> Color {
            return viewModel.buttonTypeIsHighlighted(buttonType: buttonType) ? buttonType.backgroundColor : buttonType.foregroungColor
        }
    }
}


struct CalculatorButton_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView.CalculatorButton(buttonType: .digit(digit: .seven))
    }
}
