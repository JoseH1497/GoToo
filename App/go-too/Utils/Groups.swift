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
    var userID : Int
    var isAdmin : Bool
    var groupMembers = [GroupTable]()
    var groupSize: Int
    var onlineMembers = [String]()
    var groupID : Int
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
        groupName = ""
        isAdmin = false
        groupID = -1
        userID = -1
        groupSize = 0
        
    }
    
    //:Information setters.......................................................................
    func setUserID(userID : Int){
        self.userID = userID
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
        
        
    }
    
    //:Information getters....................................................................
    func getGroupName() -> String {
        return groupName
    }
    
    func getGroupID() ->Int{
        return groupID
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
    func getTopRankedMembers() -> Array<GroupTable>{
        //sort GroupMembers
        var topMembers = [GroupTable]()
        switch(groupSize){
            case 0:
                print("ERROR")
                break
            case 1:
                return groupMembers
            break
        case 2:
            for i in 0..<2{
                var groupTab = GroupTable()
                topMembers.append(groupTab)
            }
        case 3:
            for i in 0..<3{
                var groupTabl = GroupTable()
                topMembers.append(groupTabl)
            }
            
        default:
            print("Should never get here")
            break
        }
        
        return groupMembers
        
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
