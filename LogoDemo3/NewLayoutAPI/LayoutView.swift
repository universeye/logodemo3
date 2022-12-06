//
//  LayoutView.swift
//  LogoDemo3
//
//  Created by Terry Kuo on 2022/10/31.
//

import SwiftUI

struct LayoutView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Hello, World!")
            }
            .padding(15)
            .navigationTitle("Layout")
        }
    }
}

struct LayoutView_Previews: PreviewProvider {
    static var previews: some View {
        LayoutView()
    }
}
