//
//  CalculatorButtonStyle.swift
//  CalculatorSwiftUI
//
//  Created by Anna Tsvetkova on 03.11.2022.
//

import SwiftUI

struct CalculatorButtonStyle: ButtonStyle {
    
    var size: CGFloat
    var backgroundColor: Color
    var foregroundColor: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 32, weight: .medium, design: .default))
            .frame(width: size, height: size)
            .background(backgroundColor)
            .foregroundColor(foregroundColor)
            .overlay {
                if configuration.isPressed {
                    Color(white: 1.0, opacity: 0.2)
                }
            }
            .clipShape(Capsule())
    }
}

struct CalculatorButtonStyle_Previews: PreviewProvider {
    
    static let buttonType: ButtonType = .digit(digit: .five)
    
    static var previews: some View {
        Button(buttonType.description) { }
        .buttonStyle(CalculatorButtonStyle(
            size: 80,
            backgroundColor: buttonType.backgroundColor,
            foregroundColor: buttonType.foregroungColor)
        )
    }
}
