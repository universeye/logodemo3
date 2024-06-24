//
//  FullScreenFadeDemo.swift
//  LogoDemo3
//
//  Created by Terry Kuo on 2024/3/12.
//

import SwiftUI

struct FullScreenFadeDemo: View {
  @State var isFullScreenCoverPresented = false
  @State var isFullScreenViewVisible = false

  var body: some View {
    VStack {
      Button("Tap me") {
        isFullScreenCoverPresented = true
      }
    }.fullScreenCover(isPresented: $isFullScreenCoverPresented) {
      Group {
        if isFullScreenViewVisible {
          FullScreenView(isVisible: $isFullScreenViewVisible)
            .onDisappear {
              // dismiss the FullScreenCover
              isFullScreenCoverPresented = false
            }
        }
      }
      .onAppear {
        isFullScreenViewVisible = true
      }
    }
    .transaction({ transaction in
      // disable the default FullScreenCover animation
      transaction.disablesAnimations = true

      // add custom animation for presenting and dismissing the FullScreenCover
      transaction.animation = .linear(duration: 1)
    })
  }
}

struct FullScreenView: View {
  @Binding var isVisible: Bool

  var body: some View {
    VStack {
      Button("Dismiss") {
        isVisible = false
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .background(.red)
    }
  }
}
