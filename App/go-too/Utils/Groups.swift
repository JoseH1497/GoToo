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
    //current Online Members
    var onlineMembers = [String]()
    //Score of user with User ID, so we can display when user wants to see their points
    var userScore : Int
    
    
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
        
        
    }
    init(userID: Int){
        self.userID = userID
        self.groupName = ""
        self.isAdmin = false
        self.groupID = -1
        self.groupSize = 0
        self.userScore = 0
       
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
        groupSize = 5
    }
    func setGroupMembers(){
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
                groupMembers[0].userID = 1
                groupMembers[0].score = 25
                break
            case 1:
                groupMembers[1].userID = 2
                groupMembers[1].score = 37
                break
            case 2:
                groupMembers[2].userID = 3
                groupMembers[2].score = 2
                break
            case 3:
                groupMembers[3].userID = 4
                groupMembers[3].score = 9
                break
            case 4:
                groupMembers[4].userID = 5
                groupMembers[4].score = 152
                break
            default:
                break
                
                
            }
        }
        
        
    }
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
    
    func getGroupID() ->Int{
        return groupID
    }
    func getUserID()->Int{
        return userID
    }
    //Need to get next member to display
    func getNextGroupMembers() -> String {
        return ""
        //return groupMembers
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
    func getMemberName(userId: Int, groupID: Int) -> String{
        
        var MemberName: String = ""
        /**
         
         TODO: Knowing, userID, and groupID, get name of this user
         
         
         
         
         **/
    
        return MemberName
        
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
        onlineMembers = onlineMembs
        newPosts = newPost
        allPosts = allPost
        newQuestions = newQs
        allQuestions = allQs
  
    }
    
}
