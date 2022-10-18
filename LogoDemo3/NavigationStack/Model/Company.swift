//
//  Company.swift
//  LogoDemo3
//
//  Created by Terry Kuo on 2022/10/17.
//

import Foundation


struct Company: Identifiable, Hashable {
    var id = UUID()
    let name: String
}

struct Stock: Identifiable, Hashable {
    var id = UUID()
    let ticker: String
}
