//
//  AnswersView.swift
//  go-too
//
//  Created by Jose Herrera on 4/27/18.
//  Copyright © 2018 Reactive Works. All rights reserved.
//

import Foundation
import UIKit

class AnswersViewController : UIViewController, UITableViewDelegate, UITableViewDataSource{
   
    
    //data transferred
    var currentGroup: Group! = Group()
    
    @IBOutlet weak var userAnswer: UITextField!
    
    @IBOutlet weak var AnswerViewText: UITextView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var answerTableView: UITableView!
    @IBOutlet weak var QuestionText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("USERID in Answers")
        print(currentGroup.getUserID())
        print("GroupID in Answers")
        print(currentGroup.getGroupID())
        
        setQuestionText()
        AnswerViewText.insertDictationResultPlaceholder
        answerTableView.delegate = self
        answerTableView.dataSource = self
        
    }
    fileprivate func setQuestionText(){
        //QuestionText.text = DATA.Questions[DATA.questionSelected].questionString
      textView.text =
        DATA.Questions[DATA.questionSelected].questionString
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DATA.Questions[DATA.questionSelected].numOfAnswers
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = answerTableView.dequeueReusableCell(withIdentifier: "AnswerCell")
        
        cell?.textLabel?.text = DATA.Questions[DATA.questionSelected].Answers[indexPath.row]
       // cell?.detailTextLabel?.text = String(currentGroup.groupMembers[indexPath.row].score)
        
        
        
        return cell!
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
