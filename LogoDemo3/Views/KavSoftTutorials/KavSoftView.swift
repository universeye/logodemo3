//
//  KavSoftView.swift
//  LogoDemo3
//
//  Created by Terry Kuo on 2022/12/6.
//

import SwiftUI

struct KavSoftView: View {
    private let newAPIs: [String] = ["Magnifying Glass", "Rolling Counter", "GlassMorphismView"]
    
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink(newAPIs[0], destination: MagnifyingGlassView())
                NavigationLink(newAPIs[1], destination: RollingCounterView())
                NavigationLink(newAPIs[2], destination: GlassMorphismView())
            }
            .navigationTitle("KavSoft")
        }
    }
}

struct KavSoftView_Previews: PreviewProvider {
    static var previews: some View {
        KavSoftView()
    }
}
