
//  Created by Sergio Rosendo on 4/21/18.
//  Copyright © 2018 Reactive Works. All rights reserved.

import Foundation
import SQLite

class Account_Receovery{
    // MARK: Database Attributes
    let database : Connection
    let Users    : Table      = Table("Users")
    let USER_ID  : Expression = Expression<Int>("ID_NUMBER")
    let EMAIL    : Expression = Expression<String>("EMAIL")
    
    // MARK: Account Recovery Attributes
    var user_id      : Int
    var email        : String
    
    // Keeps track of the security question that was selected at random
    var sec_ques_num : Int
    var sec_ques_ans : String
    
    var provided_ans : String
    
    var password_reset_reqs : [String : Bool]
    
    // MARK: Initializers
    init?(){
        // Attempting to connect database
        // Successful connection ---> initialization continues
        // Failed connection     ---> initialization stops and nil is returned
        do{
            self.database = try Connection("/Users/serj/Desktop/Clone/SQLite_Database/backend_db.db")
            
        }catch{
            print("Location: Registration (CLASS)")
            print("Error: Failed to connect to database")
            return nil
        }
        
        // Initializing account recovery attributes
        self.email        = ""
        self.user_id      = 0
        
        self.sec_ques_num = 0
        self.sec_ques_ans = ""
        
        self.provided_ans = ""
        
        self.password_reset_reqs = ["new_password" : false , "password_conf" : false]
        
    }
    
    // MARK: Information Verifiers
    // Function determines if the provided email is associated with an account
    // Successful verifiaction ---> returns user id
    // Failed verification     ---> return -1
    func verify_email() -> Int{
        var id : Int = -1
        
        // Attempting to find the user profile associated with the provided email
        do{
            let matches = try database.prepare(Users.filter(self.email == EMAIL))
            
            for match in matches{
                id = match[USER_ID]
            }
        }catch{
            print("Location: Account_Recovery (CLASS)")
            print("Error: Query failure --- verify_email()")
        }
        
        return id
    }
    
    func verify_sec_ques_ans() -> Bool{
        if self.sec_ques_ans == self.provided_ans{
            return true
        }
        
        return false
    }
    
    // Function determines if registration was successfully completed
    func verify_password_reset_completion() -> Bool{
        let new_password_status  : Bool = self.password_reset_reqs["new_password"]!
        let password_conf_status : Bool = self.password_reset_reqs["password_conf"]!
    
        
        if new_password_status && password_conf_status{
            // Requirements have been completed
            return true
        }
        
        // Requirements have not been completed
        return false
    }
    
    
    // MARK: Information Setters
    func set_user_id(_ id : Int){
        self.user_id = id
    }
    
    func set_email(_ email : String){
        self.email = email
    }
    
    func set_selected_ques(_ question_num : Int){
        self.sec_ques_num = question_num
    }
    
    func set_selected_sec_ques_ans(_ answer : String){
        self.sec_ques_ans = answer
    }
    
    func set_provided_ans(_ answer : String){
        self.provided_ans = answer
    }
    
    // Function updates the requirements checklist
    func update_satisfied_requirements(_ req_name : String , _ status : Bool){
        self.password_reset_reqs[req_name] = status
    }

    // MARK: Information Getters
    func get_user_id() -> Int{
        return user_id
    }
}
