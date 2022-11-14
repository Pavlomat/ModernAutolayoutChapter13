//
//  ChatViewController.swift
//  ModernAutolayoutChapter13
//
//  Created by Pavlov Matvey on 14.11.2022.
//

import UIKit

class ChatViewController: UITableViewController {
    
    private let messages: [Message] = [
        Message(username: "Joe", text: "Hello World!"), Message(username: "Peter Piper", text: "Mr. Watson I presume"),
        Message(username: "Harry Housefield", text: "Once upon a time, in a land far far away"),
        Message(username: "Sir Roger Martin-Grayson III", text: "I cannot wait to see what happens next. I do hope they all lived happily ever after.")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(ChatCell.self, forCellReuseIdentifier: "chatCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "chatCell", for: indexPath) as? ChatCell else { fatalError() }
        let message = messages[indexPath.row]
        cell.headLabel.text = message.username
        cell.bodyLabel.text = message.text
        return cell
    }
}
