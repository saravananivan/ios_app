//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    
    var tip = 0.1
    var billValue : Double = 0.0

    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        if sender.currentTitle == "0%" {
            zeroPctButton.isSelected = true
            twentyPctButton.isSelected = false
            tenPctButton.isSelected = false
            tip = 0
        }else if sender.currentTitle == "10%"{
            tenPctButton.isSelected = true
            zeroPctButton.isSelected = false
            twentyPctButton.isSelected = false
            tip = 0.1
        }else{
            twentyPctButton.isSelected = true
            tenPctButton.isSelected = false
            zeroPctButton.isSelected = false
            tip = 0.2
        }
        
    }
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper){
        splitNumberLabel.text = String(Int(sender.value))
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let billText = billTextField?.text ?? "0.0"
        
        if let bill  = Double(billText) {
            billValue =  (bill + (bill * tip)) / Double(splitNumberLabel?.text ?? "2")!
            self.performSegue(withIdentifier: "resultViewIdentifier" , sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destinationVC = segue.destination as! ResultViewController
        
        destinationVC.perPersonBillValue = billValue
        destinationVC.numberPeople = Int(splitNumberLabel?.text ?? "2")
        destinationVC.tipPercentage = tip
        
    }
}

