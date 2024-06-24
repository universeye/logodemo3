//
//  CollapseCellModel.swift
//  LogoDemo3
//
//  Created by Terry Kuo on 2022/10/19.
//

import Foundation

struct Tasker: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let subtask: [Subtask]
}

struct Subtask: Identifiable {
    let id: String = UUID().uuidString
    let title: String
}
