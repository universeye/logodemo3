//
//  SplitScreenView.swift
//  LogoDemo3
//
//  Created by Terry Kuo on 2024/3/1.
//

import SwiftUI
import VerticalSplit

struct SplitScreenView: View {
    @State private var detent = SplitDetent.fraction(0.5)
    
    var body: some View {
        VerticalSplit(detent: $detent, topTitle: "Map", bottomTitle: "Directions") {
            ExtensionDemo()
        } bottomView: {
            KavSoftView()
        }
        .leadingAccessories([SplitAccessory(systemName: "car", action: {
            print("Car")
        })])
        .menuAccessories([MenuAccessory(title: "Homw", systemName: "House", action: {
            print("Home")
        })])
    }
}

#Preview {
    SplitScreenView()
}
