//
//  GlassMorphismCardView.swift
//  LogoDemo3
//
//  Created by Terry Kuo on 2023/8/12.
//

import SwiftUI

struct GlassMorphismCardView: View {
    @Binding var blurView: UIVisualEffectView
    @Binding var defaultBlurRadius: CGFloat
    @Binding var defaultSaturationAmount: CGFloat
    @Binding var isShow: Bool
    
    var body: some View {
        ZStack {
            CustumBlurView(effect: .systemUltraThinMaterialDark) { view in
                blurView = view
                if defaultBlurRadius == 0 {
                    defaultBlurRadius = view.gaussianBlurRadius
                }
                if defaultSaturationAmount == 0 {
                    defaultSaturationAmount = view.saturationAmount
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
            
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(
                    .linearGradient(colors: [
                        .white.opacity(0.25),
                        .white.opacity(0)
                    ], startPoint: .topLeading, endPoint: .bottomTrailing)
                )
                .blur(radius: 5)
            
            //Border
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .stroke(
                    .linearGradient(colors: [
                        .white.opacity(0.6),
                        .clear,
                        .purple.opacity(0.2),
                        .purple.opacity(0.5)
                    ], startPoint: .topLeading, endPoint: .bottomTrailing),
                    lineWidth: 2
                )
        }
        .shadow(color: .black.opacity(0.15), radius: 5, x: -10, y: 10)
        .shadow(color: .black.opacity(0.15), radius: 5, x: 10, y: -10)
        .overlay(content: {
            CardContentView()
                .opacity(isShow ? 1 : 0)
                .animation(.easeIn(duration: 0.5), value: isShow)
        })
        .padding(.horizontal, 25)
        .frame(height: 220)
    } 
}

struct GlassMorphismCardView_Previews: PreviewProvider {
    static var previews: some View {
        GlassMorphismView()
            .preferredColorScheme(.dark)
    }
}
