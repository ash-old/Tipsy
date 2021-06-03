//
//  CalculateBrain.swift
//  Tipsy
//
//  Created by Ash Oldham on 01/06/2021.
//

import UIKit

struct CalculateBrain {
  
  var billAmount: String?
  var tipPercentage: String?
  var personSplit: Int?
  var finalBill: String?
  
  mutating func calculateBill(billAmount: String, tipPercentage: String, personSplit: Int) {
    
    let billTotal = Double(billAmount) ?? 0.00
    
    let removePct = tipPercentage.replacingOccurrences(of: "%", with: "")
    let percent = Decimal(string: removePct) ?? 0
    let decimalPercentage = percent / 100
    
    let split = Double(personSplit)
    
    let PctResult = billTotal * Double(truncating: decimalPercentage as NSNumber)
    let result = (PctResult + billTotal) / split
    
    finalBill = String(format: "%.2f", result)
    
  }
  
}
