//
//  LogoDemo3App.swift
//  LogoDemo3
//
//  Created by Terry Kuo on 2022/10/14.
//

import SwiftUI
#if os(iOS)
import DebugSwift
#endif
import OnboardingKit

@main
struct LogoDemo3App: App {
    @StateObject private var dataController = DataController()
#if os(iOS)
    @AppStorage("user_theme") private var userTheme: Theme = .systemDefault
//#elseif os(macOS)

#endif
    
    @AppStorage("darkModeEnabled") private var darkModeEnabled = false
    @AppStorage("systemThemeEnabled") private var systemThemeEnabled  = false
    
    init() {
#if os(iOS)
        DebugSwift.setup()
        DebugSwift.show()
        #endif
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
//                .preferredColorScheme(userTheme.colorScheme)
                .showOnboardingIfNeeded(using: .prod)
                .onAppear {
#if os(iOS)
                    SystemThemeManager.shared.handleTheme(darkMode: darkModeEnabled, system: systemThemeEnabled)
                    #endif
                }
        }
    }
}

///1. Create a EnvironmentKey and define its type
fileprivate struct SafeAreaValue: EnvironmentKey {
    static var defaultValue: EdgeInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0) //define its type
}

///2. Create an Environment Value for the ket that you created earlier
///3. Than you can use custom environment keys anywhere in the swiftui view.
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

extension OnboardingConfiguration {
    static let prod = Self.init(privacyUrlString: "",
                                accentColor: .green,
                                features: [FeatureInfo(image: Image(systemName: "moon.dust.circle.fill"), title: "Test", content: "Test2224141341353151"),
                                           FeatureInfo(image: Image(systemName: "square.and.arrow.up.badge.clock.fill"), title: "Test", content: "Test2224141341353151"),
                                           FeatureInfo(image: Image(systemName: "arrow.down.doc"), title: "Test", content: "Test2224141341353151"),
                                           FeatureInfo(image: Image(systemName: "chevron.right.to.line"), title: "Test", content: "Test2224141341353151")])
}

