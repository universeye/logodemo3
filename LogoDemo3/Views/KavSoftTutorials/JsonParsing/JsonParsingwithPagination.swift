//
//  JsonParsingwithPagination.swift
//  LogoDemo3
//
//  Created by Terry Kuo on 2024/4/9.
//

import SwiftUI

struct JsonParsingwithPagination: View {
    ///View Properties
    @State private var photos: [Photo] = []
    @State private var page: Int = 1
    @State private var lastFetchedPage: Int = 1
    @State private var isLoading = false
    @State private var maxPage: Int = 5
    ///Pagination Properties
    @State private var activePhototID: String?
    @State private var lastPhotoID: String?
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVGrid(columns: Array(repeating: GridItem(spacing: 10), count: 3), spacing: 10) {
                ForEach(photos) { photo in
                    PhotoCardView(photo: photo)
                }
            }
            .overlay(alignment: .bottom) {
                if isLoading {
                    ProgressView()
                        .offset(y: 30)
                }
            }
            .padding(15)
            .padding(.bottom, 15)
            .scrollTargetLayout()
        }
        .scrollPosition(id: $activePhototID, anchor: .bottomTrailing)
        .onChange(of: activePhototID, { oldValue, newValue in
            print("New value: \(newValue ?? "no value")")
            if newValue == lastPhotoID, !isLoading, page != maxPage {
                print("Fetch More...")
                page += 1
                fetchPhotos()
            }
        })
        .onAppear {
            if photos.isEmpty {
                fetchPhotos()
            }
        }
    }
    
    func fetchPhotos() {
        Task {
            do {
                if let url = URL(string: "https://picsum.photos/v2/list?page=\(page)&limit=20") {
                    isLoading = true
                    let session = URLSession(configuration: .default)
                    let jsonData = try await session.data(from: url).0
                    let photos = try JSONDecoder().decode([Photo].self, from: jsonData)
                    
                    await MainActor.run {
                        if photos.isEmpty {
                            page = lastFetchedPage
                            maxPage = lastFetchedPage
                        } else {
                            self.photos.append(contentsOf: photos)
                            lastPhotoID = self.photos.last?.id
                            lastFetchedPage = page
                        }
                        isLoading = false
                    }
                }
            } catch {
                isLoading = false
                print(error.localizedDescription)
            }
        }
    }
}

///Photo Card View0

#Preview {
    JsonParsingwithPagination()
}
