//
//  User.swift
//  go-too
//
//  Created by Sergio Rosendo on 4/16/18.
//  Copyright © 2018 Reactive Works. All rights reserved.
//

import Foundation
import SQLite

class User{
    //:MARK: User properties
    let user_profile : User_Profile?
    
    //:MARK: Constructor
    init(user_ID : Int){
        user_profile = User_Profile(ID: user_ID)
        
        // Check if user ID exists
        if let database : Connection = try? Connection("") {
            let users : Table = Table("Users")
            let uid : Expression = Expression<Int>("ID_NUMBER")
            
            if let query_result : Int = try? database.scalar(users.filter(user_ID == uid).count) {
                
                // Things we need
                let sec : Table = Table("SecurityQuestions")
                let sid : Expression = Expression<Int>("USER_ID")
                let username : Expression = Expression<String>("NAME")
                let status : Expression = Expression<Int>("USER_STATUS")
                let email : Expression = Expression<String>("EMAIL")
                let password : Expression = Expression<String>("PASSWORD_HASH")
                let question1 : Expression = Expression<String>("QUESTION_ONE")
                let question2 : Expression = Expression<String>("QUESTION_TWO")
                let answer1 : Expression = Expression<String>("ANSWER_ONE")
                let answer2 : Expression = Expression<String>("ANSWER_TWO")
                
                if (query_result == 1) {
                    // User found, fill out profile from information on database
                    for row in try! database.prepare(users.filter(user_ID == uid)) {
                        var x = self.user_profile?.set_username(name : row[username])
                        var y = self.user_profile?.set_email_address(email : row[email])
                        self.user_profile?.set_password(password : row[password])
                    }
                    
                    for col in try! database.prepare(sec.filter(user_ID == sid)) {
                        self.user_profile?.set_security_question_1(q1: col[question1])
                        self.user_profile?.set_security_question_2(q2: col[question1])
                        self.user_profile?.set_security_question_1_ans(answer: col[answer1])
                        self.user_profile?.set_security_question_2_ans(answer: col[answer2])
                    }
                } else {
                    // User not found, add to database
                    try? database.run(users.insert(uid <- user_ID, username <- (self.user_profile?.get_user_name())!, email <- (self.user_profile?.get_email())!, password <- (self.user_profile?.get_password())!, status <- 0))
                    try? database.run(sec.insert(sid <- user_ID, question1 <- (self.user_profile?.get_security_question_1())!, question2 <- (self.user_profile?.get_security_question_2())!, answer1 <- (self.user_profile?.get_security_question_1_ans())!, answer2 <- (self.user_profile?.get_security_question_2_ans())!))
                }
            }
        }
    }
    
    func get_next_available_id () -> Int {
        if let database : Connection = try? Connection("") {
            let users : Table = Table("Users")
            let uid : Expression = Expression<Int>("ID_NUMBER")
            
            let query_result = try? database.scalar(users.select(uid.max))
            return query_result!! + 1
        }
        return -1
    }
    
    func user_cancelled_register (user_ID : Int) {
        if let database : Connection = try? Connection("") {
            let users : Table = Table("Users")
            let sec : Table = Table("SecurityQuestions")
            let uid : Expression = Expression<Int>("ID_NUMBER")
            let sid : Expression = Expression<Int>("USER_ID")
            
            let temp_user = users.filter(uid == user_ID)
            let temp_sec = sec.filter(sid == user_ID)
            
            try? database.run(temp_user.delete())
            try? database.run(temp_sec.delete())
            
        }
    }
}
