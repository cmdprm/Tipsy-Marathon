//
//  MainViewController.swift
//  Tipsy-Marathon
//
//  Created by User on 17.01.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    let tap: UITapGestureRecognizer = {
        let tap = UITapGestureRecognizer()
        return tap
    }()
    
    // BillStackView
    let billStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .center
        
        return stackView
    }()
    
    let billLabel: UILabel = {
        let label = UILabel()
        
        Styles.setupTitleLabel(label: label, title: "Enter Bill Total")
        
        return label
    }()
    
    let billField: UITextField = {
        let textField = UITextField()
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "e.g. 1234"
        textField.keyboardType = .decimalPad
        textField.font = UIFont.systemFont(ofSize: 44)
        textField.textAlignment = .center
        textField.textColor = Colors.darkGreen
        
        return textField
    }()
    
    let backgroundView: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Colors.lightGreen
        
        return view
    }()
    
    // TipStackView
    let tipStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .center
        
        return stackView
    }()
    
    let tipLabel: UILabel = {
        let label = UILabel()
        
        Styles.setupTitleLabel(label: label, title: "Select Tip")
        
        return label
    }()
    let buttonStack: UIStackView = {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        
        return stackView
    }()
    let firstButton: UIButton = {
        let button = UIButton(type: .system)
        
        Styles.setupTipButton(button: button, title: "0%")
        
        return button
    }()
    let secondButton: UIButton = {
        let button = UIButton(type: .system)
        
        Styles.setupTipInactiveButton(button: button, title: "10%")
        
        return button
    }()
    let thirdButton: UIButton = {
        let button = UIButton(type: .system)
        
        Styles.setupTipInactiveButton(button: button, title: "20%")
        
        return button
    }()
    
    // PersonStackView
    let personStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .center
        
        return stackView
    }()
    let personLabel: UILabel = {
        let label = UILabel()
        
        Styles.setupTitleLabel(label: label, title: "Choose Split")
        
        return label
    }()
    let counterStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 80
        
        return stackView
    }()
    let counterLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Colors.darkGreen
        label.font = UIFont.systemFont(ofSize: 30)
        label.text = "2"
        
        return label
    }()
    let counterStepper: UIStepper = {
        let stepper = UIStepper()
        
        stepper.translatesAutoresizingMaskIntoConstraints = false
        stepper.value = 2
        stepper.minimumValue = 2
        
        return stepper
    }()
    
    let calculateButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        button.backgroundColor = Colors.darkGreen
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        button.layer.cornerRadius = 8
        button.setTitle("Calculate", for: [])
        
        return button
    }()
    
    // MARK: - Vars
    
    var tipSelected: Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tap.addTarget(self, action: #selector(tappedOnScreen))
        firstButton.addTarget(self, action: #selector(tipButtonPressed), for: .primaryActionTriggered)
        secondButton.addTarget(self, action: #selector(tipButtonPressed), for: .primaryActionTriggered)
        thirdButton.addTarget(self, action: #selector(tipButtonPressed), for: .primaryActionTriggered)
        counterStepper.addTarget(self, action: #selector(stepperValueChanged), for: .valueChanged)
        calculateButton.addTarget(self, action: #selector(calculateButtonPressed), for: .primaryActionTriggered)
        
        layout()
    }
}

extension MainViewController {
    func layout() {
        billStackView.addArrangedSubview(billLabel)
        billStackView.addArrangedSubview(billField)
        
        tipStackView.addArrangedSubview(tipLabel)
        buttonStack.addArrangedSubview(firstButton)
        buttonStack.addArrangedSubview(secondButton)
        buttonStack.addArrangedSubview(thirdButton)
        tipStackView.addArrangedSubview(buttonStack)
        
        personStackView.addArrangedSubview(personLabel)
        counterStackView.addArrangedSubview(counterLabel)
        counterStackView.addArrangedSubview(counterStepper)
        personStackView.addArrangedSubview(counterStackView)
        
        view.addGestureRecognizer(tap)
        view.addSubview(billStackView)
        view.addSubview(backgroundView)
        view.addSubview(tipStackView)
        view.addSubview(personStackView)
        view.addSubview(calculateButton)
        
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
        
        // PersonStackView
        NSLayoutConstraint.activate([
            personStackView.topAnchor.constraint(equalTo: tipStackView.bottomAnchor, constant: 20),
            personStackView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 20),
            backgroundView.trailingAnchor.constraint(equalTo: personStackView.trailingAnchor, constant: 20),
            personStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        // CounterStackView
        NSLayoutConstraint.activate([
//            counterStackView.leadingAnchor.constraint(equalTo: personStackView.leadingAnchor, constant: 30),
//            personStackView.trailingAnchor.constraint(equalTo: counterStackView.trailingAnchor, constant: 30),
        ])
        
        // CalculateButton
        NSLayoutConstraint.activate([
            safeArea.bottomAnchor.constraint(equalTo: calculateButton.bottomAnchor, constant: 20),
            calculateButton.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 40),
            backgroundView.trailingAnchor.constraint(equalTo: calculateButton.trailingAnchor, constant: 40),
            calculateButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}

// MARK: - Actions
extension MainViewController {
    
    @objc func tappedOnScreen() {
        billField.resignFirstResponder()
    }
    
    @objc func calculateButtonPressed() {
        var bill: String?
        
        if billField.text != "" {
            bill = billField.text
        } else {
            let alertVC = AlertView.giveAlert("Bill is empty!")
            present(alertVC, animated: true)
            return
        }
        guard let personCount = Float(counterLabel.text!) else { return }
        
        let calculatedBill = calculateBill(bill!)
        let result = giveResult(calculatedBill, count: personCount)
        
        let resultVC = ResultViewController()
        resultVC.result = result
        present(resultVC, animated: true)
    }
    
    @objc func tipButtonPressed(_ sender: UIButton) {
        guard let title = sender.currentTitle else { return }
        
        switchTip(title)
    }
    
    private func giveResult(_ calculatedBill: Float, count: Float) -> String {
        let result = calculatedBill / count
        let formattedResult = String(format: "%.2f", result)
        return formattedResult
    }
    
    private func calculateBill(_ bill: String) -> Float {
        let safeBill = Float(bill)!
        
        let totalBill: Float = safeBill + (safeBill * tipSelected/100)
        
        return totalBill
    }
    
    private func switchTip(_ title: String) {
        switch title {
        case "0%":
            tipSelected = 0.0
            Styles.setupTipButton(button: firstButton, title: "0%")
            Styles.setupTipInactiveButton(button: secondButton, title: "10%")
            Styles.setupTipInactiveButton(button: thirdButton, title: "20%")
        case "10%":
            tipSelected = 10.0
            Styles.setupTipInactiveButton(button: firstButton, title: "0%")
            Styles.setupTipButton(button: secondButton, title: "10%")
            Styles.setupTipInactiveButton(button: thirdButton, title: "20%")
        case "20%":
            tipSelected = 20.0
            Styles.setupTipInactiveButton(button: firstButton, title: "0%")
            Styles.setupTipInactiveButton(button: secondButton, title: "10%")
            Styles.setupTipButton(button: thirdButton, title: "20%")
        default:
            print("Default")
        }
    }
    
    @objc func stepperValueChanged() {
        counterLabel.text = "\(Int(counterStepper.value))"
    }
}
