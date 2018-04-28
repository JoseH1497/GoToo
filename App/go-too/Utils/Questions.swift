//
//  Questions.swift
//  go-too
//
//  Created by Jose Herrera on 4/27/18.
//  Copyright © 2018 Reactive Works. All rights reserved.
//

import Foundation
import UIKit

//takes care of questions functionality, relevant data transferred from Groups to Questions
class Questions{
    var questionID: Int
    var question: String
    var Answers = [String]()
    var numOfAnswers: Int
    var flag: Int
    
    init(){
        questionID = -1
        question = ""
        numOfAnswers = 0
        flag = 0
    }
    func setAnswerSize(){
        //TODO: Use question ID to get the number of answers for this question
        
        //testing:
        numOfAnswers = 0
    }
    func setAnswersArray(){
        
        //set Answers
        self.setAnswerSize()
        
        //allocate space for numOfQuestions
        for i in 0..<numOfAnswers{
            var alloc: String = ""
            Answers.append(alloc)
        }
        
        
        /**
         TODO: Get answers for this question ID and put into Answers Array so we could display them
         for i in 0..<numOfAnswers{
         
            Answers[i] = answer from database
         
         }
        **/
        
        
        
    }
    
}
