//
//  VisionProView.swift
//  LogoDemo3
//
//  Created by Terry Kuo on 2024/2/7.
//

import SwiftUI

struct VisionProView: View {
    var body: some View {
        Image(systemName: "visionpro")
            .font(.system(size: 300, weight: .ultraLight))
            .foregroundStyle(
                LinearGradient(
                    colors: [.gray, .black, .gray],
                    startPoint: .top,
                    endPoint: .bottom
                ),
                EllipticalGradient(
                    colors:[Color.purple, Color.black],
                    center: .center,
                    startRadiusFraction: 0.0,
                    endRadiusFraction: 0.55
                )
            )
            .shadow(color: .white, radius: 1)
    }
}

#Preview {
    VisionProView()
        .preferredColorScheme(.dark)
}
