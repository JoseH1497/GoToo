//
//  Login_Verification.swift
//  go-too
//
//  Created by Sergio Rosendo on 4/6/18.
//  Copyright © 2018 Reactive Works. All rights reserved.
//

import Foundation

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
                return 
            }
        }
        
        return nil
    }
    
    func verify_email() -> Bool{
        //:FIXME: Check if email exists in database records
        
        return false
    }
    
    func verify_password() -> Bool{
        //:FIXME: Check if password matches the password associated with the provided email
        return false
    }
}
