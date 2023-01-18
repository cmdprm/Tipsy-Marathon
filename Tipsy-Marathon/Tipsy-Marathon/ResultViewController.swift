//
//  ResultViewController.swift
//  Tipsy-Marathon
//
//  Created by User on 18.01.2023.
//

import UIKit

class ResultViewController: UIViewController {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Result"
        label.font = UIFont.systemFont(ofSize: 44, weight: .bold)
        label.textColor = Colors.darkGreen
        
        return label
    }()
    
    let resultLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "0.0"
        label.font = UIFont.systemFont(ofSize: 56, weight: .medium)
        label.textColor = Colors.darkGreen
        
        return label
    }()
    
    var result: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.lightGreen
        resultLabel.text = "\(result!)$"
        layout()
    }
}

extension ResultViewController {
    func layout() {
        view.addSubview(titleLabel)
        view.addSubview(resultLabel)
        
        // TitleLabel
        NSLayoutConstraint.activate([
            titleLabel.bottomAnchor.constraint(equalTo: resultLabel.topAnchor, constant: -50),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        // ResultLabel
        NSLayoutConstraint.activate([
            resultLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            resultLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
}
