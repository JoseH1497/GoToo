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
