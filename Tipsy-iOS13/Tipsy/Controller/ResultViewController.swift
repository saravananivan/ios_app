//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Mac on 2/17/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var perPersonBillValue = 0.0
    var numberPeople: Int?
    var tipPercentage: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = String(format: "%.2f", perPersonBillValue)
        settingsLabel.text = "Split between \(numberPeople!) people, with \(Int(tipPercentage! * 100))% tip."
        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func reCalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
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
