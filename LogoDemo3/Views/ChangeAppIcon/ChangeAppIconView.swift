//
//  ChangeAppIconView.swift
//  LogoDemo3
//
//  Created by Terry Kuo on 2023/10/4.
//

import SwiftUI

struct ChangeAppIconView: View {
    @StateObject var viewModel = ChangeAppIconViewModel()
    @State private var changeTheme = false
    @AppStorage("user_theme") private var userTheme: Theme = .systemDefault
    @Environment(\.colorScheme) private var scheme
    @Namespace private var animation
    
    var body: some View {
        Form {
            Section {
                ForEach(ChangeAppIconViewModel.AppIcon.allCases) { appIcon in
                    HStack(spacing: 16) {
                        Image(uiImage: appIcon.preview)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 60, height: 60)
                            .cornerRadius(12)
                        Text(appIcon.description)
                            .font(.footnote)
                            .bold()
                        Spacer()
                        CheckBoxView(isSelected: viewModel.selectedAppIcon == appIcon)
                    }
                    //                    .padding(EdgeInsets(top: 14, leading: 16, bottom: 14, trailing: 16))
                    //                    .background(Color(uiColor: .secondarySystemBackground))
                    //                    .cornerRadius(20)
                    .onTapGesture {
                        withAnimation {
                            viewModel.updateAppIcon(to: appIcon)
                        }
                    }
                }
            } header: {
                Text("App Icon")
            }
            
            Section {
                Button {
                    changeTheme.toggle()
                } label: {
                    LabeledContent("Change Theme") {
                        Text("\(userTheme.rawValue)")
                    }
                }
                
            } header: {
                Text("Theme")
            }
            
            Section {
                VStack {
//                    HStack(spacing: 25) {
//                        ThemeButtonCell(isDark: false)
//                            .padding(0)
////                        Spacer()
//                        ThemeButtonCell(isDark: false)
//                            .padding(0)
////                        Spacer()
//                        ThemeButtonCell(isDark: true)
//                            .padding(0)
//                    }
                    HStack(spacing: 0, content: {
                        ForEach(Theme.allCases, id: \.rawValue) { theme in
                            Text(theme.rawValue)
                                .padding(.vertical, 10)
                                .frame(maxWidth: .infinity)
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
//                    .padding(.top, 0)
                    .frame(maxWidth: .infinity)
                }
            } header: {
                Text("Theme2")
            }
            .listRowBackground(Color(uiColor: .clear))
            
            Section {
                VisionProView()
            } header: {
                Text("Vision Pro")
            }
        }
        .background(Color(UIColor.systemBackground).ignoresSafeArea())
        .navigationTitle("Settings")
        .sheet(isPresented: $changeTheme) {
            AppThemeSwitcherView(scheme: scheme)
                .presentationDetents([.height(410)])
                .presentationBackground(.clear)
        }
        .preferredColorScheme(userTheme.colorScheme)
    }
}

struct ChangeAppIconView_Previews: PreviewProvider {
    static var previews: some View {
        ChangeAppIconView()
    }
}
