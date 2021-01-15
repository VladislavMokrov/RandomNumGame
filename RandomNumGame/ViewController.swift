//
//  ViewController.swift
//  RandomNumGame
//
//  Created by Влад on 11/08/2020.
//  Copyright © 2020 Влад. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var num = numbers()
    var score = 1
    
    @IBOutlet var numbersOutlet: [UIButton]!
    
    struct numbers {
        var first: Int
        var second: Int
        init() {
            self.first = 0
            self.second = 0
        }
        mutating func setNum(_ score: Int) -> String {
            self.first = Int(arc4random_uniform(5)+1)
            self.second = Int(arc4random_uniform(5)+1)
            return "\(self.first) + \(self.second)"
        }
    }

    @IBOutlet weak var randomSum: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in numbersOutlet {
            i.layer.cornerRadius = 5
        }
        
        
        randomSum.text = num.setNum(score)
        
        
    }
    
    @IBOutlet weak var answer: UILabel!
    @IBAction func numAnswer(_ sender: UIButton) {
        answer.text! += (sender.titleLabel!.text!.lowercased())
    }

    @IBAction func deleteAnswer(_ sender: Any) {
        if answer.text != "" {
            answer.text?.removeLast()
        }else{
            answer.text = ""
        }
    }
    
    func title () -> String {
        if (num.first + num.second) == Int(answer.text!){
            return "Правильный ответ"
        }else{
            return "Неправильный ответ"
        }
    }
    
    func message () -> String {
        if (num.first + num.second) == Int(answer.text!){
            return "Вы угадали"
        }else{
            return "Правильный ответ \(num.first + num.second)"
        }
    }
    
    func nullify () {
        randomSum.text! = (num.setNum(score))
        answer.text = ""
    }
    
    @IBAction func showMessage(){
        let alertController = UIAlertController(
            title: "\(title())",
            message: "\(message())",
            preferredStyle: UIAlertController.Style.alert)
            // добавляем кнопки к всплывающему сообщению
        alertController.addAction(UIAlertAction(title: "Еще раз", style: UIAlertAction.Style.default, handler: {_ in (self.nullify())}))
            // вывод всплывающего окна
            self.present(alertController, animated: true, completion: nil)
    }
}
