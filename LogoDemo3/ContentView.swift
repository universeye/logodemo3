//
//  ContentView.swift
//  LogoDemo3
//
//  Created by Terry Kuo on 2022/10/14.
//

import SwiftUI
import MetricKit

struct ContentView: View {
    @Environment(\.safeArea) var safeArea
    #if os(iOS)
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    #endif
    
    var body: some View {
        #if os(macOS)
       SidebarMainView().frame(minWidth: 200, idealWidth: 250, maxWidth: 300)
       #else
       if horizontalSizeClass == .compact {
           TabMainView()
       } else {
           SidebarMainView().navigationBarTitle("Gradient Game")
       }
       #endif
//        GeometryReader {
//            let safeAre = $0.safeAreaInsets
//            TabView {
//                CoreDataDemo()
//                .tabItem {
//                    Label("Home", systemImage: "house")
//                }
//                
//                MusicPlayerView()
//                .tabItem {
//                    Label("Music", systemImage: "music.quarternote.3")
//                }
//                
//                GridDemoView()
//                    .environment(\.safeArea, safeAre)
//                    .tabItem {
//                        Label("Grid", systemImage: "rectangle.grid.3x2.fill")
//                    }
//                KavSoftView()
//                    .tabItem {
//                        Label("KavSoft", systemImage: "k.square.fill")
//                    }
//                
//                NavigationStackDemoView()
//                    .tabItem {
//                        Label("Nav", systemImage: "questionmark.folder.fill")
//                    }
//                
//                ViewThatFitsDemo()
//                    .tabItem {
//                        Label("VTF", systemImage: "eye.trianglebadge.exclamationmark")
//                    }
//                
//                TasksView()
//                    .tabItem {
//                        Label("Tasks", systemImage: "checkmark.square")
//                    }
//                
//                LazyVGridDemo()
//                    .tabItem {
//                        Label("LazyGrid", systemImage: "square.grid.3x3.fill")
//                    }
//                PhotosPickerDemo()
//                    .tabItem {
//                        Label("PhotosPicker", systemImage: "photo.artframe")
//                    }
//                MultiplePhotosView()
//                    .tabItem {
//                        Label("MultiplePhotos", systemImage: "photo.stack")
//                    }
//                LeasingOptions()
//                    .tabItem {
//                        Label("LeasingOptions", systemImage: "paperclip")
//                    }
//                
//                CollapsibleDemoView()
//                    .tabItem {
//                        Label("CollapsibleDemoView", systemImage: "square.grid.3x1.fill.below.line.grid.1x2")
//                    }
//                SwitchAnimationView()
//                    .tabItem {
//                        Label("SwitchAnimation", systemImage: "doc.richtext.fill")
//                    }
//                MarUpEditor()
//                    .tabItem {
//                        Label("MarUpEditor", systemImage: "pencil.and.ellipsis.rectangle")
//                    }
//                
//                ExtensionDemo()
//                    .tabItem {
//                        Label("ExtensionDemo", systemImage: "studentdesk")
//                    }
//            }
//        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
