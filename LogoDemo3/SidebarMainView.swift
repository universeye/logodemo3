//
//  SidebarMainView.swift
//  LogoDemo3
//
//  Created by Terry Kuo on 2024/2/8.
//

import SwiftUI

struct SidebarMainView: View {
    var body: some View {
        NavigationView {
            SidebarView()
            VisionProView().navigationBarTitle("")
        }
    }
}

struct SidebarView: View {
    var body: some View {
        List {
            ForEach(TabModel.views, id: \.title) { model in
                NavigationLink(destination: model.destination) {
                    Label(model.title, systemImage: model.image)
                }
            }
        }
        .listStyle(SidebarListStyle())
    }
}
