//
//  MovableGridView.swift
//  LogoDemo3
//
//  Created by Terry Kuo on 2023/9/23.
//

import SwiftUI

struct MovableGridView: View {
    @State private var colors: [Color] = [.red, .blue, .purple, .yellow, .black, .indigo, .cyan, .brown, .mint, .orange, .pink, .secondary]
    @State private var images: [UIImage] = [UIImage(named:"watchos10")!]
    @State private var dragginItem: Color?
    
    var body: some View {
        ScrollView(.vertical) {
            let columns = Array(repeating: GridItem(spacing: 10), count: 3)
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(colors, id: \.self) { color in
                    GeometryReader {
                        let size = $0.size
                        
                        RoundedRectangle(cornerRadius: 10)
                            .fill(color.gradient)
                            .draggable(color) {
                                //Custum preview view
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(.ultraThinMaterial)
                                    .frame(width: 1, height: 1)
                                    .onAppear {
                                        dragginItem = color
                                    }
                            }
                        ///you can pass any item that conforms to the transferable protocol, such as a string data, image(SwiftUI), etc., in the draggable modifier.
                            .dropDestination(for: Color.self) { items, location in
                                dragginItem = nil
                                return false
                            } isTargeted: { status in
                                if let dragginItem, status, dragginItem != color {
                                    //moving card from source to destination
                                    if let sourceIndex = colors.firstIndex(of: dragginItem),
                                       let destinaionIndex = colors.firstIndex(of: color) {
                                        withAnimation(.bouncy) {
                                            let sourceItem = colors.remove(at: sourceIndex)
                                            colors.insert(sourceItem, at: destinaionIndex)
                                        }
                                    }
                                }
                            }
                    }
                    .frame(height: 100)
                }
            }
            .padding(15)
            
            Button(action: {
                print(colors)
            }, label: {
                Text("Get current array")
            })
            .padding()
        }
        .navigationTitle("Movable Grid")
    }
}

#Preview {
    MovableGridView()
}
