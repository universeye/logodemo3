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
                        Spacer()
                        CheckBoxView(isSelected: viewModel.selectedAppIcon == appIcon)
                    }
                    .padding(EdgeInsets(top: 14, leading: 16, bottom: 14, trailing: 16))
                    .background(Color(uiColor: .secondarySystemBackground))
                    .cornerRadius(20)
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
