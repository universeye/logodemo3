//
//  CollapsibleDemoView.swift
//  LogoDemo3
//
//  Created by Terry Kuo on 2022/10/19.
//

import SwiftUI

struct CollapsibleDemoView: View {
    var body: some View {
            VStack(spacing: 10) {
                HStack {
                    Text("Here we have some fancy text content. Could be whatever you imagine.")
                    Spacer()
                }
                .padding(.bottom)
                
                Divider()
                    .padding(.bottom)
                
                Collapsible(
                    label: { Text("Collapsible") },
                    content: {
                        HStack {
                            Text("Content")
                            Spacer()
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.secondary)
                    }
                )
                .frame(maxWidth: .infinity)
                
                Spacer()
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
}

struct CollapsibleDemoView_Previews: PreviewProvider {
    static var previews: some View {
        CollapsibleDemoView()
    }
}
