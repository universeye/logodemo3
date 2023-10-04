//
//  ChangeAppIconViewModel.swift
//  LogoDemo3
//
//  Created by Terry Kuo on 2023/10/4.
//

import SwiftUI

final class ChangeAppIconViewModel: ObservableObject {
    
    @Published private(set) var selectedAppIcon: AppIcon
    
    init() {
        if let iconName = UIApplication.shared.alternateIconName, let appIcon = AppIcon(rawValue: iconName) {
            selectedAppIcon = appIcon
        } else {
            selectedAppIcon = .primary
        }
    }
    
    func updateAppIcon(to icon: AppIcon) {
        let previousAppIcon = selectedAppIcon
        selectedAppIcon = icon

        Task { @MainActor in
            guard UIApplication.shared.alternateIconName != icon.iconName else {
                /// No need to update since we're already using this icon.
                return
            }

            do {
                try await UIApplication.shared.setAlternateIconName(icon.iconName)
            } catch {
                /// We're only logging the error here and not actively handling the app icon failure
                /// since it's very unlikely to fail.
                print("Updating icon to \(String(describing: icon.iconName)) failed.")

                /// Restore previous app icon
                selectedAppIcon = previousAppIcon
            }
        }
    }
}

extension ChangeAppIconViewModel {
    enum AppIcon: String, CaseIterable, Identifiable {
        case primary = "AppIcon"
        case darkMode = "AppIcon-Black"

        var id: String { rawValue }
        var iconName: String? {
            switch self {
            case .primary:
                /// `nil` is used to reset the app icon back to its primary icon.
                return nil
            default:
                return rawValue
            }
        }

        var description: String {
            switch self {
            case .primary:
                return "Default"
            case .darkMode:
                return "Dark mode"
            }
        }

        var preview: UIImage {
            UIImage(named: rawValue + "-Preview") ?? UIImage()
        }
    }
}
