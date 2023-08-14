//
//  RollingText.swift
//  LogoDemo3
//
//  Created by Terry Kuo on 2023/8/11.
//

import SwiftUI

struct RollingText: View {
    var font: Font = .largeTitle
    var weight: Font.Weight = .regular
    @Binding var value: Int
    @State private var animatingRange: [Int] = []
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<animatingRange.count, id: \.self) { index in
                Text("8")
                    .font(font)
                    .fontWeight(weight)
                    .opacity(0)
                    .overlay {
                        GeometryReader { proxy in
                            let size = proxy.size
                            
                            VStack(spacing: 0) {
                                ForEach(0...9, id: \.self) { number in
                                    Text("\(number)")
                                        .font(font)
                                        .fontWeight(weight)
                                        .frame(width: size.width, height: size.height, alignment: .center)
                                }
                            }
                            //Setting Offset
                            .offset(y: -CGFloat(animatingRange[index]) * size.height)
                        }
                        .clipped()
                    }
            }
        }
        .onAppear {
            animatingRange = Array(repeating: 0, count: "\(value)".count)
            //Start with little delay
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.06) {
                updateText()
            }
        }
        .onChange(of: value) { newValue in
            
            let extra = "\(value)".count - animatingRange.count
            if extra > 0 {
                //Adding Extra Range
                for _ in 0..<extra {
                    withAnimation(.easeIn(duration: 0.1)) {
                        animatingRange.append(0)
                    }
                }
            } else {
                //Removing Extra Range
                for _ in 0..<(-extra) {
                    withAnimation(.easeIn(duration: 0.1)) {
                        animatingRange.removeLast()
                    }
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.06) {
                updateText()
            }
        }
    }
    
    func updateText() {
        let stringValue = "\(value)"
        for ( index , value) in zip(0..<stringValue.count, stringValue) {
            //if first value = 1, then offset will be applied for -1, so the text will move up to show 1 value
            //DampingFraction based on Index Value
            let fraction = Double(index) * 0.15
            //Max = 0.5, Total = 1.5
            withAnimation(.interactiveSpring(response: 0.8, dampingFraction: 1 + fraction, blendDuration: 1 + fraction)) {
                animatingRange[index] = (String(value) as NSString).integerValue
            }
        }
    }
}

struct RollingText_Previews: PreviewProvider {
    static var previews: some View {
        RollingCounterView()
    }
}
