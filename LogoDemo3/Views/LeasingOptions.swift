//
//  LeasingOptions.swift
//  LogoDemo3
//
//  Created by Terry Kuo on 2023/10/3.
//

import SwiftUI

struct LeasingOptions: View {
    var body: some View {
        VStack(spacing: 16) {
            leasingOptionsCell(period: 24, price: 2370)
            leasingOptionsCell(period: 24, price: 2370)
            leasingOptionsCell(period: 24, price: 2370)
            leasingOptionsCell(period: 24, price: 2370)
        }
    }
    
    @ViewBuilder
    private func leasingOptionsCell(period: Int, price: Int) -> some View {
        HStack(alignment: .bottom, spacing: 20) {
            Image(systemName: "circle")
            VStack(alignment: .leading, spacing: 6) {
                Text("期數")
                    
                HStack {
                    Text("\(period)")
                        .bold()
                        .font(.system(size: 20))
                    Text("期")
                        .foregroundStyle(.gray)
                }
            }
            VStack(alignment: .leading, spacing: 6) {
                Text("租金")
                
                HStack {
                    Text("\(price)")
                        .bold()
                        .font(.system(size: 20))
                    Text("元/期")
                        .foregroundStyle(.gray)
                }
            }
        }
    }
}

#Preview {
    LeasingOptions()
}
