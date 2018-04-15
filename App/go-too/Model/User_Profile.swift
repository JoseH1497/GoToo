//  User_Profile.swift
//  Created by Sergio Rosendo on 4/12/18.

import Foundation

class User_Profile {
    //:MARK: Properties
    let USER_ID : Int

    var user_name : String
    var email_address : String
    var password : String

    var security_question_1 : String
    var security_question_2 : String

    var security_question_1_ans : String
    var security_question_2_ans : String


    //:MARK: Constructor
    init (ID : Int) {
        self.USER_ID = ID

        //:TODO: RETRIEVE INFORMATION FROM DATABASE ASSOCIATED WITH PROVIDED USER ID
        //:NOTE: THE PROVIDED USER ID CAN BE LINKED TO AN EXISTING ACCOUNT (CONTAINS PERSONAL INFO) OR TO A NEW ACCOUNT (CONTAINS DEFAULT VALUES)
        //:USE ID NOT USER_ID TO RETRIEVE THE INFORMATION
        self.user_name     =
        self.email_address =
        self.password      =

        self.security_question_1 =
        self.security_question_2 =

        self.security_question_1_ans =
        self.security_question_2_ans =
    }

    //:MARK: Setters / Database Updaters
    func set_user_name (name : String) {
        self.user_name = name
        //:TODO: UPDATE USER NAME IN DATABASE
    }

    func set_email_address (email : String) {
        self.email_address = email
        //:TODO: SET USER EMAIL IN DATABASE
    }

    func set_password (password : String){
        //:TODO: CALL A FUNCTION THAT ENCRYPTS THE PROVIDED PASSWORD
        self.password =
        //:TODO: UPDATE PASSWORD IN DATABASE
    }

    func set_security_question_1 (q1 : String) {
        self.security_question_1 = q1
        //:TODO: UPDATE SECURITY QUESTION 1 IN DATABASE

    }

    func set_security_question_2 (q2 : String) {
        self.security_question_2 = q2
        //:TODO: UPDATE SECURITY QUESTION 2 IN DATABASE
    }

    func set_security_question_1_ans (answer : String) {
        //:TODO: CALL A FUNCTION THAT ENCRYPTS THE PROVIDED ANSWER
        self.security_question_1_ans =

        //:TODO: UPDATE SECURITY QUESTION 1 ANSWER IN DATABASE

    }

    func set_security_question_2_ans (answer : String) {
        //:TODO: CALL A FUNCTION THAT ENCRYPTS THE PROVIDED ANSWER

        self.security_question_2_ans =
        //:TODO: UPDATE SECURITY QUESTION 2 ANSWER IN DATABASE

    }


    //:MARK: Getters
    func get_user_id () -> Int {
        return self.USER_ID
    }

    func get_user_name () -> String{
        return self.user_name
    }

    func get_email () -> String{
        return self.email_address
    }

    func get_password () -> String{
        //:TODO: RETURN UNENCRYPTED PASSWORD
        return
    }

    func get_security_question_1 () -> String{
        return self.security_question_1
    }

    func get_security_question_2 () -> String{
        return self.security_question_2
    }

    func get_security_question_1_ans () -> String{
        return self.security_question_1_ans
    }

    func get_security_question_2_ans () -> String{
        return self.security_question_2_ans
    }
}
