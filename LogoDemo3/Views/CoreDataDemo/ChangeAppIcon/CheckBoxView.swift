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
        let imageName = isSelected ? "checkmark.circle.fill" : "circle"
//        return UIImage(imageLiteralResourceName: imageName)
        return UIImage(systemName: imageName)!
    }

    var body: some View {
        Image(systemName: isSelected ? "checkmark.circle.fill" : "circle")
            .resizable()
            .scaledToFit()
            .frame(width: 25, height: 25)
            .foregroundStyle(isSelected ? .green : .gray)
    }
}

#Preview {
    VStack {
        CheckBoxView(isSelected: true)
        CheckBoxView(isSelected: false)
    }
}
