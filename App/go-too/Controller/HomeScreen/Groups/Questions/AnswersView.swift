//
//  AnswersView.swift
//  go-too
//
//  Created by Jose Herrera on 4/27/18.
//  Copyright © 2018 Reactive Works. All rights reserved.
//

import Foundation
import UIKit

class AnswersViewController : UIViewController{
    
    //data transferred
    var currentGroup: Group! = Group()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("USERID in Answers")
        print(currentGroup.getUserID())
        print("GroupID in Answers")
        print(currentGroup.getGroupID())
        print("What")
    }
    
    
    @IBAction func BackToQuestionsAction(_ sender: Any) {
        self.performSegue(withIdentifier: "AnswersToQuestions", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationViewController = segue.destination as? QuestionsViewController {
            // destinationViewController.currentGroup = self.currentGroup
            destinationViewController.currentGroup = self.currentGroup
            
        }
    }
    
}
