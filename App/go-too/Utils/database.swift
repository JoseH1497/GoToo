//
//  database.swift
//  go-too
//
//  Created by Jose Herrera on 4/28/18.
//  Copyright © 2018 Reactive Works. All rights reserved.
//

/**
 Keep track of title and group ids
 
 groupID:           Class Title
 0                  CSE 120 kar j
 1                  CSE 65 kar j
 2                  CSE 150 j
 3                  CSE 175 j
 4                  ENGR 45 j
 5                  CSE 21 j
 6                  Writing 101 kar
 
 
 
 **/
import Foundation
import UIKit


class User{
    var UserID: Int
    var email: String
    var password: String
    var name: String
    var groups = [GroupTable]()
    var numOfGroups: Int
    var isOnline: Bool
    
    init(){
        UserID = -1
        email = ""
        password = ""
        name = ""
        numOfGroups = 0
        isOnline = false
    }
    
    func setnumOfGroups(num: Int){
        numOfGroups = num
        
    }
    func allocGroups(){
        for i in 0..<numOfGroups{
            var alloc = GroupTable()
            groups.append(alloc)
        }
    }
    func getNumOfGroups()-> Int{
        return numOfGroups
    }
    
    
    
}
class GroupsInDB{
    var groupSize: Int
    var groupMembers = [String]()
    
    init(){
        groupSize = 0
    }
    
    
    func setGroupSize(size: Int){
        self.groupSize = size
        allocGroupMembers()
    }
    func getGroupSize()->Int{
        return groupSize
    }
    func allocGroupMembers(){
        for i in 0..<groupSize{
            groupMembers.append("")
        }
    }
    func getGroupMembers() -> Array<String>{
        return groupMembers
    }
}

class questionsDB{
    var questionID: Int
    var groupID: Int
    var numOfAnswers:Int
    var Answers = [String]()
    var questionString: String
    var date: String
    var name: String
    
    init(){
        questionID = -1
        groupID = -1
        numOfAnswers = 0
        questionString = ""
        date = ""
        name = ""
    }
    init(questionID: Int, groupID: Int, numOfAnswers: Int, Answers: Array<String>, questionString: String, date: String, name: String){
        self.questionID = questionID
        self.groupID = groupID
        self.numOfAnswers = numOfAnswers
        self.questionString = questionString
        self.date = date
        self.name = name
        self.Answers = Answers
    }
}
class Database{
    var Users = [User]()
    var Groups = [GroupsInDB]()
    var Questions = [questionsDB]()
    var userCount:Int
    var groupCount: Int
    var questionSelected: Int
    var onlineSize: Int
    init(){
        onlineSize = 0
        userCount = 2
        groupCount = 7//current group count
        questionSelected = -1
        setUsers()
        setGroups()
        setOnline()
        setQuestions()
        
    }
    func setUsers(){
        for i in 0..<userCount{
            var alloc = User()
            Users.append(alloc)
        }
        for i in 0..<userCount{
            switch(i){
            case 0:
                Users[i].UserID = i
                Users[i].email = "jherrera@ucmerced.edu"
                Users[i].name = "Jose Herrera"
                Users[i].password = "jose.51013"
                Users[i].isOnline = true
                Users[i].setnumOfGroups(num: 6)
                Users[i].allocGroups()
                //set group ids and titles
                Users[i].groups[0].groupID = 0
                Users[i].groups[0].groupName = "CSE 120"
                
                Users[i].groups[1].groupID = 1
                Users[i].groups[1].groupName = "CSE 65"
                
                Users[i].groups[2].groupID = 2
                Users[i].groups[2].groupName = "CSE 150"
                
                Users[i].groups[3].groupID = 3
                Users[i].groups[3].groupName = "CSE 175"
                
                Users[i].groups[4].groupID = 4
                Users[i].groups[4].groupName = "Engr 45"
                
                Users[i].groups[5].groupID = 5
                Users[i].groups[5].groupName = "CSE 21"
                break
            case 1:
                Users[i].UserID = i
                Users[i].email = "kherrera@ucmerced.edu"
                Users[i].name = "Karina Herrera"
                Users[i].password = "abc123"
                Users[i].isOnline = true
                Users[i].setnumOfGroups(num: 3)
                Users[i].allocGroups()
                
                //set group ids and titles
                Users[i].groups[0].groupID = 0
                Users[i].groups[0].groupName = "CSE 120"
                
                Users[i].groups[1].groupID = 1
                Users[i].groups[1].groupName = "CSE 65"
                
                Users[i].groups[2].groupID = 6
                Users[i].groups[2].groupName = "Writing 101"
                
                break
            default:
                break
            }
        }
    }
    
