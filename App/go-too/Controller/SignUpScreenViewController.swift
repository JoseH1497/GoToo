//
//  SignUpScreenViewController.swift
//  go-too
//
//  Created by Sergio Rosendo on 4/2/18.
//  Copyright © 2018 Reactive Works. All rights reserved.
//

import UIKit
import SQLite

class SignUpScreenViewController: UIViewController {
    //:Initiate registration mechanism
    let registration : Registration = Registration()
   
    //:Create new user
    var user : User? = nil
    
    //:MARK: Preliminary functionality
    override func viewDidLoad() {
        super.viewDidLoad()
        //:Initialize new user
        self.user = User(user_ID: registration.get_next_available_id())
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //:MARK: UI Elements
    @IBAction func user_name_entered(_ sender: UITextField) {
        //:Textfield is not empty
        if let user_name : String = sender.text {
            //:Checking if username is already in use
            
        }
        //:Textfield is empty
        else{
            registration.set_username_satisfied(status: false)
        }
        
    }
    @IBAction func emailed_entered(_ sender: UITextField) {
        //:Textfield is not empty
        if let email : String = sender.text {
            
        }
        //:Textfield is empty
        else{
            registration.set_email_satisfied(status: false)
        }
    }
    
    @IBAction func password_entered(_ sender: UITextField) {
        //:Textfield is not empty
        if let password : String = sender.text {
            
        }
            //:Textfield is empty
        else{
            registration.set_password_satisfied(status: false)
        }
    }
    
    @IBAction func password_confirmation_entered(_ sender: UITextField) {
        //:Textfield is not empty
        if let password_confirmation : String = sender.text {
            
        }
            //:Textfield is empty
        else{
            registration.set_password_confirmation_satisfied(status: false)
        }
    }
    
    @IBAction func sign_up_button_pressed(_ sender: UIButton) {
        //:Check if all registration conditions have been satisfied
        if registration.registration_completed() {
            
        }
    }
}
