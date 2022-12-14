//
//  QuizBrain.swift
//  imtihon
//
//  Created by Abduraxmon on 29/10/22.
//

import Foundation
import UIKit

struct QuizBrain {
    
    var quiz = [
    Questions(number1: 1, number2: 5, answer: 6),
    Questions(number1: 2, number2: 5, answer: 7),
    Questions(number1: 3, number2: 4, answer: 7),
    Questions(number1: 1, number2: 4, answer: 5),
    Questions(number1: 3, number2: 2, answer: 5),
    Questions(number1: 5, number2: 2, answer: 7),
    Questions(number1: 4, number2: 5, answer: 9),
    Questions(number1: 1, number2: 5, answer: 6),
    Questions(number1: 2, number2: 1, answer: 3),
    Questions(number1: 5, number2: 2, answer: 7),
    Questions(number1: 5, number2: 2, answer: 7)
    ]
    
    var turn = 0
    var notHide1 = 0
    var notHide2 = 0
    var answer = 0
    var sum = 0
    
    
    mutating func update(_ stackview1: UIStackView, _ stackView2: UIStackView) {
    // tekshirish neshta yashirilganligini. Ishlayapti
        for i in 0...4 {
            if stackview1.arrangedSubviews[i].isHidden == false {
                notHide1 += 1
            }
            if stackView2.arrangedSubviews[i].isHidden == false {
                notHide2 += 1
            }
        }
    // birinchi raqam kichkina bo'lsa. Ishlayapti// xato
        if notHide1 < quiz[turn].number1 {
            for i in 0...4 {
                if stackview1.arrangedSubviews[i].isHidden == true && quiz[turn].number1 != notHide1 {
                    notHide1 += 1
                    stackview1.arrangedSubviews[i].isHidden = false
                }
            }
        }
    // birinchi raqam kattaligini tekshirish. Ishlayapti
       else if notHide1 > quiz[turn].number1 {
            for i in 0...4 {
                if stackview1.arrangedSubviews[i].isHidden == false && quiz[turn].number1 != notHide1 {
                    stackview1.arrangedSubviews[i].isHidden = true
                    notHide1 -= 1
                }
            }
        }
    // ikkinchi son kickina.
        if notHide2 < quiz[turn].number2 {
            for i in 0...4 {
                if stackView2.arrangedSubviews[i].isHidden == true && quiz[turn].number2 != notHide2 {
                    stackView2.arrangedSubviews[i].isHidden = false
                    notHide2 += 1
                }
            }
        }
    // ikinchi son katta.
        else if notHide2 > quiz[turn].number2 {
            for i in 0...4 {
                if stackView2.arrangedSubviews[i].isHidden == false && quiz[turn].number2 != notHide2 {
                    stackView2.arrangedSubviews[i].isHidden = true
                    notHide2 -= 1
                }
            }
        }
        answer = notHide1 + notHide2
    }
    
    func unEnabled(_ collectionOfBtns: [UIButton] ) {
        for i in 0...3 {
            collectionOfBtns[i].isEnabled = false
        }
    }
    
    func enabled(_ collectionOfBtns: [UIButton]){
        for i in 0...3 {
            collectionOfBtns[i].isEnabled = true
            collectionOfBtns[i].setTitleColor(.white, for: .normal)
        }
    }
    
    mutating func choices(_ buttons: [UIButton]){
                if turn == 0 || turn == 9 || turn == 6 {
            buttons[0].setTitle( "\(answer)", for: .normal)
            buttons[1].setTitle( "\(answer + 1)", for: .normal)
            buttons[2].setTitle( "\(answer + 2)", for: .normal)
            buttons[3].setTitle( "\(answer + 3)", for: .normal)
        } else if turn == 1 || turn == 8 || turn == 4 {
            buttons[1].setTitle( "\(answer)", for: .normal)
            buttons[0].setTitle( "\(answer + 1)", for: .normal)
            buttons[2].setTitle( "\(answer + 2)", for: .normal)
            buttons[3].setTitle( "\(answer + 3)", for: .normal)
        } else if turn == 2 || turn == 7 {
            buttons[2].setTitle( "\(answer)", for: .normal)
            buttons[0].setTitle( "\(answer + 1)", for: .normal)
            buttons[1].setTitle( "\(answer + 2)", for: .normal)
            buttons[3].setTitle( "\(answer + 3)", for: .normal)
        } else if turn == 3 || turn == 5 {
            buttons[3].setTitle( "\(answer)", for: .normal)
            buttons[0].setTitle( "\(answer + 1)", for: .normal)
            buttons[1].setTitle( "\(answer + 2)", for: .normal)
            buttons[2].setTitle( "\(answer + 3)", for: .normal)
        } else {
            buttons[3].setTitle( "\(answer)", for: .normal)
            buttons[0].setTitle( "\(answer + 1)", for: .normal)
            buttons[1].setTitle( "\(answer + 2)", for: .normal)
            buttons[2].setTitle( "\(answer + 3)", for: .normal)
        }
    }
    mutating func trueOrFalse(_ sender: UIButton) {
        if sender.titleLabel!.text! == "\(answer)" {
            sender.setTitleColor(.green, for: .normal)
            sum += 1
        } else {
            sender.setTitleColor(.systemPink, for: .normal)
        }
    }
    
    mutating func finished(_ view1: UIView, _ view2: UIView) {
        if turn == 10 {
            view1.isHidden = false
            view2.isHidden = false
            notHide2 = 0
            notHide2 = 0
        }
    }
    
    func result(_ lbl: UILabel) {
        lbl.text = "\(sum)"
    }
    
}
