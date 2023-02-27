//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var navigationUIButton: UIButton!
    
    var weatherManager = WeatherManager()
    let locationManager = CLLocationManager()
    let clLocation = [CLLocation()]
    
    @IBAction func navigationButtonAction(_ sender: UIButton) {
        locationManager.requestLocation()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        locationManager.delegate = self
        weatherManager.delegate = self
        searchTextField.delegate = self
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
    }
}

//MARK:- UITextFieldDelegate

extension WeatherViewController: UITextFieldDelegate{
    @IBAction func searchPressed(_ sender: Any) {
//        if searchTextField.text == ""{
//            searchTextField.placeholder = "Type some thing here!"
//        }else{
            searchTextField.endEditing(true)
            print(searchTextField.text!)
        //}
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(searchTextField.text!)
        searchTextField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != ""{
            return true
        }else{
            searchTextField.placeholder = "Type some thing here!"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
      if  let cityName = searchTextField.text{
            weatherManager.fetchWeather(cityName)
      }
        searchTextField.text = ""
    }
}

//MARK:- WeatherManagerDelegate

extension WeatherViewController: WeatherManagerDelegate{
    func didUpdateWeather(_ weatherManger: WeatherManager, _ weather: WeatherModel){
        print("waether temp: \(weather.tempString)")
        DispatchQueue.main.async {
            self.temperatureLabel.text = weather.tempString
            self.cityLabel.text = weather.cityName
            self.conditionImageView.image = UIImage(systemName: weather.conditonName)
        }
    }
    
    func didFailwithError(_ error: Error){
        print(error)
    }
}

//MARK:- LocationManagerDelegate

extension WeatherViewController: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager,
                         didUpdateLocations locations: [CLLocation]){
        if let location = locations.last{
            locationManager.stopUpdatingLocation()
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            
            weatherManager.fetchWeather(latitude: lat, longitude: lon)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}
