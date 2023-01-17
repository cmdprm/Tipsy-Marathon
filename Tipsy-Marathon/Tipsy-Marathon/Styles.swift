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
    
}
