//  User_Profile.swift
//  Created by Sergio Rosendo on 4/12/18.
//  Edited by Hunter Brown on 4/15/18.

import Foundation
import SQLite

class User_Profile {
    //:MARK: Properties
    let USER_ID : Int
    
    var username : String
    var email_address : String
    var password : String

    var security_question_1 : String
    var security_question_2 : String

    var security_question_1_ans : String
    var security_question_2_ans : String


    //:MARK: Constructors
    init(USER_ID : Int){
        self.USER_ID       = USER_ID
        
        self.username      = ""
        self.email_address = ""
        self.password      = ""
        
        self.security_question_1 = ""
        self.security_question_2 = ""
        
        self.security_question_1_ans = ""
        self.security_question_2_ans = ""
    }
    
    //:NOTE: Constructor will receive an ID associated with the provided email address
    convenience init? (ID : Int) {
        self.init(USER_ID: ID)
        //:Attempting to connect to database
        if let database : Connection = try? Connection("/Users/serj/Desktop/GO-TOO/SQLite_Database/backend_db.db"){
            let users : Table = Table("Users")
            let security_questions : Table = Table("Security_Questions")
            
            //:User IDs needed to search for user information in User and Security_Questions tables
            let user_id : Expression = Expression<Int>("ID_NUMBER")
            
            let username : Expression = Expression<String>("NAME")
            let email    : Expression = Expression<String>("EMAIL")
            let password : Expression = Expression<String>("PASSWORD_HASH")
            
            let question1 : Expression = Expression<String>("QUESTION_ONE")
            let question2 : Expression = Expression<String>("QUESTION_TWO")
            
            let answer1   : Expression = Expression<String>("ANSWER_ONE")
            let answer2   : Expression = Expression<String>("ANSWER_TWO")
            
            for row in try! database.prepare(users.filter(ID == user_id)) {
                self.username      = row[username]
                self.email_address = row[email]
                self.password      = row[password]
            }
       
            for col in try! database.prepare(security_questions.filter(ID == user_id)) {
                self.security_question_1 = col[question1]
                self.security_question_2 = col[question2]
                
                self.security_question_1_ans = col[answer1]
                self.security_question_2_ans = col[answer2]
            }
        }
        
        else{
            print("ERROR TYPE: Failed to connect to database")
            print("Location: class User_Profile")
            print("Function: init")
            return nil
        }
    }

    //:MARK: Setters
    func set_username (name : String) -> Bool {
        self.username = name
        
         //:Attempting to connect to database
        if let database : Connection = try? Connection("/Users/serj/Desktop/GO-TOO/SQLite_Database/backend_db.db") {
            let users : Table = Table("Users")
            
            let username : Expression = Expression<String>("NAME")
            
            //:Determining if username is in user
            if let query_result : Int = try? database.scalar(users.filter(self.username == username).count) {
                if (query_result == 0) {
                    //:Username is not in use
                    return true
                }
                
                else {
                    //:Username is in use
                    return false
                }
            }
        }
        else{
            print("ERROR TYPE: Failed to connect to database")
            print("Location: class User_Profile")
            print("Function: set_user_name")
        }
        
        return false
    }

    func set_email_address (email : String) -> Bool {
        self.email_address = email
        
        //:Attempting to connect to database
        if let database : Connection = try? Connection("/Users/serj/Desktop/GO-TOO/SQLite_Database/backend_db.db") {
            let users : Table = Table("Users")
            
            let email_address : Expression = Expression<String>("EMAIL")
            
            //:Determining if email is in use
            if let query : Int = try? database.scalar(users.filter(self.email_address == email_address).count) {
                if (query == 0) {
                    //:Email address is not in use
                    return true
                    
                } else {
                    //:Email address is in use
                    return false
                }
            }
        }
        return false
    }

    func set_password (password : String){
        //:TODO: Encrypt User Password
        self.password = password
    }

    func set_security_question_1 (q1 : String) {
        self.security_question_1 = q1
    }

    func set_security_question_2 (q2 : String) {
        self.security_question_2 = q2
    }

    func set_security_question_1_ans (answer : String) {
        //:TODO: Encrypt Answer To Question 1 Password
        self.security_question_1_ans = answer
    }

