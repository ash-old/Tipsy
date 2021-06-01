//
//  ViewController.swift
//  Tipsy
//
//  Created by Ash Oldham on 25/05/2021.
//

import UIKit

class CalculatorViewController: UIViewController {
  
  @IBOutlet weak var billTextField: UITextField!
  @IBOutlet weak var zeroPctButton: UIButton!
  @IBOutlet weak var tenPctButton: UIButton!
  @IBOutlet weak var twentyPctButton: UIButton!
  @IBOutlet weak var splitNumberLabel: UILabel!
  
  var percentage = ""
  var stepperValue = ""
  
  
  @IBAction func tipChanged(_ sender: UIButton) {
    
    billTextField.endEditing(true)
    
    switch sender {
    case zeroPctButton:
      zeroPctButton.isSelected = true
      tenPctButton.isSelected = false
      twentyPctButton.isSelected = false
    case tenPctButton:
      tenPctButton.isSelected = true
      zeroPctButton.isSelected = false
      twentyPctButton.isSelected = false
    case twentyPctButton:
      twentyPctButton.isSelected = true
      zeroPctButton.isSelected = false
      tenPctButton.isSelected = false
    default:
      print("error, no button text")
    }
    
    percentage = sender.currentTitle ?? "Error, no button title"
  }
  
  @IBAction func stepperValueChanged(_ sender: UIStepper) {
    stepperValue = String(format: "%.*f", sender.value)
    splitNumberLabel.text = stepperValue
  }
  
  
  @IBAction func calculatePressed(_ sender: UIButton) {
    
    let billTotal = Double(billTextField.text!) ?? 0
    
    let removePct = percentage.replacingOccurrences(of: "%", with: "")
    let percent = Decimal(string: removePct) ?? 0
    let decimalPercentage = percent / 100
    
    let split = Int(stepperValue) ?? 2
    
    let PctResult = billTotal * Double(truncating: decimalPercentage as NSNumber)
    let result = (PctResult + billTotal) / Double(split)
    
    let finalResult = String(format: "%.2f", result)
    
    self.performSegue(withIdentifier: "goToResults", sender: self)
  }
  
  
}

