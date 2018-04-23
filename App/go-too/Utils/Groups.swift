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
    var isAdmin : Bool
    var groupMembers = [String]()
    var onlineMembers = [String]()
     
     var newPosts = [String]()
     var allPosts = [String]()
     var newQuestions = [String]()
     var allQuestions = [String]()
    //:Constructors..............................................................................
    init(){
        /**TODO:Populate groupMembers[], onlineMembers[], newPosts[] and allPosts[], newQuestions[], allQuestions[]
         We need to either use a timestamp mechanism or something to tell what is a new post
         
         **/
        groupName = ""
        isAdmin = false
        
    }
    
    //:Information setters.......................................................................
    func changeGroupName(newName : String){
        if isAdmin {
            self.groupName = newName
            //TODO: Database needs to change group name for all members of the group
        }
        
    }
    
    
    
    
    //:Information getters....................................................................
    func getGroupName() -> String {
        return groupName
    }
    
    //Need to get next member to display
    func getNextGroupMembers() -> String {
        return ""
        //return groupMembers
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
        groupMembers = groupMembs
        onlineMembers = onlineMembs
        newPosts = newPost
        allPosts = allPost
        newQuestions = newQs
        allQuestions = allQs
  
    }
    
}
