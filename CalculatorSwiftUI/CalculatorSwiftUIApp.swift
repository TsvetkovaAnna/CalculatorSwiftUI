//
//  CalculatorSwiftUIApp.swift
//  CalculatorSwiftUI
//
//  Created by Anna Tsvetkova on 02.11.2022.
//

import SwiftUI

@main
struct CalculatorSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            CalculatorView()
                .environmentObject(CalculatorView.ViewModel())
        }
    }
}
