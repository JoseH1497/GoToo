
//  Created by Sergio Rosendo on 4/21/18.
//  Copyright © 2018 Reactive Works. All rights reserved.

import Foundation
import SQLite

class Account_Receovery{
    // Database attributes
    let database : Connection
    let Users    : Table      = Table("Users")
    let USER_ID  : Expression = Expression<Int>("ID_NUMBER")
    let EMAIL    : Expression = Expression<String>("EMAIL")
    
    var email             : String
    var user_id           : Int
    var selected_question : Int
    
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
        
        self.email             = ""
        self.user_id           = 0
        self.selected_question = 0
    }
    
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
    
    // Setters
    func set_email(_ email : String){
        self.email = email
    }
    
    func set_selected_question(_ question_num : Int){
        self.selected_question = question_num
    }
    
    func set_user_id(_ id : Int){
        self.user_id = id
    }
    
    // Getters
    func get_user_id() -> Int{
        return user_id
    }
}
