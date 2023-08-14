//
//  CardContentView.swift
//  LogoDemo3
//
//  Created by Terry Kuo on 2023/8/13.
//

import SwiftUI

struct CardContentView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text("Hello, World!")
                    .modifier(CustumModifier(font: .callout))
                    
            }
        }
        .padding(20)
        .padding(.vertical, 10)
        .blendMode(.overlay)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
}

struct CardContentView_Previews: PreviewProvider {
    static var previews: some View {
        GlassMorphismView()
            .preferredColorScheme(.dark)
    }
}
