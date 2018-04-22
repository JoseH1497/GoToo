//  Created by Sergio Rosendo on 4/17/18.
// The following class will contain and organize users account information

import Foundation
import SQLite

class User_Profile{
    // Database attributes
    var database     : Connection
    
    let Users        : Table = Table("Users")
    let Sec_Ques     : Table = Table("Security_Questions")
    
    let USER_ID      : Expression = Expression<Int>("ID_NUMBER")
    let USERNAME     : Expression = Expression<String>("NAME")
    let EMAIL        : Expression = Expression<String>("EMAIL")
    let PASSWORD     : Expression = Expression<String>("PASSWORD_HASH")
    let STATUS       : Expression = Expression<Int>("USER_STATUS")
    let QUESTION_ONE : Expression = Expression<String>("QUESTION_ONE")
    let QUESTION_TWO : Expression = Expression<String>("QUESTION_TWO")
    let ANSWER_ONE   : Expression = Expression<String>("ANSWER_ONE")
    let ANSWER_TWO   : Expression = Expression<String>("ANSWER_TWO")
    
    
    //Account attributes
    var user_id  : Int
    var username : String
    var email    : String
    var password : String
    
    var status   : Int
    
    var sec_ques_one     : String
    var sec_ques_two     : String
    var sec_ques_one_ans : String
    var sec_ques_two_ans : String
    
    // Initializer will be use to create user profiles for new users
    init?(){
        // Attempting to connect database
        // Successful connection ---> initialization continues
        // Failed connection     ---> initialization stops and nil is returned
        do{
            self.database = try Connection("/Users/serj/Desktop/Clone/SQLite_Database/backend_db.db")
        }catch{
            print("Location: User_Profile (CLASS)")
            print("Error: Failed to connect to database")
            return nil
        }
        
        user_id  = 0
        username = ""
        email    = ""
        password = ""
        
        status = 0
        
        sec_ques_one     = ""
        sec_ques_two     = ""
        sec_ques_one_ans = ""
        sec_ques_two_ans = ""
    }
    
    // Initializer will be used to create profiles of existing users
    convenience init?(_ ID : Int){
        self.init()
        
        self.user_id = ID
        
        // Retrieving user information
        do{
            let user_table_matches = try database.prepare(Users.filter(ID == USER_ID))
            let sec_table_matches  = try database.prepare(Sec_Ques.filter(ID == USER_ID))
            
            for match in user_table_matches{
                self.username = match[USERNAME]
                self.email    = match[EMAIL]
                self.password = match[PASSWORD]
                self.status   = match[STATUS]
            }
            
            for match in sec_table_matches{
                self.sec_ques_one     = match[QUESTION_ONE]
                self.sec_ques_two     = match[QUESTION_TWO]
                self.sec_ques_one_ans = match[ANSWER_ONE]
                self.sec_ques_two_ans = match[ANSWER_TWO]
            }
        }catch{
            print("Location: User_Profile (CLASS)")
            print("Error: Query failure --- init()")
            return nil
        }
        
    }
    
    // MARK: Information Setters
    func set_user_id(_ ID : Int){
        
        self.user_id = ID
    }
    
    // Function determines if the provided name is already associated with an account
    // Return values:
    // False ---> Username is not available
    // True  ---> Username is available
    func set_username(_ username : String) -> Bool{
        // Checking if username is available
        do{
            let query_results : Int = try database.scalar(Users.filter(username == USERNAME).count)
        
            if query_results == 1 {
                // Username is not available
                return false
                
            }else{
                // Username is available
                self.username = username
                return true
            }
            
        }catch{
            print("Location: User_Profile (CLASS)")
            print("Error: Query failure --- set_username()")
        }
        
        // Silence warning
        return false
    }
    
    // Function determines if the provided email is already associated with an account
    // Return values:
    // False ---> Email is not available
    // True  ---> Email is available
    func set_email(_ email : String) -> Bool{
        // Checking if email is a vailable
        do{
            let query_result : Int = try database.scalar(Users.filter(email == EMAIL).count)
            if query_result == 1{
                // Username is not available
                return false
                
            }else{
                // Email is available
                self.email = email
                return true
            }
            
        }catch{
            print("Location: User_Profile (CLASS)")
            print("Error: Query failure --- set_email()")
        }
        
        // Silence warning
        return false
    }
    
