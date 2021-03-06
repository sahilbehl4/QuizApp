//
//  ResultsViewControllerTests.swift
//  QuizAppTests
//
//  Created by TSL 150 on 2020-12-06.
//

import Foundation
import XCTest
@testable import QuizApp

class ResultsViewControllerTests: XCTestCase {
    func test_viewDidLoad_renderSummary() {
        XCTAssertEqual(makeSut(summary: "a summary", answers: []).headerLabel.text, "a summary")
    }
    
    func test_viewDidLoad_withOneAnswer_rendersAnswers() {
        XCTAssertEqual(makeSut(answers: []).tableView.numberOfRows(inSection: 0), 0)
        XCTAssertEqual(makeSut(answers: [makeAnswer()]).tableView.numberOfRows(inSection: 0), 1)
    }
    
    func test_viewDidLoad_withCorrectAnswer_configuresCell() {
        let sut = makeSut(answers: [makeAnswer(question: "Q1", answer: "A1")])
        let cell = sut.tableView.cell(at: 0) as? CorrectAnswerCell
        XCTAssertNotNil(cell)
        XCTAssertEqual(cell?.answerLabel.text, "A1")
        XCTAssertEqual(cell?.questionLabel.text, "Q1")
    }
    
    func test_viewDidLoad_withWringAnswer_configuresCell() {
        let sut = makeSut(answers: [makeAnswer(question: "Q1", answer: "A1", wrongAnswer: "wrong")])
        let cell = sut.tableView.cell(at: 0) as? WrongAnswerCell
        XCTAssertNotNil(cell)
        XCTAssertEqual(cell?.questionLabel.text, "Q1")
        XCTAssertEqual(cell?.correctAnswerLabel.text, "A1")
        XCTAssertEqual(cell?.wrongAnswerLabel.text, "wrong")
    }
    
    // MARK: - Answers
    
    func makeSut(summary: String = "", answers: [PresentableAnswer]) -> ResultsViewController {
        let sut = ResultsViewController(summary: summary, answers: answers)
        _ = sut.view
        return sut
    }
    
    func makeAnswer(question: String = "", answer: String = "", wrongAnswer: String? = nil) -> PresentableAnswer {
        return PresentableAnswer(question: question, answer: answer, wrongAnswer: wrongAnswer)
    }
}
