//
//  TabText.swift
//  LogoDemo3
//
//  Created by Terry Kuo on 2024/2/8.
//

import Foundation

enum TabText {
    case home
    case music
    case grid
    case kavsoft
    case nav
    case vtf
    case tasks
    case lazygrid
    case photospicker
    case multiplePhotosPicker
    case leasingOptions
    case collapsibleDemo
    case switchAnimation
    case markupEditor
    case extensionDemo
    case imageRecognizationDemo
    
    var title: String {
        switch self {
        case .home:
            return "Home"
        case .music:
            return "Music"
        case .grid:
            return "Grid"
        case .kavsoft:
            return "Kavsoft"
        case .nav:
            return "Navigation"
        case .vtf: //ViewThatFits
            return "VTF"
        case .tasks:
            return "Tasks"
        case .lazygrid:
            return "LazyGrid"
        case .photospicker:
            return "PhotosPicker"
        case .multiplePhotosPicker:
            return "MultiplePhotos"
        case .leasingOptions:
            return "Leasing"
        case .collapsibleDemo:
            return "Collapsible"
        case .switchAnimation:
            return "SwitchAnimation"
        case .markupEditor:
            return "MarkUp"
        case .extensionDemo:
            return "ExtensionDemo"
        case .imageRecognizationDemo:
            return "ImageRecognizationDemo"
        }
    }
    
    var image: String {
        switch self {
        case .home:
            return "house"
        case .music:
            return "music.quarternote.3"
        case .grid:
            return "rectangle.grid.3x2.fill"
        case .kavsoft:
            return "k.square.fill"
        case .nav:
            return "questionmark.folder.fill"
        case .vtf: //ViewThatFits
            return "eye.trianglebadge.exclamationmark"
        case .tasks:
            return "checkmark.square"
        case .lazygrid:
            return "square.grid.3x3.fill"
        case .photospicker:
            return "photo.artframe"
        case .multiplePhotosPicker:
            return "photo.stack"
        case .leasingOptions:
            return "paperclip"
        case .collapsibleDemo:
            return "square.grid.3x1.fill.below.line.grid.1x2"
        case .switchAnimation:
            return "doc.richtext.fill"
        case .markupEditor:
            return "pencil.and.ellipsis.rectangle"
        case .extensionDemo:
            return "studentdesk"
        case .imageRecognizationDemo:
            return "eye.square.fill"
        }
    }
}
