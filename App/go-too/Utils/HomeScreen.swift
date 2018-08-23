//
//  HomeScreen.swift
//  go-too
//
//  Created by Jose Herrera on 4/25/18.
//  Copyright © 2018 Reactive Works. All rights reserved.
//

import Foundation

class HomeScreen {
    var numOfCourses: Int
    var courseNamesFromDataBase  = [GroupTable]()
    var userID: Int
    var coursesFull: Bool //tell us if user already has 6 groups
    //:Constructors..............................................................................
    init(){
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
        numOfCourses = 0
        userID = 0
        coursesFull = false
    }
    
    init(userID: Int){
        self.userID = userID
        numOfCourses = 0
        coursesFull = false
    }
    
    
    
    
    //:Information setters.......................................................................
    func setNumOfCourses(num: Int){
        numOfCourses = num
        if numOfCourses == 6{
            coursesFull = true
        }
        
    }
    func setUserID(userID: Int){
        self.userID = userID
    }
    
    
     //:Information getters.......................................................................
    
    //get number of courses for userID
    //This function will go to the database and get the number of groups from a variable
    //being stored in the database

    func getNumOfCourses() ->Int{
        var numOfCourses : Int = 0
        /**TODO:
            Get number of courses for userID and put into numOfCourses var
        **/
        //database stuff
        numOfCourses = DATA.Users[userID].numOfGroups
        //testing purposes
        //numOfCourses = 6
        
        setNumOfCourses(num: numOfCourses)//set num of courses var
        return numOfCourses
        
    }
    
    func getUserID()->Int{
        return self.userID
    }
    
    //MARK: -this function returns an array of strings holding the course names to be displayed
    //on the buttons
    
    func getCourseNamesFromDataBase() -> Array<GroupTable>{
        
        var courseNames  = [GroupTable]()
        
        for i in 0..<numOfCourses{
            //initialize courseNames to size = numOfCourses
            var group = GroupTable()
            courseNames.append(group)
        }
        /**TODO:
         Need to get course names from database and put into courseNamesFromDatabase array,
         Can use userID to get all coursenames and associated groupID and we already know the numofCOurses
         Populate the courseNamesFromDatabase with the actual groupNames and put them in so we could access them in a different function
         
         var i :Int = 0
         if(numOfCourses != 0){
         
            for i = 0 < numOfCourses do
                courseNames[i].groupID =  databaseGroupID for i-th group of userID
                courseNames[i].groupName = database name for associated i-th groupID
         
         
         }
         
         **/
        
        
        //testing purposes---------------------------------
        
        
        for i in 0..<numOfCourses{
            switch(i){
                
            case 0:
                courseNames[0].groupID = DATA.Users[userID].groups[i].groupID
                courseNames[0].groupName = DATA.Users[userID].groups[i].groupName
                break
            case 1:
                courseNames[i].groupID = DATA.Users[userID].groups[i].groupID
                courseNames[i].groupName = DATA.Users[userID].groups[i].groupName
                break
            case 2:
                courseNames[i].groupID = DATA.Users[userID].groups[i].groupID
                courseNames[i].groupName = DATA.Users[userID].groups[i].groupName
                break
            case 3:
                courseNames[i].groupID = DATA.Users[userID].groups[i].groupID
                courseNames[i].groupName = DATA.Users[userID].groups[i].groupName
                break
            case 4:
                courseNames[i].groupID = DATA.Users[userID].groups[i].groupID
                courseNames[i].groupName = DATA.Users[userID].groups[i].groupName
                break
            case 5:
                courseNames[i].groupID = DATA.Users[userID].groups[i].groupID
                courseNames[i].groupName = DATA.Users[userID].groups[i].groupName
                break
            default:
                break
                
            }
        }
        
        
        courseNamesFromDataBase = courseNames
        
        return courseNamesFromDataBase
        
    }
    
    
    func addGroup(groupName: String, userID: Int){
        
        //TODO: enter groupName with generated unique groupID for userID and enter into database. This will update the user's groups when user presses plus button
        let groupNumber = DATA.Users[userID].getNumOfGroups()
        if(groupNumber <= 6){
            var alloc = GroupTable()
            DATA.Users[userID].groups.append(alloc)
            DATA.Users[userID].groups[groupNumber].groupID = 0
            DATA.Users[userID].groups[groupNumber].groupName = groupName
            DATA.Users[userID].setnumOfGroups(num: groupNumber+1)
        }
        
        
    }
    
    func inviteUsers(groupName: String, userID: Int){
        //TODO: Invite users based on the user invited
    }
    
    
    
    
}
