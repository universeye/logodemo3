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
            CoreDataDemo()
            .tabItem {
                Label("Home", systemImage: "house")
            }
            
            GridDemoView()
                .tabItem {
                    Label("Grid", systemImage: "rectangle.grid.3x2.fill")
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
