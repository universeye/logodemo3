//
//  RollingCounterView.swift
//  LogoDemo3
//
//  Created by Terry Kuo on 2023/8/11.
//

import SwiftUI

struct RollingCounterView: View {
    @State var value: Double = 55
    
    @State var intPart: Int = 5
    @State var fractionalPart: Int = 5
    
    var body: some View {
            VStack {
                HStack(spacing: 0) {
                    RollingText(font: .system(size: 55), weight: .black, value: $intPart)
                    Text(".")
                        .font(.system(size: 55, weight: .black))
                    RollingText(font: .system(size: 55), weight: .black, value: $fractionalPart)
                }
                
                Button("Change Value") {
                    value = .random(in: 100...1300)
                    intPart = value.integerPart()
                    fractionalPart = value.fractionalPart()
                }
            }
            .padding()
            .navigationTitle("Rolling Counter")
            .onAppear {
                intPart = value.integerPart()
                fractionalPart = value.fractionalPart()
            }
    }
}

struct RollingCounterView_Previews: PreviewProvider {
    static var previews: some View {
        RollingCounterView()
    }
}
