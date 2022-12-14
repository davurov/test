//
//  SecondVc.swift
//  imtihon
//
//  Created by Abduraxmon on 28/10/22.
//

import UIKit

class SecondVc: UIViewController {
    @IBOutlet weak var stackview1: UIStackView!
    
    @IBOutlet weak var stackView2: UIStackView!
    @IBOutlet var collectionOfBtns: [UIButton]!
    
    @IBOutlet weak var scoreLbl: UILabel!
    
    @IBOutlet weak var finalView: UIView!
    
    @IBOutlet weak var pictureFrame: UIView!
    
    var quizBrain = QuizBrain()
    
    var isEnabled = false
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        quizBrain.update(stackview1, stackView2)
    }
    
    @IBAction func NextPressed(_ sender: UIButton) {
        
        quizBrain.notHide1 = 0
        quizBrain.notHide2 = 0
        quizBrain.update(stackview1, stackView2)
        quizBrain.turn += 1
        quizBrain.enabled(collectionOfBtns)
        quizBrain.choices(collectionOfBtns)
        quizBrain.finished(finalView, pictureFrame)
        quizBrain.result(scoreLbl)
    }
    
    @IBAction func buttonsPressed(_ sender: UIButton) {
        quizBrain.trueOrFalse(sender)
        quizBrain.unEnabled(collectionOfBtns)
        
    }
    
    @IBAction func homeButton(_ sender: Any) {
        quizBrain.quiz.shuffle()
        quizBrain.notHide1 = 0
        quizBrain.notHide2 = 0
        quizBrain.turn = 0
        self.dismiss(animated: true)
    }
    
    @IBAction func restartButton(_ sender: Any) {
        pictureFrame.isHidden = true
        finalView.isHidden = true
        quizBrain.turn = 0
        
        quizBrain.quiz.shuffle()
        
    }
    
}
