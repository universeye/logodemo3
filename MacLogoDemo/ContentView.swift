//
//  ContentView.swift
//  MacLogoDemo
//
//  Created by Terry Kuo on 2024/3/7.
//

import SwiftUI
import CoreData
import OnboardingKit

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(TabModel.views, id: \.title) { model in
                    NavigationLink(destination: model.destination) {
                        Label(model.title, systemImage: model.image)
                    }
                }
            }
            
            VisionProView()
        }
        .navigationTitle("Test")
            .frame(minWidth: 200, idealWidth: 250, maxWidth: 500)
            .showOnboardingIfNeeded(using: .prod)
    }
}



#Preview {
    ContentView()
}
