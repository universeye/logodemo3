//
//  KavSoftView.swift
//  LogoDemo3
//
//  Created by Terry Kuo on 2022/12/6.
//

import SwiftUI

struct KavSoftView: View {
    private let newAPIs: [String] = ["Magnifying Glass"]
    
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink(newAPIs[0], destination: MagnifyingGlassView())
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
