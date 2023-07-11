//
//  SubtaskCell.swift
//  LogoDemo3
//
//  Created by Terry Kuo on 2022/10/19.
//

import SwiftUI

struct SubtaskCell: View {
    let task: Subtask
        
        var body: some View {
            HStack {
                Image(systemName: "circle")
                    .foregroundColor(Color.primary.opacity(0.2))
                Text(task.title)
            }
        }
}

struct EmptySubtaskCell: View {
    @State private var text: String = ""
    
    var body: some View {
        HStack {
            Image(systemName: "circle")
                .foregroundColor(Color.primary.opacity(0.2))
            TextField("new task", text: $text)
        }
    }
}

struct TaskCell: View {
    @State private var isExpanded: Bool = false
    
    let task: Task
    
    var body: some View {
        content
            .padding(.leading)
            .frame(maxWidth: .infinity)
    }
    
    private var content: some View {
        VStack(alignment: .leading, spacing: 8) {
            header
            if isExpanded {
                Group {
                    ForEach(task.subtask) { subtask in
                        SubtaskCell(task: subtask)
                    }
                    EmptySubtaskCell()
                }
                .padding(.leading)
            }
            Divider()
        }
    }
    
    private var header: some View {
        HStack {
            Image(systemName: "square")
                .foregroundColor(Color.primary.opacity(0.2))
            Text(task.title)
        }
        .padding(.vertical, 4)
        .onTapGesture {
            withAnimation { isExpanded.toggle() }
        }
    }
}
