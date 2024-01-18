//
//  AppThemeSwitcherView.swift
//  LogoDemo3
//
//  Created by Terry Kuo on 2024/1/16.
//

import SwiftUI

struct AppThemeSwitcherView: View {
    var scheme: ColorScheme
    @AppStorage("user_theme") private var userTheme: Theme = .systemDefault
    @Namespace private var animation
    @State private var circleOffset: CGSize = .zero
    
    init(scheme: ColorScheme) {
        self.scheme = scheme
        let isDark = scheme == .dark
        self._circleOffset = .init(initialValue: CGSize(width: isDark ? 30 : 150, height: isDark ? -25 : 150))
    }
    
    var body: some View {
        VStack(spacing: 15) {
            Circle()
                .fill(userTheme.color(scheme).gradient)
                .frame(width: 150, height: 150)
                .mask {
                    Rectangle()
                        .overlay {
                            Circle()
                                .offset(circleOffset)
                                .blendMode(.destinationOut)
                        }
                }
            Text("Choose a Style")
                .font(.title2.bold())
                .padding(.top, 25)
            
            Text("Pop or subtle, Day or night. \nCustomize your interface.")
                .multilineTextAlignment(.center)
            
            HStack(spacing: 0, content: {
                ForEach(Theme.allCases, id: \.rawValue) { theme in
                    Text(theme.rawValue)
                        .padding(.vertical, 10)
                        .frame(width: 100)
                        .background {
                            ZStack {
                                if userTheme == theme {
                                    Capsule()
                                        .fill(Color(uiColor: .systemBackground))
                                        .matchedGeometryEffect(id: "ACTIVETAB", in: animation)
                                }
                            }
                            .animation(.snappy, value: userTheme)
                        }
                        .contentShape(.rect)
                        .onTapGesture {
                            userTheme = theme
                        }
                }
            })
            .padding(3)
            .background(.primary.opacity(0.06), in: .capsule)
            .padding(.top, 20)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .frame(height: 410)
        .background(Color(uiColor: .systemBackground))
        .clipShape(.rect(cornerRadius: 30))
        .padding(.horizontal, 15)
        .environment(\.colorScheme, scheme)
        .onChange(of: scheme) { _, newVlaue in
            let isDark = newVlaue == .dark
            withAnimation(.bouncy) {
                circleOffset = CGSize(width: isDark ? 30 : 150, height: isDark ? -25 : 150)
            }
        }
    }
}

#Preview {
    AppThemeSwitcherView(scheme: .dark)
}

enum Theme: String, CaseIterable {
    case systemDefault = "Default"
    case light = "Light"
    case dark = "Dark"
    
    func color(_ scheme: ColorScheme) -> Color {
        switch self {
        case .systemDefault:
            return scheme == .dark ? .purple : .yellow
        case .light:
            return .yellow
        case .dark:
            return .purple
        }
    }
    
    var colorScheme: ColorScheme? {
        switch self {
        case .systemDefault:
            return nil
        case .light:
            return .light
        case .dark:
            return .dark
        }
    }
}
