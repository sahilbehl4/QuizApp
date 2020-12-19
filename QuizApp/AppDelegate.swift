//
//  AppDelegate.swift
//  QuizApp
//
//  Created by TSL 150 on 2020-12-01.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let viewControoler = ResultsViewController(summary: "You have got 1/2 correct", answers: [
            PresentableAnswer(question: "Question1", answer: "answer1", wrongAnswer: nil),
            PresentableAnswer(question: "Question2", answer: "answer2", wrongAnswer: "not nil")
        ])
        window?.rootViewController = viewControoler
        window?.makeKeyAndVisible()
        return true
    }

}

