//
//  Groups.swift
//  go-too
//
//  Created by Jose Herrera on 4/13/18.
//  Copyright © 2018 Reactive Works. All rights reserved.
//

import Foundation
import UIKit

class Group {
    var groupName   : String
    //userID who is currently signed in
    var userID : Int
    //unique id of the group to keep track of all information
    var groupID : Int
    //keeps track if this specific userid is the admin of group, giving admin priveleges
    var isAdmin : Bool
    //all members of group
    var groupMembers = [GroupTable]()
    //list of topMembers based on score
    var topMembers = [GroupTable]()
    //# of members
    var groupSize: Int
    //#of online Members currently
    var onlineSize: Int
    //current Online Members
    var onlineMembers = [GroupTable]()
    //Score of user with User ID, so we can display when user wants to see their points
    var userScore : Int
    var questionID: Int
    //Questions:
    var numOfQuestions: Int
    var QuestionsArray = [Questions]()
    var questionSelected: Int
    var newPosts = [String]()
    var allPosts = [String]()
    var newQuestions = [String]()
    var allQuestions = [String]()
    //:Constructors..............................................................................
    init(){
        /**TODO:Populate groupMembers[], onlineMembers[], newPosts[] and allPosts[], newQuestions[], allQuestions[]
         We need to either use a timestamp mechanism or something to tell what is a new post
         
         **/
        //TODO: Connect to database
        // Attempting to connect database
        // Successful connection ---> initialization continues
        // Failed connection     ---> initialization stops and nil is returned
       /** do{
            database = try Connection("/Users/serj/Desktop/Clone/SQLite_Database/backend_db.db")
        }catch{
            print("Location: User_Verfication (CLASS)")
            print("Error: Failed to connect to database")
            return nil
        }**/
        self.groupName = ""
        self.isAdmin = false
        self.groupID = -1
        self.userID = -1
        self.groupSize = 0
        self.userScore = 0
        self.onlineSize = 0
        self.numOfQuestions = 0
        self.questionSelected = -1
        self.questionID = 101
        
        
    }
    init(userID: Int){
        self.userID = userID
        self.groupName = ""
        self.isAdmin = false
        self.groupID = -1
        self.groupSize = 0
        self.userScore = 0
        self.onlineSize = 0
        self.numOfQuestions = 0
        self.questionSelected = -1
        self.questionID = 101
       
    }
    
    //:Information setters or manipulators.......................................................................
    func setUserID(userID : Int){
        self.userID = userID
        //set score of this user
        setUserScore(userID: self.userID)
    }
    func setGroupName(groupName : String){
        self.groupName = groupName
        
    }
    func setGroupID(groupID : Int){
        self.groupID = groupID
    }
    func setAdmin(){
        //TODO: use groupID and current userID
    }
    
    func setGroupSize(){
        //TODO: Set groupSize of current group using groupID and put into
        //groupSize so we can use it
        
        //testing:
        //groupSize = 16
        //from database
        groupSize = DATA.Groups[groupID].getGroupSize()
    }
    func setQuestionSelected(selected: Int){
        questionSelected = selected
        
    }
    func setOnlineSize(){
        //TODO: Set online Size for current group using groupID and seeing what Members online bit is on or off
        
        //testing
        
        //onlineSize = 3
        onlineSize = DATA.getOnlineSize()
        
        
    }
    func setQuestionSize(){
        //TODO: Get question size from database using groupID to get all questions for this group
        //testing
        numOfQuestions = 5
    }
    func getQuestionIDFromDB(question : Int) ->Int{
        return questionSelected
        
    }
    func getQuestionIndexInDB(questionID: Int) -> Int{
        for i in 0..<DATA.Questions.count{
            if(DATA.Questions[i].questionID == questionID){
                return i
            }
        }
        return -1
    }
    //set questions from database
    func setQuestionsArray(){
        self.setQuestionSize()
        
        //allocate space for numOfQuestions
        for i in 0..<numOfQuestions{
            var alloc = Questions()
            QuestionsArray.append(alloc)
        }
        
        //TODO: Get each postID with actual question and num OfAnswers and put answers in array Answers
        /**
         for i in 0..<numOfQuestions{
         QuestionsArray[i].questionID = questionID from database
         QuestonsArray[i].question = question for current postID from database
         QuestionsArray[i].setAnswersArray()
         /*GoToo Questions.swift and look at setAnswersArray()*/
         
         }
         
