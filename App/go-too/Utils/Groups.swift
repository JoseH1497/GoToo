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
    /**var groupMembers = []
     var onlineMembers = []
     
     var newPosts = []
     var allPosts = []
     var newQuestions = []
     var allQuestions = []**/
    //:Constructors..............................................................................
    init(){
        /**TODO:Populate groupMembers[], onlineMembers[], newPosts[] and allPosts[], newQuestions[], allQuestions[]
         We need to either use a timestamp mechanism or something to tell what is a new post
         **/
        groupName = ""
        isAdmin = true
        
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
    
}
