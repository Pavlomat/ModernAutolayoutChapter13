//
//  Model.swift
//  ModernAutolayoutChapter13
//
//  Created by Pavlov Matvey on 12.11.2022.
//

import Foundation

struct MainStruct: Codable {
    let objects: [Object]
}

struct Object: Codable {
    let number: Int
    let text: String
}
