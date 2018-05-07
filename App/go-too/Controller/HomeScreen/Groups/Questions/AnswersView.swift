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
    var questionID = -1
    var questionIndex = -1
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
        questionID = currentGroup.getQuestionIDFromDB(question : currentGroup.questionSelected)
        questionIndex =  currentGroup.getQuestionIndexInDB(questionID: questionID)
        print("question ID = ")
        print(questionID)
        print("question InDex = ")
        print(questionIndex)
        setQuestionText()
    //AnswerViewText.insertDictationResultPlaceholder
        answerTableView.delegate = self
        answerTableView.dataSource = self
        
    }
    
    fileprivate func setQuestionText(){
        //QuestionText.text = DATA.Questions[DATA.questionSelected].questionString
      textView.text =
        DATA.Questions[questionIndex].questionString
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DATA.Questions[questionIndex].numOfAnswers
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = answerTableView.dequeueReusableCell(withIdentifier: "AnswerCell")
        
        cell?.textLabel?.text = DATA.Questions[questionIndex].Answers[indexPath.row]
       // cell?.detailTextLabel?.text = String(currentGroup.groupMembers[indexPath.row].score)
        
        
        
        return cell!
    }
    
    @IBAction func BackToQuestionsAction(_ sender: Any) {
        self.performSegue(withIdentifier: "AnswersToQuestions", sender: self)
    }
    
    @IBAction func ToUserAnswerAction(_ sender: Any) {
        self.performSegue(withIdentifier: "CommentsToAnswer", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationViewController = segue.destination as? QuestionsViewController {
            // destinationViewController.currentGroup = self.currentGroup
            destinationViewController.currentGroup = self.currentGroup
            
        }
        
        
        if let destinationViewController = segue.destination as? UserAnswerViewController {
            // destinationViewController.currentGroup = self.currentGroup
            destinationViewController.currentGroup = self.currentGroup
            destinationViewController.questionIndex = self.questionIndex
            destinationViewController.questionID = self.questionIndex
        }    }
    
}
