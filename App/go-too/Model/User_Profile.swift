//  User_Profile.swift
//  Created by Sergio Rosendo on 4/12/18.
//  Edited by Hunter Brown on 4/15/18.

import Foundation
import SQLite

class User_Profile {
    //:MARK: Properties
    let USER_ID : Int

    var user_name : String
    var email_address : String
    var password : String

    var security_question_1 : String
    var security_question_2 : String

    var security_question_1_ans : String
    var security_question_2_ans : String


    //:MARK: Constructor
    init (ID : Int) {
        self.USER_ID = ID

        //:TODO: RETRIEVE INFORMATION FROM DATABASE ASSOCIATED WITH PROVIDED USER ID
        
        if let database : Connection = try? Connection("/Users/user137911/Docuemnts/GoToo/SQLite_Database/backend_db.db") {
            let user : Table = Table("Users")
            let sec : Table = Table("SecurityQuestions")
            let user_id : Expression = Expression<Int>("ID_NUMBER")
            let sec_id : Expression = Expression<Int>("USER_ID")
            let username : Expression = Expression<String>("NAME")
            let email : Expression = Expression<String>("EMAIL")
            let password : Expression = Expression<String>("PASSWORD_HASH")
            let question1 : Expression = Expression<String>("QUESTIONONE")
            let question2 : Expression = Expression<String>("QUESTIONTWO")
            let answer1 : Expression = Expression<String>("QONEANSWER")
            let answer2 : Expression = Expression<String>("QTWOANSWER")
            
            for row in try! database.prepare(user.filter(self.USER_ID == user_id)) {
                self.user_name = row[username]
                self.email_address = row[email]
                self.password = row[password]
            }
            
            for col in try! database.prepare(sec.filter(self.USER_ID == sec_id)) {
                self.security_question_1 = col[question1]
                self.security_question_2 = col[question2]
                
                self.security_question_1_ans = col[answer1]
                self.security_question_2_ans = col[answer2]
            }
            
            //:NOTE: THE PROVIDED USER ID CAN BE LINKED TO AN EXISTING ACCOUNT (CONTAINS PERSONAL INFO) OR TO A NEW ACCOUNT (CONTAINS DEFAULT VALUES)
            //:USE ID NOT USER_ID TO RETRIEVE THE INFORMATION
            //self.user_name = try? user.select(username).filter(ID == user_id).limit(1)
            //self.email_address = try? user.select(email).filter(ID == user_id).limit(1)
            //self.password = try? user.select(password).filter(ID == user_id).limit(1)
            
            //self.security_question_1 = try? sec.select(question1).filter(ID == sec_id).limit(1)
            //self.security_question_2 = try? sec.select(question2).filter(ID == sec_id).limit(1)
            
            //self.security_question_1_ans = try? sec.select(answer1).filter(ID == sec_id).limit(1)
            //self.security_question_2_ans = try? sec.select(answer2).filter(ID == sec_id).limit(1)
            
        }
        self.user_name = ""
        self.email_address = ""
        self.password = ""
        self.security_question_1 = ""
        self.security_question_2 = ""
        self.security_question_1_ans = ""
        self.security_question_2_ans = ""
    }

    //:MARK: Setters / Database Updaters
    func set_user_name (name : String) -> Bool {
        self.user_name = name
        //:TODO: UPDATE USER NAME IN DATABASE
        
        if let database : Connection = try? Connection("/Users/user137911/Docuemnts/GoToo/SQLite_Database/backend_db.db") {
            let user : Table = Table("Users")
            let username : Expression = Expression<String>("NAME")
            let user_id : Expression = Expression<Int>("ID_NUMBER")
            
            if let query : Int = try? database.scalar(user.filter(username == name).count) {
                if (query == 0) {
                    let temp = user.filter(self.USER_ID == user_id)
                    try? database.run(temp.update(username <- name))
                    return true
                } else {
                    return false
                }
            }
        }
        return false
    }

