//
//  AnimatedTagView.swift
//  LogoDemo3
//
//  Created by Terry Kuo on 2023/9/12.
//

import SwiftUI

struct AnimatedTagView: View {
    ///View Properties
    ///Sample Tags
    ///
    @State private var tags: [String] = ["SwfitUI", "Swift", "Apple", "iOS", "iPadOS", "Xcode", "WWDC", "Android", "React", "Flutter"]
    
    @State private var selectedTags: [String] = []
    @Namespace private var animation
    
    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                HStack(spacing: 12) {
                    ForEach(selectedTags, id: \.self) { tag in
                        tagView(tag, .pink, "checkmark")
                            .matchedGeometryEffect(id: tag, in: animation)
                        //remove from selected tags
                            .onTapGesture {
                                withAnimation(.spring()) {
                                    selectedTags.removeAll(where: {$0 == tag})
                                }
                            }
                    }
                }
                .padding(.horizontal, 15)
                .frame(height: 35)
                .padding(.vertical, 15)
            }
            .scrollIndicators(.hidden)
            .overlay {
                if selectedTags.isEmpty {
                    Text("Select More than 3 tags")
                        .font(.callout)
                        .foregroundColor(.gray)
                }
            }
            .background(.white)
            .zIndex(1)
            
            ScrollView(.vertical) {
                TagLayout(alignment: .trailing, spacing: 10) {
                    ForEach(tags.filter({ !selectedTags.contains($0)}), id: \.self) { tag in
                        tagView(tag, .blue, "plus")
                            .matchedGeometryEffect(id: tag, in: animation)
                            .onTapGesture {
                                //Adding to selected tags
                                withAnimation(.spring()) {
                                    selectedTags.insert(tag, at: 0)
                                }
                            }
                    }
                }
                .padding(16)
            }
            .background(.black.opacity(0.05))
            .zIndex(0)
            ZStack {
                Button {
                    
                } label: {
                    Text("Continue")
                        .fontWeight(.semibold)
                        .padding(.vertical, 15)
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(.white)
                        .background {
                            RoundedRectangle(cornerRadius: 12)
                                .fill(.pink.gradient)
                        }
                }
                .disabled(selectedTags.count < 3)
                .opacity(selectedTags.count < 3 ? 0.5 : 1)
                .padding()

            }
            .background(.white)
            .zIndex(2)
        }
    }
    
    //Tag View
    @ViewBuilder
    func tagView(_ tag: String, _ color: Color, _ icon: String) -> some View {
        HStack(spacing: 5) {
            Text(tag)
                .font(.callout)
                .fontWeight(.semibold)
            
            Image(systemName: icon)
        }
        .frame(height: 35)
        .foregroundStyle(.white)
        .padding(.horizontal, 15)
        .background {
            Capsule()
                .fill(color.gradient)
        }
    }
}

struct AnimatedTagView_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedTagView()
    }
}
