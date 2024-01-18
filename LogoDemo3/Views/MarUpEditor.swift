//
//  MarUpEditor.swift
//  LogoDemo3
//
//  Created by Terry Kuo on 2024/1/8.
//

import SwiftUI
import MarkupEditor

struct MarUpEditor: View {
    @State private var demoHtml: String = "<h1>Hello World</h1>"
        
        var body: some View {
            VStack {
                MarkupEditorView(html: $demoHtml)
                Button(action: {}, label: {
                    Text("儲存自訂範本")
                })
                .padding(.bottom, 25)
                .buttonStyle(.borderedProminent)
            }
        }
}

#Preview {
    MarUpEditor()
}
