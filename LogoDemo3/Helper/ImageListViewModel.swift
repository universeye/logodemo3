//
//  ImageListViewModel.swift
//  LogoDemo3
//
//  Created by Terry Kuo on 2023/12/18.
//

import SwiftUI

class ImageListViewModel: ObservableObject {
    @Published var idImages: [IdentifiableImage] = []

    func move(from source: IndexSet, to destination: Int) {
        idImages.move(fromOffsets: source, toOffset: destination)
    }

    func delete(at offsets: IndexSet) {
        idImages.remove(atOffsets: offsets)
    }
}
