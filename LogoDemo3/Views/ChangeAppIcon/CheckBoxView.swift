//
//  CheckBoxView.swift
//  LogoDemo3
//
//  Created by Terry Kuo on 2024/1/16.
//

import SwiftUI

struct CheckBoxView: View {
    let isSelected: Bool
    private var image: UIImage {
        let imageName = isSelected ? "icon-checked" : "icon-unchecked"
        return UIImage(imageLiteralResourceName: imageName)
    }

    var body: some View {
        Image(uiImage: image)
            .resizable()
            .scaledToFit()
            .frame(width: 30, height: 30)
    }
}

#Preview {
    CheckBoxView(isSelected: true)
}
