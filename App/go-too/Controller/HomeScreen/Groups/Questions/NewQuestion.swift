//
//  NewQuestion.swift
//  go-too
//
//  Created by Jose Herrera on 5/6/18.
//  Copyright © 2018 Reactive Works. All rights reserved.
//

import Foundation
import UIKit


class newQuestionsViewController : UIViewController{
    
    @IBOutlet weak var questionTextField: UITextField!
    var currentGroup: Group! = Group()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
    }
    
    @IBOutlet weak var QuestionSubmitAction: UIButton!
    @IBAction func newQuestionAction(_ sender: Any) {
        if(questionTextField.text != ""){
            
            currentGroup.addQuestion(groupID: currentGroup.getGroupID(), question: questionTextField.text!, name: currentGroup.getMemberName(userId: currentGroup.userID, groupID: currentGroup.groupID))
            self.performSegue(withIdentifier: "newQtoNews", sender: self)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationViewController = segue.destination as? QuestionsViewController {
            // destinationViewController.currentGroup = self.currentGroup
            destinationViewController.currentGroup = self.currentGroup
        
        }
    }
}
