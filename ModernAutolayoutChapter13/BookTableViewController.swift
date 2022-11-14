//
//  FirstTableViewController.swift
//  ModernAutolayoutChapter13
//
//  Created by Pavlov Matvey on 12.11.2022.
//

import UIKit

class BookTableViewController: UITableViewController {

    var bookUrl: URL? {
        didSet {
            if let url = bookUrl {
                dataSource = BookDataSource(tableView: tableView, contentsOf: url)
            }
        }
    }
    
    private var dataSource: BookDataSource? {
        didSet { title = dataSource?.title }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(LineCell.self, forCellReuseIdentifier: LineCell.reuseIdentifier)
    }
    
}
    
    
//    private func setupView() {
//        view.addSubview(mainTableView)
//
//        mainTableView.register(LineCell.self, forCellReuseIdentifier: "Cell")
//
//        NSLayoutConstraint.activate([
//            mainTableView.topAnchor.constraint(equalTo: view.topAnchor),
//            mainTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            mainTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//            mainTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
//        ])
//    }
//
//    func loadJson(filename fileName: String) {
//        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
//            do {
//                let data = try Data(contentsOf: url)
//                let jsonData = try JSONDecoder().decode(MainStruct.self, from: data)
//                jsons = jsonData.objects
//                print(jsons)
//            } catch {
//                print("error:\(error)")
//            }
//        }
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return jsons.count
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? LineCell else { fatalError() }
//        let object = jsons[indexPath.row]
//        cell.lineLabel.text = String(object.number)
//        cell.textView.text = object.text
//        return cell
//    }
//}
//
//extension UITableView {
//    func createTableView() -> UITableView {
//        let view = UITableView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }
//}
