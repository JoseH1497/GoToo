//
//  QuestionsView.swift
//  go-too
//
//  Created by Jose Herrera on 4/27/18.
//  Copyright © 2018 Reactive Works. All rights reserved.
//

import Foundation
import UIKit


class QuestionsViewController : UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
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
        currentGroup.setQuestionsArray()
        
        
        //setUp table
        questionsTableView.delegate = self
        questionsTableView.dataSource = self
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentGroup.QuestionsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = questionsTableView.dequeueReusableCell(withIdentifier: "basicCell")
        cell?.textLabel?.text = currentGroup.QuestionsArray[indexPath.row].question
        
        return cell!
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
    }
    
}
