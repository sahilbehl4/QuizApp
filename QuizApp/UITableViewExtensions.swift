//
//  UITableViewExtensions.swift
//  QuizApp
//
//  Created by TSL 150 on 2020-12-19.
//

import UIKit

extension UITableView {
    func register(_ type: UITableViewCell.Type) {
        let className = String(describing: type)
        register(type, forCellReuseIdentifier: className)
    }
    
    func deque(_ type: UITableViewCell.Type) -> UITableViewCell? {
        return dequeueReusableCell(withIdentifier: String(describing: type))
    }
}

