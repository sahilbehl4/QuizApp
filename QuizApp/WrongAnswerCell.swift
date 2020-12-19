//
//  WrongAnswerCell.swift
//  QuizApp
//
//  Created by TSL 150 on 2020-12-19.
//

import UIKit
import SnapKit

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
    
    lazy var stackView: UIStackView  = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func design() {
        addSubview(stackView)
        stackView.addArrangedSubview(questionLabel)
        stackView.addArrangedSubview(correctAnswerLabel)
        stackView.addArrangedSubview(wrongAnswerLabel)

        stackView.snp.makeConstraints {
            $0.leftMargin.topMargin.rightMargin.bottomMargin.equalTo(10)
        }
    }
}


