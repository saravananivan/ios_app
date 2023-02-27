//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var heightUISlider: UISlider!
    @IBOutlet weak var weightUISlider: UISlider!
    
    @IBOutlet weak var heightUILabel: UILabel!
    @IBOutlet weak var weightUILabel: UILabel!
    
    
    var calculatedBrain = CalculateBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func heightSliderAction(_ sender: UISlider) {
        heightUILabel.text = String(format: "%.1fm", sender.value)
    }
    
    
    @IBAction func weightSlider(_ sender: UISlider) {
        weightUILabel.text = String("\(Int(sender.value))Kg")//String(format:"%.0fKg" ,sender.value)
    }
    
    @IBAction func calculateAction(_ sender: UIButton) {
        let height = heightUISlider.value
        let weight = weightUISlider.value
        
        calculatedBrain.calculateBMI(height: height, weight: weight)
        
        self.performSegue(withIdentifier: "goToResult" , sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! ResultViewController
        
            destinationVC.bmi = String(format: "%.1f", calculatedBrain.bmi!.value)
            destinationVC.advice = calculatedBrain.getAdvice()
            destinationVC.color = calculatedBrain.getColor()
        }
    }
}

