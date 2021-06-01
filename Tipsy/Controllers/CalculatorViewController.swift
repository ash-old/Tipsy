//
//  ViewController.swift
//  Tipsy
//
//  Created by Ash Oldham on 25/05/2021.
//

import UIKit

class CalculatorViewController: UIViewController {
  
//  var calculateBrain = CalculateBrain()
  
  @IBOutlet weak var billTextField: UITextField!
  @IBOutlet weak var zeroPctButton: UIButton!
  @IBOutlet weak var tenPctButton: UIButton!
  @IBOutlet weak var twentyPctButton: UIButton!
  @IBOutlet weak var splitNumberLabel: UILabel!
  
  var percentage = ""
  var stepperValue = ""
  var finalBill = ""
  
  
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
    let billText = billTextField.text!
    let tipPercentage = percentage
    let personSplitValue = stepperValue
    
//    calculateBrain.calculateBill(billAmount: billText, tipPercentage: tipPercentage, personSplit: personSplitValue)
    let billTotal = Double(billText) ?? 0

    let removePct = tipPercentage.replacingOccurrences(of: "%", with: "")
    let percent = Decimal(string: removePct) ?? 0
    let decimalPercentage = percent / 100

    let split = Int(personSplitValue) ?? 2

    let PctResult = billTotal * Double(truncating: decimalPercentage as NSNumber)
    let result = (PctResult + billTotal) / Double(split)

    finalBill = String(format: "%.2f", result)
    
    self.performSegue(withIdentifier: "goToResults", sender: self)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "goToResults" {
      let destinationVC = segue.destination as! ResultsViewController
      destinationVC.totalPP = finalBill
      destinationVC.totalSplit = stepperValue
      destinationVC.totalTip = percentage
    }
  }
  
}

