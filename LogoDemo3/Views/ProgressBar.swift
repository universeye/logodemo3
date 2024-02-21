//
//  ProgressBar.swift
//  SUM
//
//  Created by Terry Kuo on 2022/9/13.
//

import SwiftUI

struct ProgressBar: View {
    @Binding var value: Float
    var color: Color
    @State private var isAnimated: Bool = false
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle().frame(
                    width: isAnimated ? min(CGFloat(self.value) * geometry.size.width, geometry.size.width) : 0,
                    height: geometry.size.height
                )
                .foregroundColor(color)
            }
//            .onAppear {
//                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
//                    withAnimation(.easeInOut(duration: 1.4)) {
//                        self.isAnimated = true
//                    }
//                }
//            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                withAnimation(.easeInOut(duration: 1.4)) {
                    self.isAnimated = true
                }
            }
        }
    }
}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar(value: .constant(0.25), color: .red)
    }
}
