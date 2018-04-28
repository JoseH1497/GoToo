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

class Database{
    var Users = [User]()
    var Groups = [GroupsInDB]()
    var userCount:Int
    var groupCount: Int
    
    var onlineSize: Int
    init(){
        onlineSize = 0
        userCount = 2
        groupCount = 7//current group count
        setUsers()
        setGroups()
        setOnline()
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
}
