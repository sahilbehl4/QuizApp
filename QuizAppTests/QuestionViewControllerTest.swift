//
//  QuestionViewControllerTest.swift
//  QuizAppTests
//
//  Created by TSL 150 on 2020-12-01.
//

import Foundation
import XCTest
@testable import QuizApp

class QuestionViewControllerTest: XCTestCase {
    func test_viewDidLoad_rendersQuestionHeaderText() {
        XCTAssertEqual(makeSUT(question: "Q1", options: []).headerLabel.text, "Q1")
    }
    
    func test_viewDidLoad_rendersOptions() {
        XCTAssertEqual(makeSUT(question: "Q1", options: []).tableView.numberOfRows(inSection: 0), 0)
        XCTAssertEqual(makeSUT(options: ["O1"]).tableView.numberOfRows(inSection: 0), 1)
        XCTAssertEqual(makeSUT(options: ["O1", "O2"]).tableView.numberOfRows(inSection: 0), 2)
    }
    
    func test_viewDidLoad_withOptionsText() {
        XCTAssertEqual(makeSUT(options: ["O1", "O2"]).tableView.title(at: 0), "O1")
        XCTAssertEqual(makeSUT(options: ["O1", "O2"]).tableView.title(at: 1), "O2")
    }
    
    func test_optionSelected_withSingleSelection_notifiesDelegateWithLastSelection() {
        var receivedAnswer: [String] = []
        let sut = makeSUT(options: ["A1", "A2"]) { receivedAnswer = $0 }
        
        sut.tableView.select(row: 0)
        XCTAssertEqual(receivedAnswer, ["A1"])
        
        sut.tableView.select(row: 1)
        XCTAssertEqual(receivedAnswer, ["A2"])
    }
    
    func test_optionSelected_withSingleSelction_doesNotNotifyDelegate() {
        var callBackCount = 0
        let sut = makeSUT(options: ["A1", "A2"]) { _ in
            callBackCount += 1
        }
        
        sut.tableView.select(row: 0)
        XCTAssertEqual(callBackCount, 1)
        
        sut.tableView.deSelect(row: 0)
        XCTAssertEqual(callBackCount, 1)
    }
    
    func test_optionSelected_withMultipleSelectionEnabled_notifiesDelegate() {
        var receivedAnswer: [String] = []
        let sut = makeSUT(options: ["A1", "A2"]) { receivedAnswer = $0 }
        sut.tableView.allowsMultipleSelection = true

        sut.tableView.select(row: 0)
        XCTAssertEqual(receivedAnswer, ["A1"])
        sut.tableView.select(row: 1)
        XCTAssertEqual(receivedAnswer, ["A1", "A2"])
    }
    
    func test_optionDeSelected_withMultipleSelectionEnabled_notifiesDelegate() {
        var receivedAnswer: [String] = []
        let sut = makeSUT(options: ["A1", "A2"]) { receivedAnswer = $0 }
        sut.tableView.allowsMultipleSelection = true

        sut.tableView.select(row: 0)
        XCTAssertEqual(receivedAnswer, ["A1"])
        sut.tableView.deSelect(row: 0)
        XCTAssertEqual(receivedAnswer, [])
    }
    
    // MARK: - Helper
    
    func makeSUT(question: String = "", options: [String], onSelection: @escaping (([String]) -> Void) = { _ in }) -> QuestionViewController {
        let sut = QuestionViewController(question: question, options: options, onSelection: onSelection)
        _ = sut.view
        return sut
    }
}

private extension UITableView {
    func cell(at row: Int) -> UITableViewCell? {
        return dataSource?.tableView(self, cellForRowAt: IndexPath(row: row, section: 0))
    }
    
    func title(at row: Int) -> String? {
        return cell(at: row)?.textLabel?.text
    }
    
    func select(row: Int) {
        let indexPath = IndexPath(row: row, section: 0)
        selectRow(at: indexPath, animated: false, scrollPosition: .none)
        delegate?.tableView?(self, didSelectRowAt: indexPath)
    }
    
    func deSelect(row: Int) {
        let indexPath = IndexPath(row: row, section: 0)
        deselectRow(at: indexPath, animated: false)
        delegate?.tableView?(self, didDeselectRowAt: indexPath)
    }
}
