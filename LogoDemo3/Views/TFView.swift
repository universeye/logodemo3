//
//  TFView.swift
//  LogoDemo3
//
//  Created by Terry Kuo on 2024/3/12.
//

import SwiftUI

struct TFView: View {
    var namespace: Namespace.ID
    @State private var email = ""
    @Environment(\.presentationMode) var presentationMode
    @Binding var isShowTFView: Bool
    @FocusState var focused: Bool?
    var body: some View {
        VStack {
            TextField(NSLocalizedString("email_placeholder_title", comment: "email_placeholder_title"), text: $email)
                .padding()
                .background(Color(uiColor: .systemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .shadow(color: .black.opacity(0.1), radius: 7, y: 3)
                .padding()
                .matchedGeometryEffect(id: "title", in: namespace)
                .focused($focused, equals: true)
                .onAppear {
                  DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                    self.focused = true
                  }
                }
               
            
            Button(action: {
//                presentationMode.wrappedValue.dismiss()
                isShowTFView.toggle()
            }, label: {
                Text("Dismiss")
            })
        }
        
    }
}

//#Preview {
//    @Namespace var namespace
//    
//    TFView(namespace: namespace)
//}
