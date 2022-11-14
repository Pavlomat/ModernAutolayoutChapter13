//
//  BookDataSource.swift
//  ModernAutolayoutChapter13
//
//  Created by Pavlov Matvey on 14.11.2022.
//

import UIKit

final class BookDataSource: NSObject {
    private let tableView: UITableView
    private let book: Book?
    private let bookURL: URL

    var title: String? {
        return book?.title
    }

    var author: String? {
        return book?.author
    }

    init(tableView: UITableView, contentsOf url: URL) {
        self.tableView = tableView
        bookURL = url
        book = Book(contentsOf: url)
        super.init()
        tableView.dataSource = self
        tableView.reloadData()
    }
}

extension BookDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return book?.text.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LineCell.reuseIdentifier, for: indexPath)
        configure(cell: cell, indexPath: indexPath)
        return cell
    }

    private func configure(cell: UITableViewCell, indexPath: IndexPath) {
        if let cell = cell as? LineCell {
            cell.lineLabel.text = NumberFormatter.localizedString(from:
                NSNumber(value: indexPath.row + 1), number: .decimal)
            cell.textView.text = book?.text[indexPath.row]
        }
    }
}
