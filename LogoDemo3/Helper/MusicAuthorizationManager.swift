//
//  MusicAuthorizationManager.swift
//  LogoDemo3
//
//  Created by Terry Kuo on 2024/2/7.
//

import Foundation
import MusicKit

@MainActor
class MusicAuthorizationManager: ObservableObject {
    @Published var isAuthorizedForMusicKit = false
    @Published var musicKitError: MusicKitError?

    func requestMusicAuthorization() async {
        let status = await MusicAuthorization.request()

        switch status {
        case .authorized:
            isAuthorizedForMusicKit = true
        case .restricted:
            musicKitError = .restricted
        case .notDetermined:
            musicKitError = .notDetermined
        case .denied:
            musicKitError = .denied
        @unknown default:
            musicKitError = .notDetermined
        }
    }
}

enum MusicKitError: Error {
    case restricted
    case notDetermined
    case denied
}