         **/
        //not USED
        for i in 0..<numOfQuestions{
            switch(i){
            case 0:
                QuestionsArray[i].questionID = i
                QuestionsArray[i].question = "What is square root of 2?"
                QuestionsArray[i].setAnswersArray()
            case 1:
                QuestionsArray[i].questionID = i
                QuestionsArray[i].question = "What is 2+2?"
                QuestionsArray[i].setAnswersArray()
            case 2:
                QuestionsArray[i].questionID = i
                QuestionsArray[i].question = "What is pi?"
                QuestionsArray[i].setAnswersArray()
            case 3:
                QuestionsArray[i].questionID = i
                QuestionsArray[i].question = "Where can I find Phi?"
                QuestionsArray[i].setAnswersArray()
            case 4:
                QuestionsArray[i].questionID = i
                QuestionsArray[i].question = "Has anyone figured out problem 3?"
                QuestionsArray[i].setAnswersArray()
                
                
            default:
                break
            }
        }
        
        
        
        
    }
    //questionsDB(questionID: 1, groupID: 0, numOfAnswers: 2, Answers: answers, questionString:"Can anyone help me with problem 3 for homework?", date: "04/28/18", name: "Jovon Johnson")
    func addQuestion(groupID: Int, question:String, name:String){
        
        //TODO: generate new Question ID and get date
        print("New quewstiond")
        print(questionID)
        
        let newQuestion = questionsDB(questionID: questionID, groupID: groupID, numOfAnswers: 0, Answers: ["","",""], questionString: question, date: "05/07/18", name: name)
        self.questionID =  self.questionID + 1
        DATA.Questions.append(newQuestion)
        DATA.writeQuestionToDatabase(newQuestion: newQuestion, uID: self.userID)
    }
    func addAnswer(questionID: Int, questionIndex: Int, answerString: String){
        let numAnswers = DATA.Questions[questionIndex].numOfAnswers
        if(numAnswers < 3){
            DATA.Questions[questionIndex].Answers[numAnswers] = answerString
        }else{
            DATA.Questions[questionIndex].Answers.append(answerString)
        }
        
        DATA.Questions[questionIndex].numOfAnswers =  numAnswers + 1
    DATA.writeAnswerToDatabase(questionID: questionID, answerText: answerString)
        
    }
    func setOnlineMembers(){
        //set size of online group
        self.setOnlineSize()
        //allocate space
        for i in 0..<onlineSize{
            var alloc = GroupTable()
            //onlineMembers.append(alloc)
        }
        
        
        //TODO: Get each groupMember ID and current score
        /**
         for i in 0..<groupSize{
         groupMembers[i].userID = userID from database
         groupMembers[i].score = score for current userID from database
         
         }
         
        
         **/
        //check if online
        for i in 0..<DATA.userCount{
            for j in 0..<DATA.Users[i].numOfGroups{
                if(DATA.Users[i].groups[j].groupID == self.groupID){
                    if(DATA.Users[i].isOnline){
                        var newUser = GroupTable()
                        newUser.groupName = self.groupName
                        newUser.groupID = self.groupID
                        newUser.userID = DATA.Users[i].UserID
                        newUser.userName = DATA.Users[i].name
                        onlineMembers.append(newUser)
                    }
                }
            }
        }
        
        //testing purposes: populating with random data
        /**for i in 0..<onlineSize{
            switch(i){
            case 0:
                onlineMembers[i].userID = 1
                onlineMembers[i].score = 25
                onlineMembers[i].groupID = self.getGroupID()
                break
            case 1:
                onlineMembers[i].userID = 2
                onlineMembers[i].score = 37
                onlineMembers[i].groupID = self.getGroupID()
                break
            case 2:
                onlineMembers[i].userID = 3
                onlineMembers[i].score = 2
                onlineMembers[i].groupID = self.getGroupID()
                break
            case 3:
                onlineMembers[i].userID = 4
                onlineMembers[i].score = 9
                onlineMembers[i].groupID = self.getGroupID()
                break
            case 4:
                onlineMembers[i].userID = 5
                onlineMembers[i].score = 152
                onlineMembers[i].groupID = self.getGroupID()
                break
            
            default:
                break
                
                
            }
        }**/
        
    }
    func setGroupMembers(){
        //set size of group
        self.setGroupSize()
        
        for i in 0..<groupSize{
            var alloc = GroupTable()
            groupMembers.append(alloc)
        }
   
        
        //TODO: Get each groupMember ID and current score
        /**
         for i in 0..<groupSize{
                groupMembers[i].userID = userID from database
                groupMembers[i].score = score for current userID from database
         
         }
        
         ONCE WE HAVE GROUPMEMBERS IN PLACE,
         I will rank them according to the top scores
        **/
        
        //sort by rank
        
        //testing purposes: populating with random data
        for i in 0..<groupSize{
            switch(i){
            case 0:
                groupMembers[i].userID = 1
                groupMembers[i].score = 25
                groupMembers[i].groupID = self.getGroupID()
                groupMembers[i].groupName = self.getGroupName()
                groupMembers[i].userName =  DATA.Groups[groupID].groupMembers[i]
               
                break
            case 1:
                groupMembers[i].userID = 2
                groupMembers[i].score = 37
                groupMembers[i].groupID = self.getGroupID()
                groupMembers[i].groupName = DATA.Groups[groupID].groupMembers[i]
                groupMembers[i].userName =  DATA.Groups[groupID].groupMembers[i]
               
                break
            case 2:
                groupMembers[i].userID = 3
                groupMembers[i].score = 2
                groupMembers[i].groupID = self.getGroupID()
                groupMembers[i].groupName = DATA.Groups[groupID].groupMembers[i]
                groupMembers[i].userName =  DATA.Groups[groupID].groupMembers[i]
                
                break
            case 3:
                groupMembers[3].userID = 4
                groupMembers[3].score = 9
                groupMembers[3].groupID = self.getGroupID()
                groupMembers[i].groupName = DATA.Groups[groupID].groupMembers[i]
                groupMembers[i].userName =  DATA.Groups[groupID].groupMembers[i]
                
                break
            case 4:
                groupMembers[4].userID = 5
                groupMembers[4].score = 152
                groupMembers[4].groupID = self.getGroupID()
                groupMembers[i].groupName = DATA.Groups[groupID].groupMembers[i]
                groupMembers[i].userName =  DATA.Groups[groupID].groupMembers[i]
               
                break
            case 5:
                groupMembers[5].userID = 6
                groupMembers[5].score = 192
                groupMembers[5].groupID = self.getGroupID()
                groupMembers[i].groupName = DATA.Groups[groupID].groupMembers[i]
                groupMembers[i].userName =  DATA.Groups[groupID].groupMembers[i]
                
                break
            case 6:
                groupMembers[6].userID = 7
                groupMembers[6].score = 162
                groupMembers[6].groupID = self.getGroupID()
                groupMembers[i].groupName = DATA.Groups[groupID].groupMembers[i]
                groupMembers[i].userName =  DATA.Groups[groupID].groupMembers[i]
               
                break
            case 7:
                groupMembers[i].userID = 8
                groupMembers[i].score = 152
                groupMembers[i].groupID = self.getGroupID()
                groupMembers[i].groupName = DATA.Groups[groupID].groupMembers[i]
                groupMembers[i].userName =  DATA.Groups[groupID].groupMembers[i]
                
                break
            case 8:
                groupMembers[i].userID = 9
                groupMembers[i].score = 11
                groupMembers[i].groupID = self.getGroupID()
                groupMembers[i].groupName = DATA.Groups[groupID].groupMembers[i]
                groupMembers[i].userName =  DATA.Groups[groupID].groupMembers[i]
                groupMembers[i].isOnline = false
                
                break
            case 9:
                groupMembers[i].userID = 10
                groupMembers[i].score = 142
                groupMembers[i].groupID = self.getGroupID()
               groupMembers[i].groupName = DATA.Groups[groupID].groupMembers[i]
                groupMembers[i].userName =  DATA.Groups[groupID].groupMembers[i]
                groupMembers[i].isOnline = false
               
                break
            case 10:
                groupMembers[i].userID = 11
                groupMembers[i].score = 45
                groupMembers[i].groupID = self.getGroupID()
                groupMembers[i].groupName = DATA.Groups[groupID].groupMembers[i]
                groupMembers[i].userName =  DATA.Groups[groupID].groupMembers[i]
                
                break
            case 11:
                groupMembers[i].userID = 12
                groupMembers[i].score = 90
                groupMembers[i].groupID = self.getGroupID()
                groupMembers[i].groupName = DATA.Groups[groupID].groupMembers[i]
                groupMembers[i].userName =  DATA.Groups[groupID].groupMembers[i]
                
                break
            case 12:
                groupMembers[i].userID = 13
                groupMembers[i].score = 10
                groupMembers[i].groupID = self.getGroupID()
                groupMembers[i].groupName = DATA.Groups[groupID].groupMembers[i]
                groupMembers[i].userName =  DATA.Groups[groupID].groupMembers[i]
                
                break
            case 13:
                groupMembers[i].userID = 14
                groupMembers[i].score = 100
                groupMembers[i].groupID = self.getGroupID()
               groupMembers[i].groupName = DATA.Groups[groupID].groupMembers[i]
                groupMembers[i].userName =  DATA.Groups[groupID].groupMembers[i]
                groupMembers[i].isOnline = false
               
                break
            case 14:
                groupMembers[i].userID = 15
                groupMembers[i].score = 109
                groupMembers[i].groupID = self.getGroupID()
                groupMembers[i].groupName = DATA.Groups[groupID].groupMembers[i]
                groupMembers[i].userName =  DATA.Groups[groupID].groupMembers[i]
                break
            case 15:
                groupMembers[i].userID = 16
                groupMembers[i].score = 103
                groupMembers[i].groupID = self.getGroupID()
                groupMembers[i].groupName = DATA.Groups[groupID].groupMembers[i]
                groupMembers[i].userName =  DATA.Groups[groupID].groupMembers[i]
                break
            case 16:
                groupMembers[i].userID = 17
                groupMembers[i].score = 135
                groupMembers[i].groupID = self.getGroupID()
                groupMembers[i].groupName = DATA.Groups[groupID].groupMembers[i]
                groupMembers[i].userName =  DATA.Groups[groupID].groupMembers[i]
                break
            default:
                break
                
                
            }
        }
        
        
    }
    //function sets user Score from current score stored in database
    func setUserScore(userID: Int){
        var score: Int
        //TODO: Set var score to score of current user based on userID from database
        
        
        //testing purpose
        score = 3
        
        
        
        self.userScore = score
    }
    
    //:Information getters....................................................................
    func getGroupName() -> String {
        return groupName
    }
    func getQuestionSelected() -> Int{
        return questionSelected
    }
    func getGroupID() ->Int{
        return groupID
    }
    func getUserID()->Int{
        return userID
    }
    //Need to get next member to display
    func getGroupMembersByID() -> Array<GroupTable> {
        return groupMembers
        //return groupMembers
    }
    func getOnlineMembersByID()->Array<GroupTable>{
        return onlineMembers
    }
    func isGroupAdmin()->Bool{
        return isAdmin
    }
    func getGroupSize() -> Int{
        return groupSize
    }
    
    func getUserScore() -> Int{
        return userScore
    }
   
    //this function will return an array of strings holding names of all members of group
    //uses getMemberName fucntion to get each name for all members based on userID
    func getGroupMembersByName() -> Array<String>{
       var MemberNames = [String]() //
        
        for i in 0..<groupSize{
            //get each name one by one
            MemberNames.append(getMemberName(userId: groupMembers[i].userID, groupID: groupID))
        }
         //return names
        return MemberNames
    }
    func getOnlineSize()->Int{
        return self.onlineSize
    }
    //this function will return an array of strings holding names of all members of group
    //uses getMemberName fucntion to get each name for all members based on userID
    func getOnlineMembersByName() -> Array<String>{
        var MemberNames = [String]() //
        
        for i in 0..<onlineSize{
            //get each name one by one
            MemberNames.append(getMemberName(userId: onlineMembers[i].userID, groupID: groupID))
        }
        //return names
        return MemberNames
    }
    
    
    //This function uses userID to get name of user
    func getMemberName(userId: Int, groupID: Int) -> String{
        
        var MemberName: String = ""
        /**
         
         TODO: Knowing, userID, and groupID, get name of this user from database
         
         
         
         
         **/
        
        MemberName = DATA.getUserName(userID: userID)
        
        
        return MemberName
        
    }
    //get num of Questions
    func getNumOfQuestions()->Int{
        return self.numOfQuestions
    }
    //returns top 1, 2 or 3 group members based on points
    func getTopRankedMembers() -> Array<GroupTable>{
        setRanking()
        
        return topMembers
        
    }
    
    
    
    
   
    
    
    //:Display Lists.........................................................................
    //not sure if these should go here or inside each view controller and just called upon from object
    func displayOnlineMembers(){
        
    }
    func displayNewPost(){
        
    }
    func displayAllPosts(){
        
    }
    func displayNewQuestions(){
        
    }
    func displayAllQuestions(){
        
    }
    
    //Helper functions..........................................................................
    
    //MARK: sort groupMembers by score
    
    //Function called when trying to find top 1,2,or 3 members of the group based on score, called before getRankedMembers()
    func setRanking(){
        //set currentGroup size first so we can know how many members we got
        self.setGroupSize()
        //next, set members of group
        if(self.getGroupSize() != 0){
            self.setGroupMembers()
            
            if groupSize == 1{
                //only one member so only one rank
                topMembers = groupMembers
            }else{
                //groupSize > 1 so we need to sort them to get top three or 2
                //TODO:sort
                sort()
                
                //
                for i in 0..<groupSize{
                    var alloc = GroupTable()
                    topMembers.append(alloc)
                }
                //members should be sorted by top scores now
                topMembers[0].userID = groupMembers[0].userID
                topMembers[0].score = groupMembers[0].score
                
                topMembers[1].userID = groupMembers[1].userID
                topMembers[1].score = groupMembers[1].score
                if groupSize > 2{//need top 3 so add one more
                    //groupSize >2
                    topMembers[2].userID = groupMembers[2].userID
                    topMembers[2].score = groupMembers[2].score
                }
                
                
            }
            
            
        }else{
            
            print("ERROR, group size shouldnt be 0")
            return
        }
    }
    
    
    fileprivate func sort(){
        
    }
    //func will load info from database if there is stuff to load
    //MARK: -Im thinking we can create a function that will load info to the group objects in super class
    func loadInfoFromDataBase(name : String, isAd : Bool, groupMembs : Array<String>, onlineMembs : Array<String>, newPost : Array<String>, allPost : Array <String>, newQs : Array<String>, allQs : Array<String>){
        groupName  = name
        isAdmin = isAd
        //groupMembers = groupMembs
        //onlineMembers = onlineMembs
        newPosts = newPost
        allPosts = allPost
        newQuestions = newQs
        allQuestions = allQs
  
    }
    
}
