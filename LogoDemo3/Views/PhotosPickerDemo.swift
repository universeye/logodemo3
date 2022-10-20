//
//  PhotosPickerDemo.swift
//  LogoDemo3
//
//  Created by Terry Kuo on 2022/10/18.
//

import PhotosUI
import SwiftUI

struct PhotosPickerDemo: View {
    @State private var selectedItems: [PhotosPickerItem] = []
    @State private var data: Data?
    var body: some View {
        VStack {
            if let data = data,
               let uiimage = UIImage(data: data) {
                Image(uiImage: uiimage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
            }
            PhotosPicker(
                selection: $selectedItems,
                maxSelectionCount: 1,
                matching: .images) {
                Text("Select a Photo")
            }
            .buttonStyle(GrowingButton())
            .onChange(of: selectedItems) { newValue in
                guard let item = selectedItems.first else { return }
                item.loadTransferable(type: Data.self) { result in
                    switch result {
                    case .success(let data):
                        if let data = data {
                            self.data = data
                        } else {
                            print("Data is nil.")
                        }
                    case .failure(let failure):
                        print("failed: \(failure)")
                    }
                }
            }
        }
    }
}

struct PhotosPickerDemo_Previews: PreviewProvider {
    static var previews: some View {
        PhotosPickerDemo()
    }
}
