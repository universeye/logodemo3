//
//  GridDemoView.swift
//  LogoDemo3
//
//  Created by Terry Kuo on 2022/10/18.
//

import SwiftUI

struct GridDemoView: View {
    var body: some View {
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
