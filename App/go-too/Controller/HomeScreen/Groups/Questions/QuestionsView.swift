//
//  QuestionsView.swift
//  go-too
//
//  Created by Jose Herrera on 4/27/18.
//  Copyright © 2018 Reactive Works. All rights reserved.
//

import Foundation
import UIKit


class QuestionsViewController : UIViewController{
    
    var currentGroup : Group! = Group()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("QuestionsViewController")
        print(currentGroup.getGroupID())
        print("UserrInQuestions")
        print(currentGroup.getUserID())
        
        //set Questions array so we can display info
        currentGroup.setQuestionsArray()
        
    }
    
    @IBAction func BackToCourseAction(_ sender: Any) {
        self.performSegue(withIdentifier: "QuestionsToCourse", sender: self)
    }
    
    //send data back when BackToCourseAction is pressed
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destinationViewController = segue.destination as? NextScreenController {
            destinationViewController.currentGroup = self.currentGroup
            destinationViewController.groupSelected.groupID = self.currentGroup.getGroupID()
            destinationViewController.groupSelected.userID = self.currentGroup.getUserID()
            destinationViewController.groupSelected.score =  self.currentGroup.getUserScore()
            destinationViewController.groupSelected.groupName = self.currentGroup.getGroupName()
            
        }
    }
    
}
