//
//  KavSoftView.swift
//  LogoDemo3
//
//  Created by Terry Kuo on 2022/12/6.
//

import SwiftUI

enum KavSoftViewType: String, CaseIterable {
    case magnifyingGlass
    case rollingCounter
    case glassMorphismView
    case animatedTag
    case movableGrid
    case complexAnimationSynchronizedScrollViews
    case appThemeSwitcher
    case custumSwipeAction
    case jsonParsingwithPagination
}

struct KavSoftView: View {
    @State private var path: [KavSoftViewType] = []
    @Environment(\.colorScheme) private var scheme
    
    var body: some View {
        NavigationStack(path: $path) {
            List(KavSoftViewType.allCases, id: \.self) { kavSoftViewType in
                NavigationLink(kavSoftViewType.rawValue, value: kavSoftViewType)
            }
            .navigationDestination(for: KavSoftViewType.self) { kavSoftViewType in
                switch kavSoftViewType {
                case .magnifyingGlass:
                    MagnifyingGlassView()
                case .rollingCounter:
                    RollingCounterView()
                case .glassMorphismView:
                    GlassMorphismView()
                        .preferredColorScheme(.dark)
                        .navigationTitle(kavSoftViewType.rawValue)
                case .animatedTag:
                    AnimatedTagView()
                        .navigationTitle(kavSoftViewType.rawValue)
                case .movableGrid:
                    MovableGridView()
                case .complexAnimationSynchronizedScrollViews:
                    ComplexAnimationSynchronizedScrollView()
                        .navigationTitle(kavSoftViewType.rawValue)
                case .appThemeSwitcher:
                    AppThemeSwitcherView(scheme: scheme)
                        .navigationTitle(kavSoftViewType.rawValue)
                case .custumSwipeAction:
                    SwipeActionsView()
                        .navigationTitle(kavSoftViewType.rawValue)
                case .jsonParsingwithPagination:
                    JsonParsingwithPagination()
                        .navigationTitle(kavSoftViewType.rawValue)
                }
            }
            .navigationTitle("KavSoft")
        }
    }
}

struct KavSoftView_Previews: PreviewProvider {
    static var previews: some View {
        KavSoftView()
    }
}
