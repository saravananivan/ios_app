//
//  WeatherManager.swift
//  Clima
//
//  Created by Mac on 2/20/23.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManger: WeatherManager, _ weather: WeatherModel)
    func didFailwithError(_ error: Error)
}

class WeatherManager{
    let apiKey = "7abf59d06a30d7012f4dd8df1891cf7c"
    var weatherURL = "https://api.openweathermap.org/data/2.5/weather"
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather(latitude: Double, longitude: Double) {
        let urlString = "\(weatherURL)?appid=\(apiKey)&units=metric&lat=\(latitude)&lon=\(longitude)"
        print(urlString)
        performRequest(with: urlString)
    }
    
    func fetchWeather(_ cityName: String){
        let urlString = "\(weatherURL)?appid=\(apiKey)&q=\(cityName)&units=metric"
        print(urlString)
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String){
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            //           let task = session.dataTask(with: url, completionHandler: handle(data:response:error:))
            
            let task = session.dataTask(with: url){
                (data: Data?, response: URLResponse?, error: Error? ) in
                if error != nil{
                    self.delegate?.didFailwithError(error!)
                    return
                }
                
                if let safeData = data{
                  //  let dataString = String(data: safeData, encoding: .utf8)
                    if let weather = self.parseJson(weatherData: safeData){
                        print("Delegate Called....")
                        self.delegate?.didUpdateWeather(self, weather)
                    }
                 
                }
            }
            
            task.resume()
        }
    }
    
    
    func parseJson(weatherData: Data) -> WeatherModel? {
        do{
         let result = try JSONDecoder().decode(Model.self, from: weatherData)
            let name = result.name
            let temp = result.main.temp
            let id = result.weather[0].id
            let weather = WeatherModel(cityName: name, id: id, temp: temp)
            print(weather.tempString)
            print(weather.conditonName)
            return weather
        }catch{
            self.delegate?.didFailwithError(error)
            return nil
        }
    }
    
   
    func handle(data: Data?, response: URLResponse?, error: Error? ) {
        if error != nil{
            print(error!)
            return
        }
        
        if let safeData = data{
            let dataString = String(data: safeData, encoding: .utf8)
            print(dataString!)
        }
        
    }
}
