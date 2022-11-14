//
//  ReusableIdentifier.swift
//  ModernAutolayoutChapter13
//
//  Created by Pavlov Matvey on 14.11.2022.
//

import Foundation

protocol ReusableIdentifier: AnyObject {
    static var reuseIdentifier: String { get }
}

extension ReusableIdentifier {
    static var reuseIdentifier: String {
        return "\(self)"
    }
}
