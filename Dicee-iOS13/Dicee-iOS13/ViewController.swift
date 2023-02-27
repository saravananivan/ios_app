//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var diceImageViewOne: UIImageView!
    @IBOutlet weak var diceImageViewTwo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       rollDice()
    }

    @IBAction func rollButtonPresed(_ sender: UIButton) {
        rollDice()
    }
    
    func rollDice(){
        let diceArrayUIImage: [UIImage] = [#imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceFive")]
        //Using Random Element in a Array
        diceImageViewOne.image = diceArrayUIImage.randomElement()
        diceImageViewTwo.image = diceArrayUIImage.randomElement()

        //Using Random number
       // diceImageViewOne.image = diceArrayUIImage[createRandomNum()]
       // diceImageViewTwo.image = diceArrayUIImage[createRandomNum()]
    }
    
    func createRandomNum() -> Int{
        Int.random(in: 0...5)
    }
    
}

