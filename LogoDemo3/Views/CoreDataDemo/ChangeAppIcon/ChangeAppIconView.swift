//
//  ChangeAppIconView.swift
//  LogoDemo3
//
//  Created by Terry Kuo on 2023/10/4.
//

import SwiftUI
import CurrencyProviding
import Alamofire
import SwiftSoup// This is a simplified example, not for real world use

struct ChangeAppIconView: View {
    @StateObject var viewModel = ChangeAppIconViewModel()
    @State private var changeTheme = false
    
    @AppStorage("user_theme") private var userTheme: Theme = .systemDefault
    @Environment(\.colorScheme) private var scheme
    @Namespace private var animation
    @Binding var darkModeEnabled: Bool
    @Binding var systemThemeEnabled: Bool
    
    var body: some View {
        Form {
            Section {
                FolderView()
            }
            
            Section {
                Button(action: {
//                    loadGoldPrice()
                    
                    // Hypothetical fetching of HTML content (not shown for brevity)
                    let htmlContent = fetchHTMLContentFromPitchfork()

                    // Extract the value (if successful)
                    if let value = getValueFromHTML(html: htmlContent) {
                      print(value) // This would print "5.8"
                    } else {
                      print("Value not found")
                    }
                }, label: {
                    Text("Get Price")
                })
            }
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
            Section(header: Text("Display"), footer: Text("System settings will override Dark mode and use the current device theme")) {
                Toggle(isOn: $darkModeEnabled, label: {
                    Text("Dark Mode")
                })
                .onChange(of: darkModeEnabled, perform: { _ in
                    SystemThemeManager.shared.handleTheme(darkMode: darkModeEnabled, system: systemThemeEnabled)
                })
                Toggle(isOn: $systemThemeEnabled, label: {
                    Text("Use system settings")
                })
                .onChange(of: systemThemeEnabled, perform: { _ in
                    SystemThemeManager.shared.handleTheme(darkMode: darkModeEnabled, system: systemThemeEnabled)
                })
            }
#if os(iOS)
            Section {
                CurrencyPicker()
                
                NavigationLink(destination: CurrencyExampleView()) {
                    Text("CurrencyExampleView")
                }
            } header: {
                Text("Currency Provider")
            }
            #endif
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
                    .padding()
            } header: {
                Text("Vision Pro")
            }
            
            Section {
                MeatballView()
            }
            .frame(height: 500)
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
    
    func loadGoldPrice() {
        //https://www.104.com.tw/company/112ce5w8
        //https://hiphopdx.com/reviews/kanye-west-ty-dolla-sign-vultures-1-album-review
        //https://pitchfork.com/reviews/albums/kanye-west-and-ty-dolla-sign-vultures-1/
        //https://www.allmusic.com/album/vultures-1-mw0004167494
        AF.request("https://hiphopdx.com/reviews/kanye-west-yeezus-album-review").responseString { response in
            switch response.result {
            case .success(let res):
                print("Success with \(res)")
                viewModel.parseHtml(res)
            case .failure(let error):
                print("Error with \(error.localizedDescription)")
            }

        }
    }
    
    // This is a simplified example, not for real world use
    func getValueFromHTML(html: String) -> String? {
      // Use a library like SwiftSoup to parse HTML
      let document: Document = try! SwiftSoup.parse(html)
      
        do {
            // Find the element with the desired class names
            let element = try document.select("p.BaseWrap-sc-gjQpdd.BaseText-ewhhUZ.Rating-iATjmx.iUEiRd.hJnYqh.gtaikz")
            return try element.text()
        } catch {
            return nil
        }
    }

    
    
    func  fetchHTMLContentFromPitchfork() -> String {
        var returnedString = "returnedString"
        AF.request("https://pitchfork.com/reviews/albums/kanye-west-and-ty-dolla-sign-vultures-1/").responseString { response in
            switch response.result {
            case .success(let res):
                print("Success with \(res)")
                returnedString = res
            case .failure(let error):
                print("Error with \(error.localizedDescription)")
            }
        }
        
        return returnedString
    }

}

//struct ChangeAppIconView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChangeAppIconView(darkModeEnabled: .constant(true), systemThemeEnabled: .constant(true))
//    }
//}

struct goldDataResult {
    var data_d: String = ""
    var buy: String = ""
}
