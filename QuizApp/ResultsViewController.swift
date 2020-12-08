//
//  ResultsViewController.swift
//  QuizApp
//
//  Created by TSL 150 on 2020-12-06.
//

import UIKit

struct PresentableAnswer {
    let question: String
    let answer: String
    let isCorrect: Bool
}

class CorrectAnswerCell: UITableViewCell {
    lazy var questionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    lazy var answerLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

class WrongAnswerCell: UITableViewCell {
    lazy var questionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    lazy var correctAnswerLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
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
        tableView.register(CorrectAnswerCell.self, forCellReuseIdentifier: String(describing: CorrectAnswerCell.self))
        tableView.register(WrongAnswerCell.self, forCellReuseIdentifier: String(describing: WrongAnswerCell.self))
    }
}

extension ResultsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return answers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let answer = answers[indexPath.row]
        return answer.isCorrect ? correctAnswerCell(for: answer) : wrongAnswerCell(for: answer)
    }
    
    private func correctAnswerCell(for answer: PresentableAnswer) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CorrectAnswerCell.self)) as? CorrectAnswerCell
        cell?.questionLabel.text = answer.question
        cell?.answerLabel.text = answer.answer
        return cell ?? UITableViewCell()
    }
    
    private func wrongAnswerCell(for answer: PresentableAnswer) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: WrongAnswerCell.self)) as? WrongAnswerCell
        cell?.questionLabel.text = answer.question
        cell?.correctAnswerLabel.text = answer.answer
        return cell ?? UITableViewCell()
    }
}