    // Function determines if the provided password satisfies the password criteria
    // Current requirements:
    // 1) Password must be 8 - 32 characters long
    // TODO: Set more password check in the future
    func set_password(_ password : String) -> Bool{
        // Check if password is longer than eight chracters
        if (password.count >= 8) && (password.count <= 32){
            self.password = password
            return true
        }
        
        //Password does not satisfy the requirements
        return false
    }
    
    func set_status(_ status : Int){
        self.status = status
    }
    
    func set_sec_ques(_ ques_num : Int , _ question : String){
        switch(ques_num){
        case 1:
            self.sec_ques_one = question
        case 2:
            self.sec_ques_two = question
        default:
            break
        }
    }
    
    func set_sec_ques_ans(_ ques_num : Int , _ ans : String){
        switch(ques_num){
        case 1:
            self.sec_ques_one_ans = ans
        case 2:
            self.sec_ques_two_ans = ans
        default:
            break
        }
    }
    
    // MARK: Information Getters
    func get_user_id() -> Int{
        return self.user_id
    }
    
    func get_username() -> String{
        return self.username
    }
    
    func get_email() -> String{
        return self.email
    }
    
    func get_password() -> String{
        return self.password
    }
    
    func get_status() -> Int{
        return self.status
    }
    
    func get_sec_ques(_ ques_num : Int) -> String{
        switch(ques_num){
        case 1:
            return sec_ques_one
        case 2:
            return sec_ques_two
        default:
            return "WILL NEVER GET HERE"
        }
    }
    
    func get_sec_ques_ans(_ ques_num : Int) -> String{
        switch(ques_num){
        case 1:
            return sec_ques_one_ans
        case 2:
            return sec_ques_two_ans
        default:
            return "WILL NEVER GET HERE"
        }
    }
    
    // MARK: Database Updaters
    func update_user_id(){
        // Finding user in databse
        let user = Users.filter(self.user_id == USER_ID)
        
        // Attempting to update information
        do{
            try database.run(user.update(USER_ID <- self.user_id))
            
        }catch{
            print("Location: User_Profile (CLASS)")
            print("Error: Database Update Failure --- update_user_id()")
        }
    }
    
    func update_username(){
        // Finding user in databse
        let user = Users.filter(self.user_id == USER_ID)
        
        // Attempting to update information
        do{
            try database.run(user.update(USERNAME <- self.username))
            
        }catch{
            print("Location: User_Profile (CLASS)")
            print("Error: Database Update Failure --- update_username()")
        }
    }
    
    func update_email(){
        // Finding user in databse
        let user = Users.filter(self.user_id == USER_ID)
        
        // Attempting to update information
        do{
            try database.run(user.update(EMAIL <- self.email))
            
        }catch{
            print("Location: User_Profile (CLASS)")
            print("Error: Database Update Failure --- update_email()")
        }
    }
    
    func update_password(){
        // Finding user in databse
        let user = Users.filter(self.user_id == USER_ID)
        
        // Attempting to update information
        do{
            try database.run(user.update(PASSWORD <- self.password))
            
        }catch{
            print("Location: User_Profile (CLASS)")
            print("Error: Database Update Failure --- update_password()")
        }
    }
    
    func update_status(){
        // Finding user in databse
        let user = Users.filter(self.user_id == USER_ID)
        
        // Attempting to update information
        do{
            try database.run(user.update(STATUS <- self.status))
            
        }catch{
            print("Location: User_Profile (CLASS)")
            print("Error: Database Update Failure --- update_status()")
        }
    }
    
    func update_sec_ques(_ ques_num : Int){
        // Finding user in databse
        let user = Users.filter(self.user_id == USER_ID)
        
        // Attempting to update information
        do{
            switch(ques_num){
            case 1:
                try database.run(user.update(QUESTION_ONE <- self.sec_ques_one))
            case 2:
                try database.run(user.update(QUESTION_TWO <- self.sec_ques_two))
            default:
                break
            }
        }catch{
            print("Location: User_Profile (CLASS)")
            print("Error: Database Update Failure --- update_sec_ques()")
        }
    }
    
    func update_sec_ques_ans(_ ques_num : Int , _ ans : String){
        // Finding user in databse
        let user = Users.filter(self.user_id == USER_ID)
        
        // Attempting to update information
        do{
            switch(ques_num){
            case 1:
                try database.run(user.update(ANSWER_ONE <- self.sec_ques_one_ans))
            case 2:
                try database.run(user.update(ANSWER_TWO <- self.sec_ques_two_ans))
            default:
                break
            }
        }catch{
            print("Location: User_Profile (CLASS)")
            print("Error: Database Update Failure --- update_sec_ques_ans()")
        }
    }
}
