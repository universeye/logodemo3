//
//  ViewThatFitsDemo.swift
//  LogoDemo3
//
//  Created by Terry Kuo on 2022/10/18.
//

import SwiftUI

struct ViewThatFitsDemo: View {
    @State private var objectCount: Int = 1
    
    var body: some View {
        VStack {
            Text("ViewThatFits")
                .font(.title.bold())
            AdaptiveView {
                VStack(spacing: 10) {
                    ForEach(1...objectCount, id: \.self) { index in
                        Rectangle()
                            .fill(.gray)
                            .cornerRadius(10)
                            .frame(height: 200)
                    }
                }
            }
            .padding()
            .onTapGesture {
                objectCount += 1
            }
            Text("Tap me !!")
        }
    }
}

struct ViewThatFitsDemo_Previews: PreviewProvider {
    static var previews: some View {
        ViewThatFitsDemo()
    }
}


struct AdaptiveView<Content: View>: View {
    var content: Content
    init(@ViewBuilder content: @escaping () -> Content  ) {
        self.content = content()
    }
    
    var body: some View {
        ViewThatFits {
            content
            
            ScrollView {
                content
            }
        }
    }
}
