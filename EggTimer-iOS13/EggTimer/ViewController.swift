//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let eggTime: [String: Int] = ["Soft": 300,
        "Medium": 420,
        "Hard": 720
    ]
    
//    let eggTime: [String: Int] = ["Soft": 3,
//        "Medium": 4,
//        "Hard": 7
//    ]
    
    var counter = 0
    var totalTime = 0
    
    var player: AVAudioPlayer?
    var timer: Timer = Timer()
   
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var progressbar: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        progressbar.isHidden = true
    }
    
    @IBAction func hardnessSelection(_ sender: UIButton) {
        progressbar.isHidden = false
//        print(progressbar.isHidden)
        
        let hardness = sender.currentTitle!
        
        counter = 0
        progressbar.progress = 0
        titleLabel.text = hardness
        totalTime = eggTime[hardness]!
        
        timer.invalidate()
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        
        
        
        
                
//        switch hardness {
//        case "Soft":
//            print(eggTime["Soft"]!)
//        case "Medium":
//            print(eggTime["Medium"]!)
//        case "Hard":
//            print(eggTime["Hard"]!)
//        default:
//            print("There is not suitable hardness")
//        }
    }
    
    @objc func updateCounter() {
        //example functionality
        if counter < totalTime {
            //print(counter)
            counter += 1
            progressbar.progress = Float(counter)/Float(totalTime)
        }else{
            timer.invalidate()
            titleLabel.text = "Done!"
           // sender.alpha = 0.5
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player?.play()
            
            //Code should execute after 0.2 second delay.
             DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                 //Bring's sender's opacity back up to fully opaque.
               //  sender.alpha = 1.0
             }
            progressbar.isHidden = true
        }
    }
}
