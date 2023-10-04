//
//  TasksView.swift
//  LogoDemo3
//
//  Created by Terry Kuo on 2022/10/19.
//

import SwiftUI

struct TasksView: View {
    private let tasks: [Tasker] = [
            Tasker(title: "Create playground", subtask: []),
            Tasker(title: "Write article", subtask: []),
            Tasker(
                title: "Prepare assets",
                subtask: [
                    Subtask(title: "Cover image"),
                    Subtask(title: "Screenshots")
                ]
            ),
            Tasker(title: "Publish article", subtask: [])
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
