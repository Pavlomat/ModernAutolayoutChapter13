//
//  ChatCell.swift
//  ModernAutolayoutChapter13
//
//  Created by Pavlov Matvey on 14.11.2022.
//

import UIKit

final class ChatCell: UITableViewCell {
    
    let chatImage: UIImageView = {
        let view = UIImageView(image: UIImage(named: "screenshot"))
//        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return view
    }()
    
    let headLabel = createLabel(font: .headline)
    let bodyLabel = createLabel(font: .body)
    
    private lazy var internalStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [headLabel, bodyLabel])
        stackView.axis = .vertical
        stackView.spacing = UIStackView.spacingUseSystem
        stackView.alignment = .fill
        stackView.distribution = .fill
        return stackView
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [chatImage, internalStackView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = UIStackView.spacingUseSystem
        stackView.alignment = .fill
        stackView.distribution = .fill
        return stackView
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupView()
    }
    
    private func setupView() {
//        contentView.addSubview(chatImage)
        contentView.addSubview(mainStackView)

        let margins = contentView.readableContentGuide  //readabaleContentGuide чтобы на ipad текст был уже для удобства чтения
        NSLayoutConstraint.activate([
            margins.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor),
            margins.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor),
            margins.topAnchor.constraint(equalTo: mainStackView.topAnchor),
            margins.bottomAnchor.constraint(equalTo: mainStackView.bottomAnchor)
            
//            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: chatImage.trailingAnchor, multiplier: 1.0),
//            margins.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
//            margins.topAnchor.constraint(equalTo: stackView.topAnchor),
//            margins.bottomAnchor.constraint(equalTo: stackView.bottomAnchor),
        ])
    }
}

extension UITableViewCell {
    static func createLabel(font: UIFont.TextStyle) -> UILabel {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: font)
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }
}
