//
//  ThemeButtonCell.swift
//  LogoDemo3
//
//  Created by Terry Kuo on 2024/2/14.
//

import SwiftUI

struct ThemeButtonCell: View {
    var isDark: Bool = false
    
    var body: some View {
        VStack {
            HStack(spacing: 4) {
                Rectangle()
                    .fill(.gray.opacity(0.2))
                    .frame(width: 20, height: 10)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                Rectangle()
                    .fill(.gray.opacity(0.5))
                    .frame(width: 40, height: 10)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
            }
            HStack(spacing: 4) {
                Rectangle()
                    .fill(.gray.opacity(0.2))
                    .frame(width: 20, height: 10)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                Rectangle()
                    .fill(.gray.opacity(0.5))
                    .frame(width: 40, height: 10)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
            }
            
        }
        .padding(8)
        .background(isDark ? .black : .white.opacity(0.89))
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    ThemeButtonCell()
}
