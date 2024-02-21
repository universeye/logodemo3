//
//  ExtensionDemo.swift
//  LogoDemo3
//
//  Created by Terry Kuo on 2024/1/9.
//

import SwiftUI

struct ExtensionDemo: View {
    @State private var isColorHidden = false
    @State private var isFrameSquared = false
    @State private var isRedColor = false
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            
            Text("Hello, World!")
                .asPushOutView(.red)
            Color.teal
                .isHidden(isColorHidden)
                .if(isFrameSquared) { view in
                    view
                        .frame(square: 100)
                }
                .replace(if: isRedColor) {
                    Color.red
                }
                
            Toggle("Is color hidden", isOn: $isColorHidden)
            Toggle("Is frame squared", isOn: $isFrameSquared)
            Toggle("Is red color", isOn: $isRedColor)
        }
        .padding()
        .onFirstAppear {
            print("On first appear")
        }
    }
}

#Preview {
    ExtensionDemo()
}
extension View {
    func frame(square length: CGFloat?, alignmentt: Alignment = .center) -> some View{
        self.frame(width: length, height: length, alignment: alignmentt)
        
    }
    
    func asPushOutView(_ backgroundColor: Color = .clear) -> some View {
        ZStack {
            backgroundColor
            self
        }
    }
    
    @ViewBuilder
    func isHidden(_ shouldHidden: Bool) -> some View {
        switch shouldHidden {
        case true:
            self.hidden()
        case false:
            self
        }
    }
    
    @ViewBuilder
    func `if`<Content: View>(_ condition: @autoclosure () -> Bool, transform: (Self) -> Content) -> some View {
        if condition() {
            transform(self)
        } else {
            self
        }
    }
    
    @ViewBuilder
    func replace<Content: View>(
        if condition: Bool,
        @ViewBuilder content: @escaping () -> Content
    ) -> some View {
        if condition {
            content()
        } else {
            self
        }
    }
    
    func onFirstAppear(perform action: (() -> Void)? = nil) -> some View {
        self
            .modifier(OnAppearModifier(perform: action))
    }
}


struct OnAppearModifier: ViewModifier {
    @State private var onAppearCalled: Bool = false
    private let action: (() -> Void)?
    
    init(perform action: (() -> Void)? = nil) {
        self.action = action
    }
    
    func body(content: Content) -> some View {
        content
            .onAppear {
                if !onAppearCalled {
                    onAppearCalled = true
                    action?()
                }
            }
    }
}
