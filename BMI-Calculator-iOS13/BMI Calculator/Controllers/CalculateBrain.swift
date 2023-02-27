//
//  CalculateBrain.swift
//  BMI Calculator
//
//  Created by Mac on 2/17/23.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import UIKit

struct CalculateBrain{
    var bmi: BMI?
    
    func getBMIValue() -> String {
        let bmiTo1DecimalPlace = String(format: "%.1f", (bmi?.value ?? 0.0))
        return bmiTo1DecimalPlace
    }
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue =  weight / (height * height)
        
        // underWeight < 18.5
        // Normal 18.5 - 24.9
        // OverWeight > 24.9
        
        if bmiValue < 18.5{
            bmi = BMI(value: bmiValue, advice: "Eat more pies", color: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))
        }else if bmiValue > 18.5 && bmiValue <= 24.9{
            bmi = BMI(value: bmiValue, advice: "Fit as fiddle", color: #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1))
        }else{
            bmi = BMI(value: bmiValue, advice: "Eat less pies", color: #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1))
        }
   }
    
    func getAdvice() -> String {
        bmi?.advice ?? "No Advice"
    }
    
    func getColor () -> UIColor {
        bmi?.color ?? #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
    
}
