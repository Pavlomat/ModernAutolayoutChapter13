//
//  Book.swift
//  ModernAutolayoutChapter13
//
//  Created by Pavlov Matvey on 14.11.2022.
//

import Foundation

struct Book: Codable {
    let title: String
    let author: String
    let text: [String]
}

extension Book {
    init?(contentsOf url: URL) {
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            self = try decoder.decode(Book.self, from: data)
        } catch {
            return nil
        }
    }
}
