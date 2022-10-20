//
//  TasksView.swift
//  LogoDemo3
//
//  Created by Terry Kuo on 2022/10/19.
//

import SwiftUI

struct TasksView: View {
    private let tasks: [Task] = [
            Task(title: "Create playground", subtask: []),
            Task(title: "Write article", subtask: []),
            Task(
                title: "Prepare assets",
                subtask: [
                    Subtask(title: "Cover image"),
                    Subtask(title: "Screenshots")
                ]
            ),
            Task(title: "Publish article", subtask: [])
        ]
        
        var body: some View {
            NavigationView {
                ScrollView {
                    ForEach(tasks) { task in
                        TaskCell(task: task)
                            .animation(.default, value: true)
                    }
                    .navigationTitle("Todo List")
                }
            }
        }
}

struct TasksView_Previews: PreviewProvider {
    static var previews: some View {
        TasksView()
    }
}
