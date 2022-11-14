//
//  LineCell.swift
//  ModernAutolayoutChapter13
//
//  Created by Pavlov Matvey on 12.11.2022.
//

import UIKit

final class LineCell: UITableViewCell {
    
    let lineLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .caption2)
        label.adjustsFontForContentSizeCategory = true
        label.textAlignment = .right
        return label
    }()

    let textView: UITextView = {
        let view = UITextView()
        view.font = UIFont.preferredFont(forTextStyle: .body)
        view.adjustsFontForContentSizeCategory = true
        view.isEditable = false
        view.isScrollEnabled = false
        return view
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [lineLabel, textView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        return stackView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }

    private func setupView() {
        contentView.addSubview(stackView)

        let margins = contentView.readableContentGuide  //readabaleContentGuide чтобы на ipad текст был уже для удобства чтения
        NSLayoutConstraint.activate([
            margins.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            margins.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            margins.topAnchor.constraint(equalTo: stackView.topAnchor),
            margins.bottomAnchor.constraint(equalTo: stackView.bottomAnchor)
        ])
    }
}
