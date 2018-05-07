//
//  Home.swift
//  go-too
//
//  Created by Sergio Rosendo on 5/6/18.
//  Copyright © 2018 Reactive Works. All rights reserved.
//

import Foundation
import SQLite

class Home{
    // Database properties
    let Groups : Table = Table("Groups")
    let Group_Users = Table("Group_Users")
    
    let GROUP_ID     : Expression = Expression<Int>("GROUP_ID")
    let GROUP_ID_NUM : Expression = Expression<Int>("GROUP_ID_NUM")
    let GROUP_NAME   : Expression = Expression<String>("GROUP_NAME")
    let USER_ID      : Expression = Expression<Int>("ID_NUMBER")
    
    var database     : Connection
    
    // Home properties
    var user_id     : Int
    var groups_list : [(group_name : String, group_id: Int)]


    init?(){
        // Attempting to connect database
        // Successful connection ---> initialization continues
        // Failed connection     ---> initialization stops and nil is returned
        do{
            self.database = try Connection("/Users/serj/Desktop/Clone/SQLite_Database/backend_db.db")
            
        }catch{
            print("Location: Home (CLASS)")
            print("Error: Failed to connect to database")
            return nil
        }
        
        self.user_id      = 0
        self.groups_list  = []
    }
    
    convenience init?(user_id : Int){
        self.init()
        self.user_id = user_id
        
        // Setting up groups list
        // Join the Groups and Group_Users Table
        let joined_table = Groups.join(Group_Users, on: GROUP_ID == Group_Users[GROUP_ID_NUM])
        
        // Get the groups the user is in and loop through adding to the table
        do{
            let groups = try database.prepare(joined_table.filter(USER_ID == user_id))
            
            for group in groups{
                groups_list.append((group_name: group[GROUP_NAME], group_id: group[GROUP_ID]))
            }
        }catch{
            print("Location: Home (CLASS)")
            print("Error: Query failure --- convenience init()")
        }
    }
}
