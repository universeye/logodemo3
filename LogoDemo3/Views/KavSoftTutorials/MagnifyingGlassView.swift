//
//  MagnifyingGlassView.swift
//  LogoDemo3
//
//  Created by Terry Kuo on 2022/12/6.
//

import SwiftUI

struct MagnifyingGlassView: View {
    //Magnification properties
    @State private var scale: CGFloat = 0
    @State private var rotation: CGFloat = 0
    @State private var size: CGFloat = 0
    
    var body: some View {
        VStack(spacing: 0) {
            GeometryReader {
                let size = $0.size
                
                Image("example1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .frame(width: size.width, height: size.height)
                    
                ///Adding Magnification Modifier
                    .magnificationEffect(scale, rotation, self.size, .white)
                
            }
            .padding(50)
            .contentShape(Rectangle())
            
            //Customization Options
            VStack(alignment: .leading, spacing: 0) {
                Text("Customization")
                    .fontWeight(.medium)
                    .foregroundColor(.black.opacity(0.5))
                    .padding(.bottom, 20)
                
                HStack(spacing: 14) {
                    Text("Scale")
                        .font(.caption)
                        .foregroundColor(.gray)
                        .frame(width: 35, alignment: .leading)
                    
                    Slider(value: $scale)
                    
                    Text("Rotation")
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                    Slider(value: $rotation)
                }
                .tint(.black)
                
                HStack(spacing: 14) {
                    Text("Size")
                        .font(.caption)
                        .foregroundColor(.gray)
                        .frame(width: 35, alignment: .leading)
                    
                    Slider(value: $size, in: -20...100)
                }
                .tint(.black)
                .padding(.top)
            }
            .padding(15)
            .background {
                RoundedRectangle(cornerRadius: 15, style: .continuous)
                    .fill(.white)
                    .ignoresSafeArea()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(content: {
            Color.black
                .opacity(0.08)
                .ignoresSafeArea()
        })
        .preferredColorScheme(.light)
        .navigationTitle("Magnifying Glass Demo")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct MagnifyingGlassView_Previews: PreviewProvider {
    static var previews: some View {
        MagnifyingGlassView()
    }
}


//MARK: - Custum View Modifier
extension View {
    @ViewBuilder
    func magnificationEffect(_ scale: CGFloat, _ rotation: CGFloat, _ size: CGFloat = 0, _ tint: Color = .white) -> some View {
        MagnificationEffectHelper(scale: scale, rotation: rotation, size: size, tint: tint) {
            self
        }
    }
}

//MARK: - Magnification Effect Helper
fileprivate struct MagnificationEffectHelper<Content: View>: View {
    var scale: CGFloat
    var rotation: CGFloat
    var size: CGFloat
    var tint: Color = .white
    var content: Content
    
    init(scale: CGFloat, rotation: CGFloat, size: CGFloat,tint: Color = .white,  @ViewBuilder content: @escaping() -> Content) {
        self.scale = scale
        self.rotation = rotation
        self.size = size
        self.tint = tint
        self.content = content()
    }
    
    //Gesture Properties
    @State private var offset: CGSize = .zero
    @State private var lastStoredOffset: CGSize = .zero
    
    var body: some View {
        content
        //Applying reverse mask for clipping the current highlighting spot
            .reverseMask(content: {
                let newCircleSize = 150.0 + size
                Circle()
                    .frame(width: newCircleSize, height: newCircleSize)
                    .offset(offset)
            })
            .overlay {
                GeometryReader {
                    let newCircleSize = 150.0 + size
                    let size = $0.size
                    
                    content
                        .frame(width: size.width, height: size.height)
                    // Clipping it into Circle Form
                    //Move Content Inside(Reversing)
                        .offset(x: -offset.width, y: -offset.height)
                        .frame(width: newCircleSize, height: newCircleSize)
                    //Apply scaling here
                        .scaleEffect(1 + scale)
                        .clipShape(Circle())
                    //Applying Offset
                        .offset(offset)
                    //Making it center
                        .frame(width: size.width, height: size.height)
                    
                    //Optional Magnifyingglass image overlay
                    Circle()
                        .fill(.clear)
                        .frame(width: newCircleSize, height: newCircleSize)
                        .overlay(alignment: .topLeading) {
                            Image(systemName: "magnifyingglass")
                                .resizable()
                                .renderingMode(.template)
                                .aspectRatio(contentMode: .fit)
                                .scaleEffect(1.4, anchor: .topLeading)
                                .offset(x: -10, y: -5)
                                .foregroundColor(tint)
                        }
                        .rotationEffect(.init(degrees: rotation * 360.0))
                        .offset(offset)
                        .frame(width: size.width, height: size.height)
                }
            }
            .contentShape(Rectangle())
            .gesture(
                DragGesture()
                    .onChanged({ value in
                        offset = CGSize(width: value.translation.width + lastStoredOffset.width, height: value.translation.height + lastStoredOffset.height)
                    })
                    .onEnded({ _ in
                        lastStoredOffset = offset
                    })
            )
    }
    
}

//MARK: - ReverseMask Modifier
extension View {
    @ViewBuilder
    func reverseMask<Content: View>(@ViewBuilder content: @escaping () -> Content) -> some View {
        self
            .mask {
                Rectangle()
                    .overlay {
                        content()
                            .blendMode(.destinationOut)
                    }
            }
    }
}
