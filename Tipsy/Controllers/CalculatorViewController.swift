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
  

  @IBAction func tipChanged(_ sender: UIButton) {
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
    let stepperValue = String(format: "%.*f", sender.value)
    splitNumberLabel.text = stepperValue
    
  }
  
  
  @IBAction func calculatePressed(_ sender: UIButton) {
    let decimal = Decimal(string: percentage) ?? 0
    print(decimal / 100)
  }
}

