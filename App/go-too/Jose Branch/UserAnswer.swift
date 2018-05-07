//
//  UserAnswer.swift
//  go-too
//
//  Created by Jose Herrera on 5/7/18.
//  Copyright © 2018 Reactive Works. All rights reserved.
//

import Foundation
import UIKit

class UserAnswerViewController : UIViewController{
    var currentGroup : Group! = Group()
    var questionID : Int!
    var questionIndex : Int!
    
    
    @IBOutlet weak var AnswerText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    @IBOutlet weak var egrsth: UIButton!
    
    
    @IBAction func UserAction(_ sender: Any) {
        if(AnswerText.text != ""){
            currentGroup.addAnswer(questionID: self.questionID, questionIndex: self.questionIndex, answerString: AnswerText.text!)
            self.performSegue(withIdentifier: "AnswerToComments", sender: self)
        }
        
    }
    @IBOutlet weak var UserAnswerAction: UIButton!
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationViewController = segue.destination as? AnswersViewController {
            // destinationViewController.currentGroup = self.currentGroup
            destinationViewController.currentGroup = self.currentGroup
            
        }
    }
    
}
