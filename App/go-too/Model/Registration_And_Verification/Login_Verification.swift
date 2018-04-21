//  Created by Sergio Rosendo on 4/17/18.
// The following class will be used to verify user information during loggin and recovery processes

import Foundation
import SQLite

class Login_Verification{
    // Database attributes
    let database     : Connection
    let Users        : Table = Table("Users")
    let USER_ID      : Expression = Expression<Int>("ID_NUMBER")
    let USERNAME     : Expression = Expression<String>("NAME")
    let EMAIL        : Expression = Expression<String>("EMAIL")
    let PASSWORD     : Expression = Expression<String>("PASSWORD_HASH")
    
    // Login verification attributes
    var email        : String
    var password     : String
    
    
    init?(){
        // Attempting to connect database
        // Successful connection ---> initialization continues
        // Failed connection     ---> initialization stops and nil is returned
        do{
            database = try Connection("/Users/serj/Desktop/Clone/SQLite_Database/backend_db.db")
        }catch{
            print("Location: User_Verfication (CLASS)")
            print("Error: Failed to connect to database")
            return nil
        }
    
        self.email    = ""
        self.password = ""
    }
    
    
    func set_user_email(_ email : String){
        self.email = email
    }
    
    func set_user_password(_ password : String){
        self.password = password
    }
    

    // Function verifies information provided at log in
    // Successful verifiaction ---> returns user id
    // Failed verification     ---> return -1
    func verify_login_info() -> Int{
        var id : Int = -1
        
        if verify_email() && verify_password(){
            // Finding user id
            do{
                let matches = try database.prepare(Users.filter(self.email == EMAIL))
                
                for match in matches{
                    id = match[USER_ID]
                }
            }catch{
                print("Location: User_Verfication (CLASS)")
                print("Error: Query failure --- verify_login_info()")
            }
        }
        
        return id
    }
    
    // Function determines if provided email is associated with an account
    func verify_email() -> Bool{
        // Determining if provided email is associated with an account
        do{
            let query_result : Int = try database.scalar(Users.filter(self.email == EMAIL).count)
    
            if query_result == 1 {
                // Account has been found
                return true
            }
        }catch{
            print("Location: User_Verfication (CLASS)")
            print("Error: Query failure --- verify_email()")
        }
        
        // Account was not found
        return false
    }
    
    // Function determines if provided password corresponds the account of associated with the email provided
    func verify_password()->Bool{
        do{
            let query_result : Int = try database.scalar(Users.filter((self.email == EMAIL) && (self.password == PASSWORD)).count)
            
            if query_result == 1 {
                // Password corresponds to the provided email
                return true
            }
        }catch{
            print("Location: User_Verfication (CLASS)")
            print("Error: Query failure --- verify_password()")
        }
        
        // Password does not correspond to the provided email
        return false 
    }
}


