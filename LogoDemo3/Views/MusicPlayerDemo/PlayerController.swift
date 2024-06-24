//
//  PlayerController.swift
//  LogoDemo3
//
//  Created by Terry Kuo on 2024/2/8.
//

import SwiftUI

struct PlayerController: View {
    @State private var musicProgress: Float = 0.26
    @State private var volume: Float = 0.78
    
    var body: some View {
        ZStack {
//            LinearGradient(
//                colors: [.blue, .cyan, .white],
//                startPoint: .top,
//                endPoint: .bottom
//            )
//                .ignoresSafeArea()
//                .blur(radius: 70)
//                .frame(maxWidth: .infinity)
            VStack {
                Image("Dream Album Cover")
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .shadow(radius: 15, x: 5, y: 20)
                    .padding(.bottom)
                HStack {
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Dream - Single")
                                .font(.title2)
                                .bold()
                            Image(systemName: "e.square.fill")
                                .foregroundStyle(.gray.opacity(0.8))
                        }
                        Text("BABYMONSTER")
                    }
                    Spacer()
                    HStack(spacing: 20) {
                        Button {
                            
                        } label: {
                            Image(systemName: "star")
                                .frame(width: 30, height: 30)
                                .background(.ultraThinMaterial)
                                .clipShape(Circle())
                            
                        }
                        Button {
                            
                        } label: {
                            Image(systemName: "ellipsis")
                                .frame(width: 30, height: 30)
                                .background(.ultraThinMaterial)
                                .clipShape(Circle())
                        }
                    }
                }
                .padding()
                ZStack {
                    Rectangle()
                        .fill(.ultraThinMaterial)
                    ProgressBar(value: $musicProgress, color: .black.opacity(0.3))
                }
                .frame(height: 8)
                .clipShape(Capsule())
                .padding(.horizontal)
                
                HStack {
                    Text("0.54")
                    Spacer()
                    Text("-1:31")
                }
                .font(.footnote)
                .foregroundStyle(.gray)
                .padding(.horizontal)
                
                HStack {
                    Image(systemName: "backward.fill")
                    Spacer()
                    Image(systemName: "play.fill")
                    Spacer()
                    Image(systemName: "forward.fill")
                }
                .font(.largeTitle)
                .padding()
                .padding(.vertical, 20)
                
                HStack {
                    Image(systemName: "speaker.fill")
                        .foregroundStyle(.gray)
                    ZStack {
                        Rectangle()
                            .fill(.ultraThinMaterial)
                        ProgressBar(value: $volume, color: .black.opacity(0.3))
                    }
                    .frame(height: 8)
                    .clipShape(Capsule())
                    .padding(.horizontal)
                    Image(systemName: "speaker.wave.3.fill")
                        .foregroundStyle(.gray)
                }
                .padding()
            }
        }
        .padding()
    }
}

#Preview {
    PlayerController()
}
