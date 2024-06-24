//
//  CustumButtonStyle.swift
//  LogoDemo3
//
//  Created by Terry Kuo on 2022/10/14.
//

import SwiftUI

struct CustumButtonStyle: View {
    var body: some View {
        Button("Press Me") {
            
        }
        .buttonStyle(GrowingButton())
    }
}

struct CustumButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        CustumButtonStyle()
    }
}
