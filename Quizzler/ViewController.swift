//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let allQuestions = QuestionBank()
    var questionNumber : Int = -1
    var score : Int = 0
    var pickedAnswer : Bool = false
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextQuestion()
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if (sender.tag == 1) {
            pickedAnswer = true
        } else if (sender.tag == 2) {
            pickedAnswer = false
        }
        
        checkAnswer()
        nextQuestion()
    }
    
    
    func updateUI() {
        questionLabel.text = allQuestions.list[questionNumber].questionText
        scoreLabel.text = "Score: \(score)"
        progressLabel.text = "\(questionNumber+1) / 13"
        progressBar.frame.size.width = view.frame.size.width / 13 * (CGFloat)(questionNumber + 1)
    }
    

    func nextQuestion() {
        if ( questionNumber+1 < allQuestions.list.count ){
            questionNumber = questionNumber + 1
            updateUI()
        } else {
            let alert = UIAlertController(title: "Quiz Completed!",
                                          message: "Congratulations!  You've completed all of the questions in the quiz.",
                                          preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler:
                { (UIAlertAction) in
                self.startOver()
            })
            
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
            
        }
    }
    
    
    func checkAnswer() {
        if (allQuestions.list[questionNumber].answer == pickedAnswer) {
            print("You got it right!")
            score = score + 1
        } else {
            print("You got it wrong!")
        }
    }
    
    
    func startOver() {
        questionNumber = -1
        score = 0
        nextQuestion()
    }
    

    
}
