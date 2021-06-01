//
//  CalculateBrain.swift
//  Tipsy
//
//  Created by Ash Oldham on 01/06/2021.
//

import UIKit

struct CalculateBrain {
  
  var billText: String?
  var tipPercentage: String?
  var personSplitValue: String?
  var finalBill: String?
  
  mutating func calculateBill(billAmount: String, tipPercentage: String, personSplit: String) {
    
//    let billTotal = Double(billTextField.text!) ?? 0
//    
//    let removePct = percentage.replacingOccurrences(of: "%", with: "")
//    let percent = Decimal(string: removePct) ?? 0
//    let decimalPercentage = percent / 100
//    
//    let split = Int(stepperValue) ?? 2
//    
//    let PctResult = billTotal * Double(truncating: decimalPercentage as NSNumber)
//    let result = (PctResult + billTotal) / Double(split)
//    
//    finalBill = String(format: "%.2f", result)
    
    let billTotal = Double(billText ?? "") ?? 0
    
    let removePct = tipPercentage.replacingOccurrences(of: "%", with: "")
    let percent = Decimal(string: removePct) ?? 0
    let decimalPercentage = percent / 100
    
    let split = Int(personSplitValue ?? "") ?? 2
    
    let PctResult = billTotal * Double(truncating: decimalPercentage as NSNumber)
    let result = (PctResult + billTotal) / Double(split)
    
    finalBill = String(format: "%.2f", result)
    
  }
  
  
}
