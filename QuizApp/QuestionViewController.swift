//
//  QuestionViewController.swift
//  QuizApp
//
//  Created by TSL 150 on 2020-12-01.
//

import UIKit

class QuestionViewController: UIViewController {
    
    private var question = ""
    private var options = [String]()
    private let reuseIdentifier = "Cell"
    private var onSelection: (([String]) -> Void)?

    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    convenience init(question: String, options: [String], onSelection: @escaping (([String]) -> Void)) {
        self.init()
        self.question = question
        self.options = options
        self.onSelection = onSelection
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headerLabel.text = question
    }
}

extension QuestionViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dequeueCell()
        cell.textLabel?.text = options[indexPath.row]
        return cell
    }
    
    private func dequeueCell() -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) {
            return cell
        }
        return UITableViewCell(style: .default, reuseIdentifier: reuseIdentifier)
    }
}

extension QuestionViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        onSelection?(selectedOptions(in: tableView))
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if tableView.allowsMultipleSelection {
            onSelection?(selectedOptions(in: tableView))
        }
    }
    
    private func selectedOptions(in tableView: UITableView) -> [String] {
        return tableView.indexPathsForSelectedRows?.compactMap { options[$0.row] } ?? []
    }
}
