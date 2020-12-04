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
        let vc = QuestionViewController(question: "Question 1", options: ["Option 1", "Option 2"], onSelection: {
            print($0)
        })
        _ = vc.view
        vc.tableView.allowsMultipleSelection = true
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        return true
    }

}

