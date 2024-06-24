//
//  ContentView.swift
//  LogoDemo3
//
//  Created by Terry Kuo on 2022/10/14.
//

import SwiftUI
import MetricKit
import CurrencyProviding

struct ContentView: View {
    @State private var currencyProvider: CurrencyProvider = .init()
    
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
               .environment(currencyProvider)
       } else {
           SidebarMainView()
               .navigationBarTitle("Gradient Game")
               .environment(currencyProvider)
       }
       #endif
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
