//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain()
     
    @IBOutlet weak var progressBar: UIProgressView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }
    
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let isUserGotRight = quizBrain.checkAnswer(sender.currentTitle!)
        sender.backgroundColor = isUserGotRight ? UIColor.green : UIColor.red
       
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo:nil, repeats: false)
    }
    
  @objc func updateUI(){
    questionLabel.text = quizBrain.getQuestionText()
    trueButton.backgroundColor = UIColor.clear
    falseButton.backgroundColor = UIColor.clear
    progressBar.progress = quizBrain.getProgress()
    scoreLabel.text = "score: \(quizBrain.getScore())"
    }
}


