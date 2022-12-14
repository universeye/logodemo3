//
//  ContentView.swift
//  LogoDemo3
//
//  Created by Terry Kuo on 2022/10/14.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.safeArea) var safeArea
    
    
    var body: some View {
        GeometryReader {
            let safeAre = $0.safeAreaInsets
            TabView {
                CoreDataDemo()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                
                GridDemoView()
                    .environment(\.safeArea, safeAre)
                    .tabItem {
                        Label("Grid", systemImage: "rectangle.grid.3x2.fill")
                    }
                KavSoftView()
                    .tabItem {
                        Label("KavSoft", systemImage: "k.square.fill")
                    }
                
                NavigationStackDemoView()
                    .tabItem {
                        Label("Nav", systemImage: "questionmark.folder.fill")
                    }
                
                ViewThatFitsDemo()
                    .tabItem {
                        Label("VTF", systemImage: "eye.trianglebadge.exclamationmark")
                    }
                
                TasksView()
                    .tabItem {
                        Label("Tasks", systemImage: "checkmark.square")
                    }
            }
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
