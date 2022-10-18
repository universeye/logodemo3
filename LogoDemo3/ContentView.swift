//
//  ContentView.swift
//  LogoDemo3
//
//  Created by Terry Kuo on 2022/10/14.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Hello, world!")
            }
            .padding()
            .tabItem {
                Label("Home", systemImage: "house")
            }
            
            CustumButtonStyle()
                .tabItem {
                    Label("Button", systemImage: "gearshape")
                }
            
            NavigationStackDemoView()
                .tabItem {
                    Label("Nav", systemImage: "questionmark.folder.fill")
                }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
