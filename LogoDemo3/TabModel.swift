//
//  TabModel.swift
//  LogoDemo3
//
//  Created by Terry Kuo on 2024/2/8.
//

import Foundation
import SwiftUI

struct TabModel {
    var title: String
    var image: String
    var destination: AnyView

    init<V>(title: String, image: String, destination: V) where V: View {
        self.title = title
        self.image = image
        self.destination = AnyView(destination)
    }

    static var views: [TabModel] {
        let models = [
            TabModel(title: TabText.home.title, image: TabText.home.image, destination: CoreDataDemo()),
            TabModel(title: TabText.music.title, image: TabText.music.image, destination: MusicPlayerView()),
            TabModel(title: TabText.imageRecognizationDemo.title, image: TabText.imageRecognizationDemo.image, destination: ImageRecognitionDemo()),
            TabModel(title: TabText.grid.title, image: TabText.grid.image, destination: GridDemoView()),
            TabModel(title: TabText.kavsoft.title, image: TabText.kavsoft.image, destination: KavSoftView()),
            TabModel(title: TabText.nav.title, image: TabText.nav.image, destination: NavigationStackDemoView()),
            TabModel(title: TabText.vtf.title, image: TabText.vtf.image, destination: ViewThatFitsDemo()),
            TabModel(title: TabText.tasks.title, image: TabText.tasks.image, destination: TasksView()),
            TabModel(title: TabText.lazygrid.title, image: TabText.lazygrid.image, destination: LazyVGridDemo()),
            TabModel(title: TabText.photospicker.title, image: TabText.photospicker.image, destination: PhotosPickerDemo()),
            TabModel(title: TabText.multiplePhotosPicker.title, image: TabText.multiplePhotosPicker.image, destination: MultiplePhotosView()),
            TabModel(title: TabText.leasingOptions.title, image: TabText.leasingOptions.image, destination: LeasingOptions()),
            TabModel(title: TabText.collapsibleDemo.title, image: TabText.collapsibleDemo.image, destination: CollapsibleDemoView()),
            TabModel(title: TabText.switchAnimation.title, image: TabText.switchAnimation.image, destination: SwitchAnimationView()),
            TabModel(title: TabText.markupEditor.title, image: TabText.markupEditor.image, destination: MarUpEditor()),
            TabModel(title: TabText.extensionDemo.title, image: TabText.extensionDemo.image, destination: ExtensionDemo())
        ]
        return models
    }
}

