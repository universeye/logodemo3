//
//  CustumRefreshDemo.swift
//  LogoDemo3
//
//  Created by Terry Kuo on 2024/4/10.
//

import SwiftUI

struct CustumRefreshDemo: View {
    var body: some View {
        CustomRefreshView(showsIndicator: false) {
           Rectangle()
                .fill(Color.red)
                .frame(width: 200, height: 200)
        } onRefresh: {
            try? await Task.sleep(nanoseconds: 1000000000)
        }
    }
}

#Preview {
    CustumRefreshDemo()
}
