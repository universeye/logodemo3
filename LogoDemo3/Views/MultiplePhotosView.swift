//
//  MultiplePhotosView.swift
//  LogoDemo3
//
//  Created by Terry Kuo on 2023/9/28.
//

import SwiftUI

struct MultiplePhotosView: View {
    @State private var isImagePickerPresented: Bool = false
    @StateObject var viewModel = ImageListViewModel()
    
    var body: some View {
        VStack {
            List {
                ForEach(viewModel.idImages, id: \.id) { image in
                    image.image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 100)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                .onMove(perform: viewModel.move)
            }
            .environment(\.editMode, .constant(.active))
            
            
            Button(action: {
                self.isImagePickerPresented.toggle()
            }) {
                Text("Select Photos")
            }
            .buttonStyle(GrowingButton())
        }
        .sheet(isPresented: $isImagePickerPresented) {
            MultiImagePicker(selectedImages: $viewModel.idImages)
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
