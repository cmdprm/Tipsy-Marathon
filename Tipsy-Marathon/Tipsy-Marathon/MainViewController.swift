//
//  MainViewController.swift
//  Tipsy-Marathon
//
//  Created by User on 17.01.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    let tap = UITapGestureRecognizer()
    
    let billStackView = UIStackView()
    let billLabel = UILabel()
    let billField = UITextField()
    
    let backgroundView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

extension MainViewController {
    func style() {
        // Tap
        tap.addTarget(self, action: #selector(tappedOnScreen))
        
        // BillStackView
        billStackView.translatesAutoresizingMaskIntoConstraints = false
        billStackView.axis = .vertical
        billStackView.spacing = 8
        billStackView.alignment = .center
        
        // BillLabel
        Styles.setupTitleLabel(label: billLabel, title: "Enter Bill Total")
        
        // BillField
        billField.translatesAutoresizingMaskIntoConstraints = false
        billField.placeholder = "e.g. 1234"
        billField.keyboardType = .decimalPad
        billField.font = UIFont.systemFont(ofSize: 44)
        billField.textAlignment = .center
        billField.textColor = .systemGreen
        
        // BackgroundView
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.backgroundColor = .systemGreen
    }
    
    func layout() {
        billStackView.addArrangedSubview(billLabel)
        billStackView.addArrangedSubview(billField)
        
        view.addGestureRecognizer(tap)
        view.addSubview(billStackView)
        view.addSubview(backgroundView)
        
        let safeArea = view.safeAreaLayoutGuide
        
        // BillStackView
        NSLayoutConstraint.activate([
            billStackView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 20),
            billStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            view.trailingAnchor.constraint(equalTo: billStackView.trailingAnchor, constant: 20),
            billStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        // BackgroundView
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: billStackView.bottomAnchor, constant: 20),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

// MARK: - Actions
extension MainViewController {
    @objc func tappedOnScreen() {
        billField.resignFirstResponder()
    }
}
