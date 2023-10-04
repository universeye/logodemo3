//
//  MultiplePhotosView.swift
//  LogoDemo3
//
//  Created by Terry Kuo on 2023/9/28.
//

import SwiftUI

struct MultiplePhotosView: View {
    @State private var selectedImages: [IdentifiableImage] = []
    @State private var isImagePickerPresented: Bool = false
    
    var body: some View {
        VStack {
            if !selectedImages.isEmpty {
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible())], spacing: 10) {
                        ForEach(selectedImages, id: \.id) { image in
                            image.image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 100)
                        }
                    }
                }
            } else {
                Text("No images selected")
            }
            
            Button(action: {
                self.isImagePickerPresented.toggle()
            }) {
                Text("Select Photos")
            }
        }
        .sheet(isPresented: $isImagePickerPresented) {
            MultiImagePicker(selectedImages: self.$selectedImages)
        }
    }
    
    
    
}

#Preview {
    MultiplePhotosView()
}

struct IdentifiableImage: Identifiable {
    let id = UUID()
    let image: Image
}
