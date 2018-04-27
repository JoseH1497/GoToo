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
        
        //testing purposes
        numOfCourses = 3
        
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
                courseNames[0].groupID = 23
                courseNames[0].groupName = "CSE 120"
                break
            case 1:
                courseNames[1].groupID = 24
                courseNames[1].groupName = "CSE 150"
                break
            case 2:
                courseNames[2].groupID = 25
                courseNames[2].groupName = "CSE 165"
                break
            case 3:
                courseNames[3].groupID = 26
                courseNames[3].groupName = "CSE 65"
                break
            case 4:
                courseNames[4].groupID = 27
                courseNames[4].groupName = "CSE 175"
                break
            case 5:
                courseNames[5].groupID = 28
                courseNames[5].groupName = "CSE 111"
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
        
    }
    
    func inviteUsers(groupName: String, userID: Int){
        //TODO: Invite users based on the user invited
    }
    
    
    
    
}
