//
//  Registration.swift
//  go-too
//
//  Created by Sergio Rosendo on 4/16/18.
//  Copyright © 2018 Reactive Works. All rights reserved.
//

import Foundation
import SQLite

class Registration{
    //:NOTE: There are 4 requirements that a user must satisfy when creating a GooToo account
    //:User must use a username and email that are not already in use
    //:User password and password confirmation must match
    var username_satisfied : Bool
    var email_satisfied    : Bool
    var password_satisfied : Bool
    var password_confirmation_satisfied : Bool
    
    
    init (){
        username_satisfied = false
        email_satisfied    = false
        password_satisfied = false
        password_confirmation_satisfied = false
    }

    //:Functions will determine when a condition is satisfied or disatisfied
    func set_username_satisfied (status : Bool){
        username_satisfied = status
    }
    
    func set_email_satisfied(status : Bool){
        email_satisfied = status
    }
    
    func set_password_satisfied(status : Bool){
        password_satisfied = status
    }
    
    func set_password_confirmation_satisfied(status : Bool){
        password_confirmation_satisfied = status
    }
    
    //:Function determines if all registration conditions have been satisfied 
    func registration_completed() -> Bool{
        if username_satisfied & email_satisfied & password_satisfied & password_confirmation_satisfied{
            return true
        }
        else {
            return false
        }
    }
    
    //:Function generates and returns the next available user id in the database
    func get_next_available_id () -> Int {
        var new_user_id : Int = 0
        
        if let database : Connection = try? Connection("/Users/serj/Desktop/Clone/SQLite_Database/backend_db.db") {
            let users : Table = Table("Users")
            let user_id   : Expression = Expression<Int>("ID_NUMBER")
            
            if let query_result : Int = try? database.scalar(users.select(user_id.max).count){
                new_user_id = query_result + 1
            }
            else{
                new_user_id = -1
            }
        }
        return new_user_id
    }
    
    //:Function deletes the space allocated in the database when user exits registration
    func user_cancelled_register (user_ID : Int) {
        if let database : Connection = try? Connection("/Users/serj/Desktop/Clone/SQLite_Database/backend_db.db") {
            let users : Table = Table("Users")
            let sec : Table = Table("SecurityQuestions")
            
            let uid : Expression = Expression<Int>("ID_NUMBER")
            let sid : Expression = Expression<Int>("USER_ID")
            
            let temp_user = users.filter(uid == user_ID)
            let temp_sec  = sec.filter(sid == user_ID)
            
            try! database.run(temp_user.delete())
            try! database.run(temp_sec.delete())
        }
    }
}
