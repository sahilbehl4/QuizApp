//
//  ResultsViewController.swift
//  QuizApp
//
//  Created by TSL 150 on 2020-12-06.
//

import UIKit

struct PresentableAnswer {
    let isCorrect: Bool
}

class CorrectAnswerCell: UITableViewCell {
    
}

class WrongAnswerCell: UITableViewCell {
    
}

class ResultsViewController: UIViewController {
    lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()

    private var summary: String?
    private var answers: [PresentableAnswer] = []

    convenience init(summary: String, answers: [PresentableAnswer]) {
        self.init()
        self.summary = summary
        self.answers = answers
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        design()
        headerLabel.text = summary
    }
    
    private func design() {
        
    }
}

extension ResultsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return answers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return answers[indexPath.row].isCorrect ? CorrectAnswerCell() : WrongAnswerCell()
    }
}
