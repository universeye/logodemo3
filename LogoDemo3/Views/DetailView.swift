//
//  DetailView.swift
//  LogoDemo3
//
//  Created by Terry Kuo on 2024/3/27.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.safeArea) var safeArea
    var body: some View {
        ZStack {
            Color.yellow
            VStack {
                Text("Top = \(safeArea.top)\nBottom = \(safeArea.bottom)")
                Button("Log in") { }
                    .foregroundStyle(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.red)
                    .clipShape(Capsule())
                
                Button("Reset Password") { }
                    .foregroundStyle(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.red)
                    .clipShape(Capsule())
            }
            .fixedSize(horizontal: true, vertical: false)
        }
        .navigationTitle("Datail View")
        .ignoresSafeArea()
    }
}

#Preview {
    DetailView()
}
