//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by Mac on 2/17/23.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var bmi: String?
    var advice: String?
    var color: UIColor?
    @IBOutlet weak var imgBackground: UIImageView!
    
    @IBOutlet weak var bmiValue: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bmiValue?.text = bmi
        imgBackground.backgroundColor = color!
        adviceLabel.text = advice!
        
        // Do any additional setup after loading the view.
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
