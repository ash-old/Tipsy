//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Ash Oldham on 31/05/2021.
//

import UIKit

class ResultsViewController: UIViewController {
  
  var totalPP: String?
  var totalSplit: Int?
  var totalTip: String?
  

  @IBOutlet weak var totalLabel: UILabel!
  @IBOutlet weak var settingsLabel: UILabel!
  
  
  override func viewDidLoad() {
        super.viewDidLoad()
    
    totalLabel.text = totalPP
    settingsLabel.text = "Bill split between \(totalSplit ?? 2) people, with a \(totalTip ?? "0") tip."
       
    }
    
  @IBAction func recalculatePressed(_ sender: UIButton) {
    self.dismiss(animated: true, completion: nil)
  }
  
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
