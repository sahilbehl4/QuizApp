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
        XCTAssertEqual(makeSut(answers: [makeDummyAnswer()]).tableView.numberOfRows(inSection: 0), 1)
    }
    
    func test_viewDidLoad_withCorrectAnswers_RendersCorrectAnswerCell() {
        let sut = makeSut(answers: [PresentableAnswer(isCorrect: true)])
        let cell = sut.tableView.cell(at: 0) as? CorrectAnswerCell
        XCTAssertNotNil(cell)
    }
    
    func test_viewDidLoad_withWrongAnswers_RendersWrongAnswerCell() {
        let sut = makeSut(answers: [makeDummyAnswer()])
        let cell = sut.tableView.cell(at: 0) as? WrongAnswerCell
        XCTAssertNotNil(cell)
    }
    
    // MARK: - Answers
    
    func makeSut(summary: String = "", answers: [PresentableAnswer]) -> ResultsViewController {
        let sut = ResultsViewController(summary: summary, answers: answers)
        _ = sut.view
        return sut
    }
    
    func makeDummyAnswer() -> PresentableAnswer {
        return PresentableAnswer(isCorrect: false)
    }
}
