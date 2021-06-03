//
//  ViewController.swift
//  Tipsy
//
//  Created by Ash Oldham on 25/05/2021.
//

import UIKit

class CalculatorViewController: UIViewController {
  
  var calculateBrain = CalculateBrain()
  
  @IBOutlet weak var billTextField: UITextField!
  @IBOutlet weak var zeroPctButton: UIButton!
  @IBOutlet weak var tenPctButton: UIButton!
  @IBOutlet weak var twentyPctButton: UIButton!
  @IBOutlet weak var splitNumberLabel: UILabel!
  
  var percentage = "0"
  var stepperValue = 2
  var billText = "0.00"
  
  
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
    splitNumberLabel.text = String(format: "%.*f", sender.value)
    stepperValue = Int(sender.value)
  }
  
  
  @IBAction func calculatePressed(_ sender: UIButton) {
    billText = billTextField.text!
    let tipPercentage = percentage
    let personSplit = stepperValue
    
    calculateBrain.calculateBill(billAmount: billText, tipPercentage: tipPercentage, personSplit: personSplit)
    
    self.performSegue(withIdentifier: "goToResults", sender: self)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "goToResults" {
      let destinationVC = segue.destination as! ResultsViewController
      destinationVC.totalPP = calculateBrain.finalBill
      destinationVC.totalSplit = stepperValue
      destinationVC.totalTip = percentage
    }
  }
  
}

