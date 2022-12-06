//
//  LogoDemo3App.swift
//  LogoDemo3
//
//  Created by Terry Kuo on 2022/10/14.
//

import SwiftUI

@main
struct LogoDemo3App: App {
    @StateObject private var dataController = DataController()
      
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}

//1. Create a EnvironmentKey and define its type
fileprivate struct SafeAreaValue: EnvironmentKey {
    static var defaultValue: EdgeInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0) //define its type
}

//2. Create an Environment Value for the ket that you created earlier
extension EnvironmentValues {
    var safeArea: EdgeInsets {
        get {
            self[SafeAreaValue.self]
        }
        set {
            self[SafeAreaValue.self] = newValue
        }
    }
}

//3. Than you can use custom environment keys anywhere in the swiftui view.
