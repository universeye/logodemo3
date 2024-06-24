//
//  ChangeAppIconViewModel.swift
//  LogoDemo3
//
//  Created by Terry Kuo on 2023/10/4.
//

import SwiftUI
import Kanna

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
    
    func parseHtml(_ html: String) {
        var gg: String = " "
//        var doc = try? Kanna.HTML(html: html, encoding: .utf8)
        var s = goldDataResult()
        if let doc = try? HTML(html: html, encoding: .utf8) {
            let nodeA = doc.xpath("/html/body/div/div/div/div/div/div/div/div/div/div/div[1]").first!
            print("Node: \(nodeA.text)")
        }
//        for i in 1...10 {
//            for j in 1...5 {
//                ///html/body/div/div/main/article/div/header/div/div/div/div/div/div/p/@class
//                /////*[@id=\"priceTable\"]/tbody/tr[\(i)]/td[\(j)]
//                for rate in doc!.xpath("/html/body/div/div/main/article/div/header/div/div/div/div/div/div/p/@class") {
//                    if j == 1 {
//                        gg = rate.text! as String
//                        s.data_d = gg.replacingOccurrences(of: " ", with: "")
//                    }
//                }
//            }
//        }
//        
//        print(s)
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
