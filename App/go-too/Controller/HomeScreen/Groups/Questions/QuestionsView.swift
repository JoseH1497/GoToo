//
//  QuestionsView.swift
//  go-too
//
//  Created by Jose Herrera on 4/27/18.
//  Copyright © 2018 Reactive Works. All rights reserved.
//

import Foundation
import UIKit

class QuestionTableViewCell : UITableViewCell{
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var QuestionLabel: UILabel!
    
    @IBOutlet weak var AnswerButton: UIButton!
    @IBOutlet weak var DateLabel: UILabel!
}

class QuestionsViewController : UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    //data transferred
    var currentGroup : Group! = Group()
    
    
   
    
    @IBOutlet weak var questionsTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("QuestionsViewController")
        print(currentGroup.getGroupID())
        print("UserrInQuestions")
        print(currentGroup.getUserID())
        //
        
        //set Questions array so we can display info
       // currentGroup.setQuestionsArray()
        
        
        //setUp table
        questionsTableView.delegate = self
        questionsTableView.dataSource = self
        
        questionsTableView.separatorStyle = .none
        
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentGroup.QuestionsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = questionsTableView.dequeueReusableCell(withIdentifier: "PostCell")  as! QuestionTableViewCell
        cell.userNameLabel?.text = "Jose"
        
       // cell.UserNameLabel.text = String( currentGroup.QuestionsArray[indexPath.row].questionID)
       cell.AnswerButton?.tag = indexPath.row
      // cell.NumOfAnswersLabel?.text = String(4)
       cell.QuestionLabel.text = currentGroup.QuestionsArray[indexPath.row].question
       cell.DateLabel.text = "05/12/18"
        
        return cell
    }
    @IBAction func ToAnswersAction(_ sender: UIButton) {
        
        switch(sender.tag){
        case 0:
            print("Answer1 choosen")
            break
        case 1:
            print("Answer2 choosen")
            break
        case 2:
            print("Answer3 choosen")
            break
        case 3:
            print("Answer4 choosen")
            break
        case 4:
            print("Answer5 choosen")
            break
        case 5:
            print("Answer6 choosen")
            break
            
            
            
        default:
            break
            
            
        }
        self.performSegue(withIdentifier: "QuestionsToAnswers", sender: self)
    }
    
    @IBAction func BackToCourseAction(_ sender: Any) {
        self.performSegue(withIdentifier: "QuestionsToCourse", sender: self)
    }
    
    //send data back when BackToCourseAction is pressed
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destinationViewController = segue.destination as? NextScreenController {
           // destinationViewController.currentGroup = self.currentGroup
            destinationViewController.groupSelected.groupID = self.currentGroup.getGroupID()
            destinationViewController.groupSelected.userID = self.currentGroup.getUserID()
            destinationViewController.groupSelected.score =  self.currentGroup.getUserScore()
            destinationViewController.groupSelected.groupName = self.currentGroup.getGroupName()
            
        }
        if let destinationViewController = segue.destination as? AnswersViewController {
            // destinationViewController.currentGroup = self.currentGroup
            destinationViewController.currentGroup = self.currentGroup
            
        }
    }
    
}
