//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var firstAnswerButton: UIButton!
    @IBOutlet weak var secondAnswerButton: UIButton!
    @IBOutlet weak var thirdAnswerButton: UIButton!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func answerButtonTapped(_ sender: UIButton) {
        
        let userAnswer = sender.titleLabel?.text // answer 1 / 2 / 3
        let userGotItRight = quizBrain.checkAnswer(userAnswer!)
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        quizBrain.nextQuestion()
    }
    
    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        firstAnswerButton.setTitle(quizBrain.getFirstAnswerButtonText(), for: .normal)
        secondAnswerButton.setTitle(quizBrain.getSecondAnswerButtonText(), for: .normal)
        thirdAnswerButton.setTitle(quizBrain.getThirdAnswerButtonText(), for: .normal)
        progressBar.setProgress(quizBrain.getProgress(), animated: true)
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        thirdAnswerButton.backgroundColor = UIColor.clear
        secondAnswerButton.backgroundColor = UIColor.clear
        firstAnswerButton.backgroundColor = UIColor.clear
    }
}



