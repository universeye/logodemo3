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
    @State private var tags: [String] = ["三大保證", "售後保固", "里程保證", "實車保證", "非營業車", "平行輸入", "總代理", "不滿意可退車", "實價保證"]
    
    @State private var tags2: [String] = ["三大保證", "售後保固", "里程保證", "實車保證", "非營業車", "平行輸入", "總代理", "不滿意可退車", "實價保證"]
    
    @State private var selectedTags: [String] = []
    @State private var selectedTags2: [String] = []
    @Namespace private var animation
    
    var body: some View {
                ScrollView {
        VStack {
            sectionOne()
            Divider()
            sectionTwo()
            Spacer()
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
//            .background(.yellow)
            .zIndex(2)
        }
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
    
    
    //MARK: Section One
    @ViewBuilder
    func sectionOne() -> some View {
        Text("特色標籤")
            .font(.headline)
        ScrollView(.vertical) {
            TagLayout(alignment: .center, spacing: 10) {
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
            .padding(10)
        }
        .scrollIndicators(.hidden)
        .overlay {
            if selectedTags.isEmpty {
                Text("Select More than 3 tags")
                    .font(.callout)
                    .foregroundColor(.gray)
            }
        }
//        .background(.green)
        .zIndex(1)
        
        ScrollView(.vertical) {
            TagLayout(alignment: .center, spacing: 10) {
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
            .padding(10)
        }
        .background(.black.opacity(0.05))
        .zIndex(0)
    }
    
    //MARK: Section One
    @ViewBuilder
    func sectionTwo() -> some View {
        Text("保證項目")
            .font(.headline)
        ScrollView(.vertical) {
            TagLayout(alignment: .center, spacing: 10) {
                ForEach(selectedTags2, id: \.self) { tag in
                    tagView(tag, .pink, "checkmark")
//                        .matchedGeometryEffect(id: tag, in: animation)
                    //remove from selected tags
                        .onTapGesture {
                            withAnimation(.spring()) {
                                selectedTags2.removeAll(where: {$0 == tag})
                            }
                        }
                }
            }
            .padding(10)
//            .padding(.horizontal, 15)
            .frame(height: selectedTags2.isEmpty ? 40 : .none)
//            .padding(.vertical, 15)
        }
        .scrollIndicators(.hidden)
        .overlay {
            if selectedTags2.isEmpty {
                Text("Select More than 3 tags")
                    .font(.callout)
                    .foregroundColor(.gray)
                    
            }
        }
        .background(.black.opacity(0.05))
        .cornerRadius(10)
        
        .overlay(content: {
            RoundedRectangle(cornerRadius: 10)
                .stroke(.blue.gradient.opacity(1) ,lineWidth: 0.8)
        })
        .padding(.horizontal)
        
        .zIndex(1)
        
        ScrollView(.vertical) {
            TagLayout(alignment: .center, spacing: 10) {
                ForEach(tags2.filter({ !selectedTags2.contains($0)}), id: \.self) { tag in
                    tagView(tag, .blue, "plus")
//                        .matchedGeometryEffect(id: tag, in: animation)
                        .onTapGesture {
                            //Adding to selected tags
                            withAnimation(.spring()) {
                                selectedTags2.insert(tag, at: 0)
                            }
                        }
                }
            }
            .padding(10)
        }
        .background(.black.opacity(0.05))
        
        .cornerRadius(10)
        .padding(10)
        .zIndex(0)
    }
}

struct AnimatedTagView_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedTagView()
    }
}
