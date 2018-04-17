//
//  User.swift
//  go-too
//
//  Created by Sergio Rosendo on 4/16/18.
//  Copyright © 2018 Reactive Works. All rights reserved.
//

import Foundation
import SQLite

class User{
    //:MARK: User properties
    let user_profile : User_Profile?
    
    //:MARK: Constructor
    init(user_ID : Int){
        user_profile = User_Profile(ID: user_ID)
    }
}

