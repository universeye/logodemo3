//
//  TabMainView.swift
//  LogoDemo3
//
//  Created by Terry Kuo on 2024/2/8.
//

import SwiftUI

struct TabMainView: View {
    var body: some View {
        TabView {
            ForEach(TabModel.views, id: \.title) { model in
                NavigationView {
                    model.destination
                }
                .tabItem {
                    Image(systemName: model.image)
                    Text(model.title.uppercased())
                }
            }
        }
    }
}