    func set_email_address (email : String) -> Bool {
        self.email_address = email
        //:TODO: SET USER EMAIL IN DATABASE
        
        if let database : Connection = try? Connection("/Users/user137911/Docuemnts/GoToo/SQLite_Database/backend_db.db") {
            let user : Table = Table("Users")
            let em : Expression = Expression<String>("EMAIL")
            let user_id : Expression = Expression<Int>("ID_NUMBER")
            
            if let query : Int = try? database.scalar(user.filter(em == email).count) {
                if (query == 0) {
                    let temp = user.filter(self.USER_ID == user_id)
                    try? database.run(temp.update(em <- email))
                    return true
                } else {
                    return false
                }
            }
        }
        return false
    }

    func set_password (password : String){
        //:TODO: CALL A FUNCTION THAT ENCRYPTS THE PROVIDED PASSWORD
        self.password = password
        //:TODO: UPDATE PASSWORD IN DATABASE
        
        if let database : Connection = try? Connection("/Users/user137911/Docuemnts/GoToo/SQLite_Database/backend_db.db") {
            let user : Table = Table("Users")
            let pw : Expression = Expression<String>("PASSWORD_HASH")
            let user_id : Expression = Expression<Int>("ID_NUMBER")
            
            let temp = user.filter(self.USER_ID == user_id)
            try? database.run(temp.update(pw <- password))
        }    }

    func set_security_question_1 (q1 : String) {
        self.security_question_1 = q1
        //:TODO: UPDATE SECURITY QUESTION 1 IN DATABASE
        if let database : Connection = try? Connection("/Users/user137911/Docuemnts/GoToo/SQLite_Database/backend_db.db") {
            let sec : Table = Table("SecurityQuestions")
            let question : Expression = Expression<String>("QUESTIONONE")
            let user_id : Expression = Expression<Int>("USER_ID")
            
            let temp = sec.filter(self.USER_ID == user_id)
            try? database.run(temp.update(question <- q1))
        }
    }

    func set_security_question_2 (q2 : String) {
        self.security_question_2 = q2
        //:TODO: UPDATE SECURITY QUESTION 2 IN DATABASE
        if let database : Connection = try? Connection("/Users/user137911/Docuemnts/GoToo/SQLite_Database/backend_db.db") {
            let sec : Table = Table("SecurityQuestions")
            let question : Expression = Expression<String>("QUESTIONTWO")
            let user_id : Expression = Expression<Int>("USER_ID")
            
            let temp = sec.filter(self.USER_ID == user_id)
            try? database.run(temp.update(question <- q2))
        }
        
    }

    func set_security_question_1_ans (answer : String) {
        //:TODO: CALL A FUNCTION THAT ENCRYPTS THE PROVIDED ANSWER
        self.security_question_1_ans = answer

        //:TODO: UPDATE SECURITY QUESTION 1 ANSWER IN DATABASE
        if let database : Connection = try? Connection("/Users/user137911/Docuemnts/GoToo/SQLite_Database/backend_db.db") {
            let sec : Table = Table("SecurityQuestions")
            let ans : Expression = Expression<String>("QONEANSWER")
            let user_id : Expression = Expression<Int>("USER_ID")
            
            let temp = sec.filter(self.USER_ID == user_id)
            try? database.run(temp.update(ans <- answer))
        }
    }

    func set_security_question_2_ans (answer : String) {
        //:TODO: CALL A FUNCTION THAT ENCRYPTS THE PROVIDED ANSWER

        self.security_question_2_ans = answer
        //:TODO: UPDATE SECURITY QUESTION 2 ANSWER IN DATABASE
        if let database : Connection = try? Connection("/Users/user137911/Docuemnts/GoToo/SQLite_Database/backend_db.db") {
            let sec : Table = Table("SecurityQuestions")
            let ans : Expression = Expression<String>("QTWOANSWER")
            let user_id : Expression = Expression<Int>("USER_ID")
            
            let temp = sec.filter(self.USER_ID == user_id)
            try? database.run(temp.update(ans <- answer))
        }

    }


    //:MARK: Getters
    func get_user_id () -> Int {
        return self.USER_ID
    }

    func get_user_name () -> String{
        return self.user_name
    }

    func get_email () -> String{
        return self.email_address
    }

    func get_password () -> String{
        //:TODO: RETURN UNENCRYPTED PASSWORD
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
}
