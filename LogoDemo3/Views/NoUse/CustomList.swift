//
//  CustomList.swift
//  LogoDemo3
//
//  Created by Terry Kuo on 2024/2/10.
//

import SwiftUI

struct CustomList: View {
    var body: some View {
        List {
            ForEach(0...5, id: \.self) { index in
                SwipeView {
                    Text("Hello, World!")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.green)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                } trailingActions: { _ in
                    SwipeAction("World") {
                        print("Tapped!")
                    }
                    
                    SwipeAction(systemImage: "trash") {
                        print("Deleting...")
                    }
                }
                .swipeActionsStyle(.equalWidths)
            }
            .listRowSeparator(.hidden)
            .listRowBackground( Color.clear )
        }
        .listStyle(.plain)
        
        List {
            ForEach(0...5, id: \.self) { index in
                Text("Hello, World2!")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.green)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .swipeActions(edge: .trailing) {
                        Button(action: {}, label: {
                            Text("Button")
                        })
                        .overlay {
                            Circle()
                                .fill(.green)
                        }
                    }
            }
            .listRowSeparator(.hidden)
            .listRowBackground( Color.clear )
        }
        .listStyle(.plain)
    }
}

#Preview {
    CustomList()
}
