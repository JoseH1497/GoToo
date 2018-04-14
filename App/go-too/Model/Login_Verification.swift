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
    func verify_user_info() -> Bool{
        if verify_email(){
            if verify_password(){
                return true
            }
        }
        
        return false
    }
    
    func verify_email() -> Bool{
        //:FIXME: Check if email exists in database records
        
        let users = Table("Users")
        let EMAIL = Expression<String>("EMAIL")
        
        // var conn = "/Users/" + NSUserName() + "/Documents/GoToo/SQLite_Database/backend_db.db"
        // let db = try! Connection(conn)
        let db = try! Connection("/Users/user137911/Documents/GoToo/SQLite_Database/backend_db.db")
        
        let stmt = try! db.scalar(users.filter(EMAIL == email).count)
        
        if (stmt == 1) {
            return true
        }
        
        return false
    }
    
    func verify_password() -> Bool{
        //:FIXME: Check if password matches the password associated with the provided email
        
        let users = Table("Users")
        let EMAIL = Expression<String>("EMAIL")
        let PW = Expression<String>("PASSWORD_HASH")
        
        let db = try! Connection("/Users/user137911/Documents/GoToo/SQLite_Database/backend_db.db")
        
        let stmt = try! db.scalar(users.filter(EMAIL == email && PW == password).count)
        
        if (stmt == 1) {
            return true
        }
        
        return false
    }
}
