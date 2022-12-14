//
//  MainVc.swift
//  imtihon
//
//  Created by Abduraxmon on 28/10/22.
//

import UIKit

class MainVc: UIViewController {
    
    @IBOutlet var lblcollection: [UILabel]!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblborder()

    }

    
    @IBAction func playButtonPressed(_ sender: Any) {
        let vc =  SecondVc(nibName: "SecondVc", bundle: nil)
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated:  true)
    }
    
    func lblborder() {
        
    }
    

}
