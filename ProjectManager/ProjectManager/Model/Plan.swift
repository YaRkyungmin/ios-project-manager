//
//  Plan.swift
//  ProjectManager
//
//  Created by kyungmin on 2023/10/27.
//

import Foundation

struct Plan: Hashable {
    let identifier: UUID
    let title: String
    let content: String
    let date: String
}
