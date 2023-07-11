//
//  LazyVGridDemo.swift
//  LogoDemo3
//
//  Created by Terry Kuo on 2023/7/11.
//

import SwiftUI

struct LazyVGridDemo: View {
    private var symbols = ["keyboard", "hifispeaker.fill", "printer.fill", "tv.fill", "desktopcomputer", "headphones", "tv.music.note", "mic", "plus.bubble", "video"]
    private var colors: [Color] = [.yellow, .purple, .green]
    private var gridItemLayout1 = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    private var sixColumnGrid: [GridItem] = Array(repeating: .init(.flexible()), count: 6)
    private var gridItemLayout2 = [GridItem(.adaptive(minimum: 50))]
    private var gridItemLayout3 = [GridItem(.fixed(100)), GridItem(.fixed(150))]
    private var gridItemLayout4 = [GridItem(.fixed(150)), GridItem(.adaptive(minimum: 50))]
    @State var selected: Int = 0
    @State var selectedGridItemLayout: Int = 0
    @State var gridItemLayout: [GridItem] = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        VStack {
            Picker(selection: $selected) {
                Text("Vertical").tag(0)
                Text("Horizontal").tag(1)
            } label: {
                Text("Picker")
            }
            .pickerStyle(.segmented)
            .padding()
            Picker(selection: $selectedGridItemLayout) {
                Text(".flexible").tag(0)
                Text(".adaptive").tag(1)
                Text(".fixed").tag(2)
                Text(".fixed+.adaptive").tag(3)
            } label: {
                Text("Picker2")
            }
            .onChange(of: selectedGridItemLayout, perform: { newValue in
                withAnimation(.spring()) {
                    switch newValue {
                    case 0:
                        gridItemLayout = gridItemLayout1
                    case 1:
                        gridItemLayout = gridItemLayout2
                    case 2:
                        gridItemLayout = gridItemLayout3
                    case 3:
                        gridItemLayout = gridItemLayout4
                    default:
                        gridItemLayout = gridItemLayout1
                    }
                }
            })
            .pickerStyle(.segmented)
            .padding(.horizontal)
            .padding(.bottom)
            
            
            switch selected {
            case 0:
                ScrollView {
                    LazyVGrid(columns: gridItemLayout, spacing: 20) {
                        ForEach((0...999), id: \.self) {
                            Image(systemName: symbols[$0 % symbols.count])
                                .font(.system(size: 30))
                                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50)
                                .background(colors[$0 % colors.count])
                                .cornerRadius(10)
                        }
                    }
                    .animation(.spring(), value: selectedGridItemLayout)
                }
                .padding(.horizontal)
            case 1:
                ScrollView(.horizontal) {
                    LazyHGrid(rows: gridItemLayout, spacing: 20) {
                        ForEach((0...999), id: \.self) {
                            Image(systemName: symbols[$0 % symbols.count])
                                .font(.system(size: 30))
                                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50, maxHeight: .infinity)
                                .background(colors[$0 % colors.count])
                                .cornerRadius(10)
                        }
                    }
                    .animation(.spring(), value: selectedGridItemLayout)
                }
                .padding(.horizontal)
                
            default:
                EmptyView()
            }
            Spacer()
            
        }
        
        
    }
}

struct LazyVGridDemo_Previews: PreviewProvider {
    static var previews: some View {
        LazyVGridDemo()
    }
}
