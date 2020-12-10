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
    let wrongAnswer: String?
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
    
    lazy var wrongAnswerLabel: UILabel = {
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
        tableView.register(CorrectAnswerCell.self)
        tableView.register(WrongAnswerCell.self)
    }
}

extension ResultsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return answers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let answer = answers[indexPath.row]
        return answer.wrongAnswer == nil ? correctAnswerCell(for: answer) : wrongAnswerCell(for: answer)
    }
    
    private func correctAnswerCell(for answer: PresentableAnswer) -> UITableViewCell {
        let cell = tableView.deque(CorrectAnswerCell.self) as? CorrectAnswerCell
        cell?.questionLabel.text = answer.question
        cell?.answerLabel.text = answer.answer
        return cell ?? UITableViewCell()
    }
    
    private func wrongAnswerCell(for answer: PresentableAnswer) -> UITableViewCell {
        let cell = tableView.deque(WrongAnswerCell.self) as? WrongAnswerCell
        cell?.questionLabel.text = answer.question
        cell?.correctAnswerLabel.text = answer.answer
        cell?.wrongAnswerLabel.text = answer.wrongAnswer
        return cell ?? UITableViewCell()
    }
}

extension UITableView {
    func register(_ type: UITableViewCell.Type) {
        let className = String(describing: type)
        register(type, forCellReuseIdentifier: className)
    }
    
    func deque(_ type: UITableViewCell.Type) -> UITableViewCell? {
        return dequeueReusableCell(withIdentifier: String(describing: type))
    }
}
