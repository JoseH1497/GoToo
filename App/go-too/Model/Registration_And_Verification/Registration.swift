//  Created by Sergio Rosendo on 4/21/18.
// The following class will be used during the registration processs

import Foundation
import SQLite

class Registration{
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
    
    
    // NOTE: There are 4 requirements that a user must satisfy when creating a GooToo account
    // Username              --> Must be unique and and not associated with an existing account
    // Email                 --> Must not be associated with an existing account
    // Password              --> Must satisfy password criteria
    // Password Confirmation --> Must match the previously entered password
    var requirements          : [String : Bool]
    
    
    var security_requirements : [String : Bool]
    
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
        
        requirements          = ["username" : false , "email" : false , "password" : false , "password_conf" : false]
        security_requirements = ["question_one" : false , "question_two" : false , "answer_one" : false , "answer_two" : false]
    }

    // Function determines if registration was successfully completed
    func verify_registration_completion() -> Bool{
        // Determining if registration is completed
        let username_status      : Bool! = self.requirements["username"]
        let email_status         : Bool! = self.requirements["email"]
        let password_status      : Bool! = self.requirements["password"]
        let password_conf_status : Bool! = self.requirements["password_conf"]
        
        if username_status && email_status && password_status && password_conf_status{
            return true
        }
        
        return false
    }
    
    // Function determines if security stage has been completed
    func verify_security_completion(level : Int) -> Bool{
        switch level{
        case 1:
            let question_one_status : Bool! = security_requirements["question_one"]
            let answer_one_status   : Bool! = security_requirements["answer_one"]
            
            if question_one_status && answer_one_status{
                // Security stage one has not been completed
                return true
            }
        case 2:
            let question_two_status : Bool! = security_requirements["question_two"]
            let answer_two_status   : Bool! = security_requirements["answer_two"]
            
            if question_two_status && answer_two_status{
                // Security stage two has not been completed
                return true
            }
        default:
            // Silence switch statement warning
            return false
        }
        
        // Security stage has not been completed
        return false
    }
    
    // Function updates the requirements checklist
    func update_satisfied_requirements(_ req_name : String , _ status : Bool){
        requirements[req_name] = status
    }
    
    // Function updates the security requirements checklist
    func update_satisfied_security_requirements(_ req_name : String , _ status : Bool){
        security_requirements[req_name] = status
    }
    
    // Function generates and returns the next available user id in the database
    func get_next_available_id () -> Int {
        var new_user_id : Int = -1
        
        do{
            let query_result : Int = try database.scalar(Users.select(USER_ID.max).count)
            new_user_id = query_result + 1
            
        }catch{
            print("Location: User_Profile (CLASS)")
            print("Error: Query failure --- get_next_available_id()")
        }
        
        return new_user_id
    }
    
    // Function creates space for a new user in the database
    func create_new_user_in_database(profile : User_Profile){
        // Extracting information from user profile
        let user_id  : Int = profile.get_user_id()
        let username : String = profile.get_username()
        let email    : String = profile.get_email()
        let password : String = profile.get_password()
        
        let status   : Int    = profile.get_status()
        
        let question_one : String = profile.get_sec_ques(1)
        let question_two : String = profile.get_sec_ques(2)
        let answer_one   : String = profile.get_sec_ques_ans(1)
        let answer_two   : String = profile.get_sec_ques_ans(2)

        // Attempting to create a new user in databse
        do{
            try database.run(Users.insert(USER_ID <- user_id , USERNAME <- username , EMAIL <- email , PASSWORD <- password , STATUS <- status))
            
            try database.run(Sec_Ques.insert(USER_ID <- user_id , QUESTION_ONE <- question_one , ANSWER_ONE <- answer_one , QUESTION_TWO <- question_two , ANSWER_TWO <- answer_two))
            
        }catch{
            print("Location: Registration (CLASS)")
            print("Error: Failed to create new user in database --- create_new_user_in_database()")
        }
    }
    
    // Function deletes the space allocated in the database when user exits registration
    func user_cancelled_register (user_ID : Int) {
        let allocated_user_table_space     = Users.filter(user_ID == USER_ID)
        let allocated_sec_ques_table_space = Sec_Ques.filter(user_ID == USER_ID)
        
        // Attempting to deallocate database space
        do{
            try database.run(allocated_user_table_space.delete())
            try database.run(allocated_sec_ques_table_space.delete())
            
        }catch{
            print("Location: User_Profile (CLASS)")
            print("Error: Database Space Deallocation Failure --- user_cancelled_register()")
        }
    }
}
