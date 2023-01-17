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
    
    let tipStackView = UIStackView()
    let tipLabel = UILabel()
    let buttonStack = UIStackView()
    let firstButton = UIButton(type: .system)
    let secondButton = UIButton(type: .system)
    let thirdButton = UIButton(type: .system)
    
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
        
        // TipStackView
        tipStackView.translatesAutoresizingMaskIntoConstraints = false
        tipStackView.axis = .vertical
        tipStackView.spacing = 8
        tipStackView.alignment = .center
        
        // TipLabel
        Styles.setupTitleLabel(label: tipLabel, title: "Select Tip")
        
        // ButtonStack
        buttonStack.translatesAutoresizingMaskIntoConstraints = false
        buttonStack.axis = .horizontal
        buttonStack.distribution = .equalSpacing
        
        // FirstButton
        Styles.setupTipButton(button: firstButton, title: "0%")
        
        // SecondButton
        Styles.setupTipButton(button: secondButton, title: "10%")
        
        // ThirdButton
        Styles.setupTipButton(button: thirdButton, title: "20%")
    }
    
    func layout() {
        billStackView.addArrangedSubview(billLabel)
        billStackView.addArrangedSubview(billField)
        
        tipStackView.addArrangedSubview(tipLabel)
        buttonStack.addArrangedSubview(firstButton)
        buttonStack.addArrangedSubview(secondButton)
        buttonStack.addArrangedSubview(thirdButton)
        tipStackView.addArrangedSubview(buttonStack)
        
        view.addGestureRecognizer(tap)
        view.addSubview(billStackView)
        view.addSubview(backgroundView)
        view.addSubview(tipStackView)
        
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
        
        // TipStackView
        NSLayoutConstraint.activate([
            tipStackView.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 20),
            tipStackView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 20),
            backgroundView.trailingAnchor.constraint(equalTo: tipStackView.trailingAnchor, constant: 20),
            tipStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        // ButtonStack
        NSLayoutConstraint.activate([
            buttonStack.leadingAnchor.constraint(equalTo: tipStackView.leadingAnchor, constant: 20),
            tipStackView.trailingAnchor.constraint(equalTo: buttonStack.trailingAnchor, constant: 20),
        ])
        
        // Buttons
        NSLayoutConstraint.activate([
            firstButton.widthAnchor.constraint(equalToConstant: 80),
            secondButton.widthAnchor.constraint(equalToConstant: 80),
            thirdButton.widthAnchor.constraint(equalToConstant: 80),
        ])
    }
}

// MARK: - Actions
extension MainViewController {
    @objc func tappedOnScreen() {
        billField.resignFirstResponder()
    }
}
