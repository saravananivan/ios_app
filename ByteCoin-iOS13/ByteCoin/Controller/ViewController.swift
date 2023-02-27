//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var currencyValueLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    var coinManger = CoinManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        currencyLabel.text = coinManger.currencyArray[0]
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
        coinManger.delegate = self
        coinManger.getCoinPrice(for: coinManger.currencyArray[0])
    }
}

//MARK:- ViewController: UIPickerViewDataSource
extension ViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManger.currencyArray.count
    }
}

//MARK:- ViewController: UIPickerViewDelegate
extension ViewController: UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManger.currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let currency = coinManger.currencyArray[row]
        coinManger.getCoinPrice(for: currency)
        currencyLabel.text = currency
    }
}

//MARK:- ViewController: CoinManagerDelegate

extension ViewController: CoinManagerDelegate{
    func didUpdateRate(_ coinManager: CoinManager, _ coin: Coin) {
        let rate = coin.rate
        DispatchQueue.main.async {
            self.currencyValueLabel.text = String(format: "%.2f",rate)
        }
    }
    
    func didFailwithError(_ error: Error) {
        print(error)
    }
    
}
