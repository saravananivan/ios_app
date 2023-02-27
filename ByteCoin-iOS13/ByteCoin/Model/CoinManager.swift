//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
    func didUpdateRate(_ coinManager: CoinManager, _ coin: Coin)
    func didFailwithError(_ error: Error)
}

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC/"
    let apiKey = "A3E3DF55-4CBB-448F-A87B-75CAAF342985"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    var delegate: CoinManagerDelegate?

    func getCoinPrice(for currency: String){
        let url = URL(string: baseURL + "\(currency)?apikey=\(apiKey)")!
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url){ data, response,error  in
            if error != nil{
                self.delegate?.didFailwithError(error!)
                return
            }

            if let safeDate = data{
                if let coin = parseJson(coinData: safeDate){
                    self.delegate?.didUpdateRate(self, coin)
                }
            }
        }
        
        task.resume()
    }
    
    func parseJson(coinData: Data) -> Coin? {
        do{
         let result = try JSONDecoder().decode(Coin.self, from: coinData)
            let rate = result.rate
            let coin = Coin(rate: rate)
            return coin
        }catch{
            self.delegate?.didFailwithError(error)
            return nil
        }
    }
}
