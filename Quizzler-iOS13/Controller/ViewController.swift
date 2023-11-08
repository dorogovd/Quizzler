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
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func answerButtonTapped(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle // True, False
        quizBrain.checkAnswer(userAnswer!)
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
        if quizBrain.checkAnswer(userAnswer!) {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        if quizBrain.questionNumber != quizBrain.quiz.endIndex-1 {
            quizBrain.questionNumber += 1
        } else {
            quizBrain.questionNumber = 0
        }
    }
    
    @objc func updateUI() {
        questionLabel.text = quizBrain.quiz[quizBrain.questionNumber].text
        falseButton.backgroundColor = UIColor.clear
        trueButton.backgroundColor = UIColor.clear
        progressBar.setProgress(Float(quizBrain.questionNumber + 1) / Float(quizBrain.quiz.count), animated: true)
        //   progressBar.progress = Float(questionNumber + 1) / Float(quiz.count) - Angela's solution
    }
}



