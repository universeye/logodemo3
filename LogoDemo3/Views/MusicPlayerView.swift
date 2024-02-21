//
//  MusicPlayerView.swift
//  LogoDemo3
//
//  Created by Terry Kuo on 2024/2/7.
//

import SwiftUI
import MusicKit
import MusadoraKit
import MediaPlayer

struct MusicPlayerView: View {
//    let musicToken = MusicToken(type: .appleMusic) // or .local
//    let player = SystemMusicPlayer.shared
    @State private var musicPlayer = MPMusicPlayerController.applicationMusicPlayer
    @StateObject private var musicAuthorizationManager = MusicAuthorizationManager()
    @State private var songId = ""
    @State private var songArtist = ""
    @State private var songTitle = ""
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    NavigationLink {
                        PlayerController()
                    } label: {
                        Text("Now Playing")
                    }
                    
                }
                Section {
                    LabeledContent("Authorization Status") {
                        Image(systemName: "circle.fill")
                            .font(.system(size: 9))
                            .foregroundStyle(musicAuthorizationManager.isAuthorizedForMusicKit ? .green : .red)
                    }
                    Button {
                        Task {
                            await getSearchSong()
                        }
                    } label: {
                        Text("get search songs")
                    }
                    LabeledContent("Song Id", value: songId)
                    LabeledContent("Artist", value: songArtist)
                    LabeledContent("Title", value: songTitle)
                    Button {
                        musicPlayer.setQueue(with: [songId])
                        musicPlayer.play()
                    } label: {
                        Text("play")
                    }
                    Button {
                        musicPlayer.play()
                    } label: {
                        Text("resume")
                    }
                    Button {
                        musicPlayer.pause()
                    } label: {
                        Text("pause")
                    }
                }
                
                Section {
                    
                }
            }
            .navigationTitle("Play")
        }
        .task {
            await musicAuthorizationManager.requestMusicAuthorization()
        }
    }
    
    private func getSearchSong() async {
        do {
            let searchResponse = try await MCatalog.search(for: "the weeknd", types: [.songs], limit: 10)
            print(searchResponse.songs)
            if let firstSong = searchResponse.songs.first {
                self.songId = firstSong.id.rawValue
                self.songArtist = firstSong.artistName
                self.songTitle = firstSong.title
            }
            print(searchResponse.artists)
        } catch {
            print("failed getting search song.")
        }
        
    }
}

#Preview {
    MusicPlayerView()
}
