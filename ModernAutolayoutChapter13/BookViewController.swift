//
//  FirstTableViewController.swift
//  ModernAutolayoutChapter13
//
//  Created by Pavlov Matvey on 12.11.2022.
//

import UIKit

class BookViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var books = [String]()
    var bookUrl: URL?
    
    let tableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(LineCell.self, forCellReuseIdentifier: "lineCell")
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        setupView()
        loadJson()
    }
    
    private func setupView() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "lineCell", for: indexPath) as? LineCell else { fatalError() }
        let book = books[indexPath.row]
        cell.lineLabel.text = NumberFormatter.localizedString(from: NSNumber(value: indexPath.row + 1), number: .decimal)
        cell.textView.text = book
        return cell
    }
    
    func loadJson() {
        if let url = bookUrl {
            do {
                let data = try Data(contentsOf: url)
                let jsonData = try JSONDecoder().decode(Book.self, from: data)
                books = jsonData.text
                tableView.reloadData()
            } catch {
                print("error:\(error)")
            }
        }
    }
    
}
