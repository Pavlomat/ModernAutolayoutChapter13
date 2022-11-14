//
//  AViewController.swift
//  ModernAutolayoutChapter13
//
//  Created by Pavlov Matvey on 14.11.2022.
//

import UIKit

class AViewController: UIViewController {
    
    private let label: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hello world"
        label.font = UIFont.preferredFont(forTextStyle: .caption2)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        view.backgroundColor = .red
    }
    
    private func setupView() {
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
