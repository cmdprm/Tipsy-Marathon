//
//  Styles.swift
//  Tipsy-Marathon
//
//  Created by User on 17.01.2023.
//

import UIKit

class Styles {
    
    static func setupTitleLabel(label: UILabel, title: String) {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .darkGray
        label.textAlignment = .center
        label.text = title
    }
    
    static func setupTipButton(button: UIButton, title: String) {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        button.setTitle(title, for: [])
        button.titleLabel?.font = UIFont.systemFont(ofSize: 28)
        button.backgroundColor = Colors.darkGreen
        button.layer.cornerRadius = 8
    }
    
    static func setupTipInactiveButton(button: UIButton, title: String) {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(title, for: [])
        button.titleLabel?.font = UIFont.systemFont(ofSize: 28)
        button.layer.cornerRadius = 8
        button.tintColor = Colors.darkGreen
        button.backgroundColor = .none
    }
}

struct Colors {
    static var darkGreen: UIColor { return UIColor(named: "DarkGreen")! }
    static var lightGreen: UIColor { return UIColor(named: "LightGreen")! }
}
