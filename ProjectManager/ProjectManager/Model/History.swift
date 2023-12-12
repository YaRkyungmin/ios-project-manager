//
//  History.swift
//  ProjectManager
//
//  Created by kyungmin on 2023/12/12.
//

import Foundation

struct History: Hashable {
    let identifier: UUID
    let movement: Movement
    let title: String
    let recode: String
    let date: String
}

extension History {
    enum Movement {
        case move
        case add
        case remove
    }
}
