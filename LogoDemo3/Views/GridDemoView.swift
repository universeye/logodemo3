//
//  GridDemoView.swift
//  LogoDemo3
//
//  Created by Terry Kuo on 2022/10/18.
//

import SwiftUI

struct GridDemoView: View {
    @Environment(\.safeArea) var safeArea
    
    var body: some View {
        NavigationStack {
            Grid {
                Text("SwiftUI Grid")
                    .padding(8)
                    .font(.title.bold())
                    .background(.pink)
                    .cornerRadius(10)
                GridRow {
                    Rect()
                        .gridCellColumns(2)
                    Rect()
                    //                Rect()
                }
                GridRow {
                    Rect()
                    Rect()
                    Rect()
                }
                GridRow {
                    Rect()
                    Rect()
                    Rect()
                }
                GridRow {
                    Rect()
                        .gridCellColumns(1)
                    Rect()
                        .gridCellColumns(3)
                }
            }
            .padding()
            .overlay {
                Text("Top = \(safeArea.top)\nBottom = \(safeArea.bottom)")
                NavigationLink {
                    DetailView()
                } label: {
                    Text("Datail View")
                }
                .offset(y: 50)
            }
            
        }
    }
}

struct DetailView: View {
    @Environment(\.safeArea) var safeArea
    var body: some View {
        Color.blue
            .navigationTitle("Datail View")
            .overlay {
                Text("Top = \(safeArea.top)\nBottom = \(safeArea.bottom)")
            }
    }
}

struct Rect: View {
    var body: some View {
        Rectangle()
            .fill(.gray)
            .cornerRadius(10)
    }
}

struct GridDemoView_Previews: PreviewProvider {
    static var previews: some View {
        GridDemoView()
    }
}
