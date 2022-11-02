//
//  CalculatorView.swift
//  CalculatorSwiftUI
//
//  Created by Anna Tsvetkova on 02.11.2022.
//

import SwiftUI

struct CalculatorView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("0")
                .padding()
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .font(.system(size: 88, weight: .light, design: .default))
                .lineLimit(1)
                .minimumScaleFactor(0.2)
        }
        .background(Color.black)
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}
