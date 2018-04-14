//
//  Login_Verification.swift
//  go-too
//
//  Created by Sergio Rosendo on 4/6/18.
//  Copyright © 2018 Reactive Works. All rights reserved.
//

import Foundation
import SQLite

class Login_Verification {
    var email    : String
    var password : String
    
    //:Constructors..............................................................................
    init(){
        email    = ""
        password = ""
    }
    
    //:Information setters.......................................................................
    func set_user_email(email : String){
        self.email = email
    }
    
    func set_user_password(password : String){
        self.password = password
    }
    
    //:Information verifiers....................................................................
    func verify_user_info() -> Int?{
        if verify_email(){
            if verify_password(){
                //:TODO: RETURN USER ID ASSOCIATED WITH PROVIDE EMAIL
                return 333
            }
        }
        
        return nil
    }
    
    func verify_email() -> Bool{
        //:Attempting to conncet to database
        if let database : Connection = try? Connection("/Users/serj/Documents/Application/SQLite_Database/backend_db.db"){
            //:Determining if email exists in database
            let users : Table      = Table("Users")
            let email : Expression = Expression<String>("email")
            
            if let query_result : Int  = try? database.scalar(users.filter(email == self.email).count){
                if query_result == 1 {
                    return true
                }
                else{
                    return false
                }
            }
            else{
                print("EMAIL VERIFICATION --- Query Failure")
                return false
            }
        }
        else{
            print("EMAIL VERIFICATION --- Failed to connect to database")
            return false
        }
    }
    
    func verify_password() -> Bool{
        //:Attempting to conncet to database
        if let database : Connection = try? Connection("/Users/serj/Documents/Application/SQLite_Database/backend_db.db"){
            //:Determining if password corresponds to provided email
            let users : Table         = Table("Users")
            let email : Expression    = Expression<String>("EMAIL")
            let password : Expression = Expression<String>("PASSWORD_HASH")
            
            if let query_result : Int = try? database.scalar(users.filter(email == self.email && password == self.password).count){
                if query_result == 1 {
                    return true
                }
                else{
                    return false
                }
            }
            else{
                print("PASSWORD VERIFICATION --- Query Failure")
                return false
            }
        }
        else{
            print("PASSWORD VERIFICATION --- Failed to connect to database")
            return false
        }
    }
}