    func set_security_question_2_ans (answer : String) {
        //:TODO: Encrypt Answer To Question 2 Password
        self.security_question_2_ans = answer
    }


    //:MARK: Getters
    func get_user_id () -> Int {
        return self.USER_ID
    }

    func get_user_name () -> String{
        return self.username
    }

    func get_email () -> String{
        return self.email_address
    }

    func get_password () -> String{
        return self.password
    }

    func get_security_question_1 () -> String{
        return self.security_question_1
    }

    func get_security_question_2 () -> String{
        return self.security_question_2
    }

    func get_security_question_1_ans () -> String{
        return self.security_question_1_ans
    }

    func get_security_question_2_ans () -> String{
        return self.security_question_2_ans
    }
    
    //:MARK: Database Updaters
    func update_database_username(){
        if let database : Connection = try? Connection("/Users/serj/Desktop/GO-TOO/SQLite_Database/backend_db.db") {
            let user : Table = Table("Users")
            let username : Expression = Expression<String>("NAME")
            let user_id : Expression = Expression<Int>("ID_NUMBER")
            
            let temp = user.filter(self.USER_ID == user_id)
            try? database.run(temp.update(username <- self.username))
        }
    }
    
    func update_database_email(){
        if let database : Connection = try? Connection("/Users/serj/Desktop/GO-TOO/SQLite_Database/backend_db.db") {
            let user : Table = Table("Users")
            let email : Expression = Expression<String>("EMAIL")
            let user_id : Expression = Expression<Int>("ID_NUMBER")
            
            let temp = user.filter(self.USER_ID == user_id)
            try? database.run(temp.update(email <- self.email_address))
        }
    }
    
    func update_database_password(){
        if let database : Connection = try? Connection("/Users/serj/Desktop/GO-TOO/SQLite_Database/backend_db.db") {
            let user : Table = Table("Users")
            let password : Expression = Expression<String>("PASSWORD_HASH")
            let user_id : Expression = Expression<Int>("ID_NUMBER")
            
            let temp = user.filter(self.USER_ID == user_id)
            try? database.run(temp.update(password <- self.password))
        }
    }
    
    func update_database_question_one(){
        if let database : Connection = try? Connection("/Users/serj/Desktop/GO-TOO/SQLite_Database/backend_db.db") {
            let sec : Table = Table("Security_Questions")
            let question : Expression = Expression<String>("QUESTION_ONE")
            let user_id : Expression = Expression<Int>("ID_NUMBER")
            
            let temp = sec.filter(self.USER_ID == user_id)
            try? database.run(temp.update(question <- self.security_question_1))
        }
    }
    
    func update_database_question_two(){
        if let database : Connection = try? Connection("/Users/serj/Desktop/GO-TOO/SQLite_Database/backend_db.db") {
            let sec : Table = Table("Security_Questions")
            let question : Expression = Expression<String>("QUESTION_TWO")
            let user_id : Expression = Expression<Int>("ID_NUMBER")
            
            let temp = sec.filter(self.USER_ID == user_id)
            try? database.run(temp.update(question <- self.security_question_2))
        }
    }
    
    func update_database_answer_one(){
        if let database : Connection = try? Connection("/Users/serj/Desktop/GO-TOO/SQLite_Database/backend_db.db") {
            let sec : Table = Table("Security_Questions")
            let answer : Expression = Expression<String>("ANSWER_ONE")
            let user_id : Expression = Expression<Int>("ID_NUMBER")
            
            let temp = sec.filter(self.USER_ID == user_id)
            try? database.run(temp.update(answer <- self.security_question_1_ans))
        }
    }
    
    func update_database_answer_two(){
        if let database : Connection = try? Connection("/Users/serj/Desktop/GO-TOO/SQLite_Database/backend_db.db") {
            let sec : Table = Table("Security_Questions")
            let answer : Expression = Expression<String>("ANSWER_TWO")
            let user_id : Expression = Expression<Int>("ID_NUMBER")
            
            let temp = sec.filter(self.USER_ID == user_id)
            try? database.run(temp.update(answer <- self.security_question_2_ans))
        }
    }
}
