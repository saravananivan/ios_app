//
//  Model.swift
//  Clima
//
//  Created by Mac on 2/20/23.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation

struct Model: Codable{
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable{
   var temp: Double
}

struct Weather: Codable{
    var id: Int
}
