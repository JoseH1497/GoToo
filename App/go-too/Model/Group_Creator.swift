//
//  Group_Creator.swift
//  go-too
//
//  Created by Sergio Rosendo on 5/7/18.
//  Copyright © 2018 Reactive Works. All rights reserved.
//

import Foundation
import SQLite

class Group_Creator {
    // Database properties
    var database       : Connection
    
    // Group creator properties
    var user_id        : Int
    var new_group_name : String
    
    init?(user_id: Int){
        // Attempting to connect database
        // Successful connection ---> initialization continues
        // Failed connection     ---> initialization stops and nil is returned
        do{
            self.database = try Connection("/Users/serj/Desktop/Clone/SQLite_Database/backend_db.db")
            
        }catch{
            print("Location: Groups_Creator (CLASS)")
            print("Error: Failed to connect to database")
            return nil
        }
        
        // Initializing Group Creator Properties
        self.user_id        = user_id
        self.new_group_name = ""
    }
}
