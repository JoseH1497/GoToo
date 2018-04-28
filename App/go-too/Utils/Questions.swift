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
    fileprivate func setAnswerSize(){
        //TODO: Use question ID to get the number of answers for this question
        
        //testing:
        numOfAnswers = 4
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
        
        for i in 0..<numOfAnswers{
            switch(i){
            case 0:
                Answers[i] = "1.414"
                break
            case 1:
                Answers[i] = "4"
                break
                
            case 2:
                Answers[i] = "3.14"
                break
                
            case 3:
                Answers[i] = "oN PAGE 10"
                break
                
            default:
                break
            }
        }
        
        
        
    }
    
}
