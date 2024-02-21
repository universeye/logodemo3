//
//  GridDemoView.swift
//  LogoDemo3
//
//  Created by Terry Kuo on 2022/10/18.
//

import SwiftUI

struct GridDemoView: View {
    @Environment(\.safeArea) var safeArea
    private var bgColors: [Color] = [ .indigo, .yellow, .green, .orange, .brown ]
    
    var stripes: Shader {
        ShaderLibrary.angleFill(.float(50),.float(20), .color(.blue))
    }
    @State private var ghostCount = 1
    @State private var heartCount = 1
    
    enum Phase: CaseIterable {
        case initial
        case move
        case scale
        
        var verticalOffset: Double {
            switch self {
            case .initial: 0
            case .move, .scale: -64
            }
        }
        
        var scale: Double {
            switch self {
            case .move, .initial: 1
            case .scale: 2
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Grid {
                    Text("\(Text("SwiftUI").foregroundStyle(.white)) Grid")
                        .textScale(.secondary)
                        .typesettingLanguage(.automatic)
                        .padding(8)
                        .font(.title.bold())
                        .background(.pink.gradient)
                        .cornerRadius(10)
                    GridRow {
                        Rect()
                            .gridCellColumns(2)
                        Rect()
                        //                Rect()
                    }
                    GridRow {
                        Rect()
                        Rect()
                        Rect()
                    }
                    GridRow {
                        Rect()
                        Rect()
                        Rect()
                    }
                    GridRow {
                        Rect()
                            .gridCellColumns(1)
                        Rect()
                            .gridCellColumns(3)
                    }
                }
                .padding()
                .overlay {
                    VStack {
                        Text("Top = \(safeArea.top)\nBottom = \(safeArea.bottom)")
                        NavigationLink {
                            DetailView()
                        } label: {
                            Text("Datail View")
                        }
                        .buttonStyle(.borderedProminent)
                        .phaseAnimator([false, true]) { content, phase in
                            content
                                .opacity(phase ? 1 : 0.5)
                                .scaleEffect(phase ? 1 : 0.9)
                        } animation: { phase in
                                .easeInOut(duration: 1)
                        }
                    }
                    .padding()
                    .background(.cyan.gradient)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .shadow(radius: 4)
                }
                Divider()
                
                List(bgColors, id: \.self) { bgColor in
                    NavigationLink {
                        bgColor
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .ignoresSafeArea()
                    } label: {
                        Text(bgColor.description)
                    }
                    
                }
                .listStyle(.plain)
                .navigationTitle("GridColorAnimate")
                .navigationBarTitleDisplayMode(.inline)
                
                Divider()
                HStack {
                    Button(action: {
                        ghostCount += 1
                    }, label: {
                        Text("👻")
                            .font(.largeTitle)
                    })
                    .phaseAnimator(Phase.allCases, trigger: ghostCount) { content, phase in
                        content
                            .scaleEffect(phase.scale)
                            .offset(y: phase.verticalOffset)
                            
                    } animation: { phase in
                        switch phase {
                        case .initial: .smooth
                        case .move: .easeInOut(duration: 0.3)
                        case .scale: .spring(duration: 0.3, bounce: 0.7)
                        }
                    }
                    
                    Button(action: {
                        heartCount += 1
                    }, label: {
                        Text("❤️")
                            .font(.largeTitle)
                    })
                    .keyframeAnimator(initialValue: AnimationValues(), trigger: heartCount) { content, value in
                        content
                            .rotationEffect(value.angle)
                            .scaleEffect(value.scale)
                            .scaleEffect(y: value.verticalStretch)
                            .offset(y: value.verticalTranslation)
                    } keyframes: { _ in
                        KeyframeTrack(\.scale) {
                            LinearKeyframe(1.0, duration: 0.36)
                            SpringKeyframe(1.5, duration: 0.8, spring: .bouncy)
                            SpringKeyframe(1, spring: .bouncy)
                        }
                        
                        KeyframeTrack(\.verticalTranslation) {
                            LinearKeyframe(0.0, duration: 0.1)
                            SpringKeyframe(20, duration: 0.15, spring: .bouncy)
                            SpringKeyframe(-60, duration: 1, spring: .bouncy)
                            SpringKeyframe(0.0, spring: .bouncy)
                        }
                        
                        KeyframeTrack(\.verticalStretch) {
                            CubicKeyframe(1.0, duration: 0.1)
                            CubicKeyframe(0.6, duration: 0.15)
                            CubicKeyframe(1.5, duration: 0.1)
                            CubicKeyframe(1.05, duration: 0.15)
                            CubicKeyframe(1.0, duration: 0.88)
                            CubicKeyframe(0.8, duration: 0.1)
                            CubicKeyframe(1.04, duration: 0.4)
                            CubicKeyframe(1.0, duration: 0.22)
                        }
                        
                        KeyframeTrack(\.angle) {
                            CubicKeyframe(.zero, duration: 0.5)
                            CubicKeyframe(.degrees(15), duration: 0.1)
                            CubicKeyframe(.degrees(-15), duration: 0.1)
                            CubicKeyframe(.zero, duration: 0.15)
                        }
                    }

                }
                .padding()
            }
        }
    }
}

struct DetailView: View {
    @Environment(\.safeArea) var safeArea
    var body: some View {
        Color.yellow
            .navigationTitle("Datail View")
            .overlay {
                Text("Top = \(safeArea.top)\nBottom = \(safeArea.bottom)")
            }
            .ignoresSafeArea()
    }
}

struct Rect: View {
    var body: some View {
        Rectangle()
            .fill(.gray.opacity(0.6))
            .cornerRadius(10)
    }
}

struct GridDemoView_Previews: PreviewProvider {
    static var previews: some View {
        GridDemoView()
    }
}

struct AnimationValues {
    var scale = 1.0
    var verticalStretch = 1.0
    var verticalTranslation = 0.0
    var angle = Angle.zero
}