    func setQuestionSelected(selected: Int){
        questionSelected = selected
        
    }
    func findUser(email: String, passWord: String)-> Int{
        var userID: Int = -1
        for i in 0..<userCount{
            if(Users[i].email == email){
                if(Users[i].password == passWord){
                    userID = Users[i].UserID
                }
            }
        }
        return userID
    }
    func getGroupMembers(groupID: Int)-> Array<String>{
        return Groups[groupID].getGroupMembers()
        
        
    }
    func setGroups(){
        
        for i in 0..<groupCount{
            var alloc = GroupsInDB()
            Groups.append(alloc)
        }
        
        for i in 0..<groupCount{
            switch(i){
            case 0:
                Groups[i].setGroupSize(size: 6)
                
                //set Members
                
                Groups[i].groupMembers[0] = "Jose Herrera"
                Groups[i].groupMembers[1] = "Karina Herrera"
                Groups[i].groupMembers[2] = "Sergio Rosendo"
                Groups[i].groupMembers[3] = "Hunter Brown"
                Groups[i].groupMembers[4] = "Jovon Johnson"
                Groups[i].groupMembers[5] = "Li Deng"
                break
            case 1:
                Groups[i].setGroupSize(size: 4)
                Groups[i].groupMembers[0] = "Jose Herrera"
                Groups[i].groupMembers[1] = "Karina Herrera"
                Groups[i].groupMembers[2] = "Sergio Rosendo"
                Groups[i].groupMembers[3] = "Hunter Brown"
                break
            case 2:
                Groups[i].setGroupSize(size: 5)
                Groups[i].groupMembers[0] = "Jose Herrera"
                Groups[i].groupMembers[1] = "Karina Herrera"
                Groups[i].groupMembers[2] = "Michael Taylor"
                Groups[i].groupMembers[3] = "Rita Brown"
                Groups[i].groupMembers[4] = "Jovon Johnson"
                break
                
            case 3:
                Groups[i].setGroupSize(size: 5)
                Groups[i].groupMembers[0] = "Jose Herrera"
                Groups[i].groupMembers[1] = "Karina Herrera"
                Groups[i].groupMembers[2] = "Michael Taylor"
                Groups[i].groupMembers[3] = "Rita Brown"
                Groups[i].groupMembers[4] = "Jovon Johnson"
                break
                
            case 4:
                Groups[i].setGroupSize(size: 7)
                Groups[i].groupMembers[0] = "Jose Herrera"
                Groups[i].groupMembers[1] = "Karina Herrera"
                Groups[i].groupMembers[2] = "Sergio Rosendo"
                Groups[i].groupMembers[3] = "Hunter Brown"
                Groups[i].groupMembers[4] = "Jovon Johnson"
                Groups[i].groupMembers[5] = "Li Deng"
                Groups[i].groupMembers[6] = "Bill Johnson"
                
                break
                
            case 5:
                Groups[i].setGroupSize(size: 8)
                Groups[i].groupMembers[0] = "Jose Herrera"
                Groups[i].groupMembers[1] = "Karina Herrera"
                Groups[i].groupMembers[2] = "Sergio Rosendo"
                Groups[i].groupMembers[3] = "Hunter Brown"
                Groups[i].groupMembers[4] = "Jovon Johnson"
                Groups[i].groupMembers[5] = "Soren Bolt"
                Groups[i].groupMembers[6] = "Bill Johnson"
                Groups[i].groupMembers[7] = "Jerry Richards"
                
                break
                
            case 6:
                Groups[i].setGroupSize(size: 2)
                Groups[i].groupMembers[0] = "Karina Herrera"
                Groups[i].groupMembers[1] = "Jerry Richards"
                break
                
                
            default:
                break
            }
        }
    }
    func setOnline(){
        for i in 0..<userCount{
            if(Users[i].isOnline == true){
                self.onlineSize = self.onlineSize + 1
            }
        }
    }
    func getOnlineSize()->Int{
        return onlineSize
    }
    func setQuestions(){
        var answers = [String]()
        answers.append("In COB 132")
        answers.append("Always in COB 132!")
        answers.append("Go Now! Professor is there!")
        //Q1
        Questions.append(questionsDB(questionID: 0, groupID: 0, numOfAnswers: 3, Answers: answers, questionString:"Where is the professors Room?", date: "04/28/2018", name: "Jose Herrera"))
        answers[0] = "Yes!, meet me in COB2!"
        answers[1] = "I am also in COB2"
        
        //Q2
        Questions.append(questionsDB(questionID: 1, groupID: 0, numOfAnswers: 2, Answers: answers, questionString:"Can anyone help me with problem 3 for homework?", date: "04/28/2018", name: "Jovon Johnson"))
        
        //Q3
        answers[0] = "It is about 3.14"
        Questions.append(questionsDB(questionID: 2, groupID: 0, numOfAnswers: 1, Answers: answers, questionString:"How can we calculate Pi?", date: "04/27/2018", name: "Karina Herrera"))
        //Q4
        answers[0] = "I found this very useful link, I will send it to you later!"
        answers[1] = "We are having a tutoring session for UML's in S&E2 321, come by!"
        answers[2] = "Come to lecture tomorrow, this will be the topic!"
         Questions.append(questionsDB(questionID: 3, groupID: 0, numOfAnswers: 3, Answers: answers, questionString:"Does anyone know the best method to create UML's?", date: "04/27/2018", name: "Hunter Brown"))
        //Q5
        answers[0] = "Yes, I will private message you"
        Questions.append(questionsDB(questionID: 4, groupID: 0, numOfAnswers: 1, Answers: answers, questionString:"Can someone help me calculate the radius of a circle?", date: "04/26/2018", name: "Jovon Johnson"))
        
        
        //Q6
        answers[0] = "I found this very useful link, I will send it to you later!"
        answers[1] = "We are having a tutoring session for UML's in S&E2 321, come by!"
        answers[2] = "Come to lecture tomorrow, this will be the topic!"
        Questions.append(questionsDB(questionID: 3, groupID: 1, numOfAnswers: 3, Answers: answers, questionString:"Does anyone know the best method to create UML's?", date: "04/27/2018", name: "Jose Herrera"))
        //Q7
        answers[0] = "Yes, I will private message you"
        Questions.append(questionsDB(questionID: 4, groupID: 1, numOfAnswers: 1, Answers: answers, questionString:"Can someone help me calculate the area of a square?", date: "04/26/2018", name: "Jovon Johnson"))
        
        
        //Q8
        answers[0] = "No, but I could message you and We could try doing it together"
        Questions.append(questionsDB(questionID: 4, groupID: 2, numOfAnswers: 1, Answers: answers, questionString:"Has anyone figured out problem 2?", date: "04/26/2018", name: "Jovon Johnson"))
        //Q9
        answers[0] = "I found this very useful link, I will send it to you later!"
        answers[1] = "We are having a tutoring session for UML's in S&E2 321, come by!"
        answers[2] = "Come to lecture hall now!"
        Questions.append(questionsDB(questionID: 1, groupID: 3, numOfAnswers: 3, Answers: answers, questionString:"Can anyone help me with problem 3 for homework?", date: "04/28/2018", name: "Jovon Johnson"))
        
        
    }
}
