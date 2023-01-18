//
//  AlertView.swift
//  Tipsy-Marathon
//
//  Created by User on 18.01.2023.
//

import UIKit

class AlertView {
    static func giveAlert(_ message: String) -> UIAlertController {
        let alertVC = UIAlertController(title: "Alert!", message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default)
        alertVC.addAction(okButton)
        return alertVC
    }
}
