//
//  WeatherModel.swift
//  Clima
//
//  Created by Mac on 2/20/23.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel{
    let cityName: String
    let id: Int
    let temp: Double
    var tempString: String{
      String(format: "%.1f", temp)
    }
    var conditonName: String{
        getConditionName(id)
    }
    
    func getConditionName(_ weatherId: Int) -> String{
        
        switch weatherId {
                case 200...232:
                    return "cloud.bolt"
                case 300...321:
                    return "cloud.drizzle"
                case 500...531:
                    return "cloud.rain"
                case 600...622:
                    return "cloud.snow"
                case 701...781:
                    return "cloud.fog"
                case 800:
                    return "sun.max"
                case 801...804:
                    return "cloud.bolt"
                default:
                    return "cloud"
        }
    }
}
