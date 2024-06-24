//
//  CurrencyExampleView.swift
//  LogoDemo3
//
//  Created by Terry Kuo on 2024/3/4.
//

import SwiftUI
import CurrencyProviding

struct CurrencyExampleView: View {
    @Environment(CurrencyProvider.self)
    private var currencyProvider

    @State private var someNumber: Decimal = 0

    private var decimalToCurrencyString: String {
        currencyProvider.text(for: someNumber)
    }

    var body: some View {
        VStack {
            CurrencyTextField(value: $someNumber)

            currencyProvider.icon(withCircle: true)
        }
    }
}

#Preview {
    CurrencyExampleView()
}
