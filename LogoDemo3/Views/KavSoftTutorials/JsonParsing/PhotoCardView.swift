//
//  PhotoCardView.swift
//  LogoDemo3
//
//  Created by Terry Kuo on 2024/4/10.
//

import SwiftUI
import SDWebImageSwiftUI

struct PhotoCardView: View {
    var photo: Photo
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10, content: {
            GeometryReader {
                let size = $0.size
                
                AnimatedImage(url: photo.downloadURL) {
                    ProgressView()
                        .frame(width: size.width, height: size.height) //To Place Indicator at center
                }
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: size.width, height: size.height)
                .clipShape(.rect(cornerRadius: 10))
            }
            .frame(height: 120)
            
            Text(photo.author)
                .font(.caption)
                .foregroundStyle(.gray)
                .lineLimit(1)
        })
    }
}
