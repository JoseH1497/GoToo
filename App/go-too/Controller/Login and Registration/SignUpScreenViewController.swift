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
    // Create a New User Profile
    let new_user_profile : User_Profile! = User_Profile()
    
    // Initiate Registration Process
    let registration_form : Registration! = Registration()
    
    
    // MARK: Preliminary functionality
    override func viewDidLoad() {
        super.viewDidLoad()
        // Assign the new user the next available user ID
        new_user_profile.set_user_id(registration_form.get_next_available_id())
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: UI Functionality
    @IBAction func username_entered(_ sender: UITextField) {
        if let username : String = sender.text{
            // Nothing is done when username field is empty
            if username.isEmpty{
                registration_form.update_satisfied_requirements("username", false)
                return
            }
            
            //Determining if username is available
            let available : Bool = new_user_profile.set_username(username)
            
            if available{
                registration_form.update_satisfied_requirements("username" , true)
                
            }else{
                registration_form.update_satisfied_requirements("username" , false)
                display_error_message("Username not available")
                
            }
        }
    }
    
    @IBAction func email_entered(_ sender: UITextField) {
        if let email : String = sender.text{
            // Nothing is done when the email field is empty
            if email.isEmpty{
                registration_form.update_satisfied_requirements("email", false)
                return
            }
            
            // Determining if email is available
            let available : Bool = new_user_profile.set_email(email)
            
            if available{
                registration_form.update_satisfied_requirements("email", true)
                
            }else{
                registration_form.update_satisfied_requirements("email", false)
                display_error_message("Email is already in use")
            }
        
        }
    }
    
    @IBAction func password_entered(_ sender: UITextField) {
        if let password : String = sender.text{
            // Nothing is done when password field is empty
            if password.isEmpty{
                registration_form.update_satisfied_requirements("password", false)
                return
            }

            // Determining if password satisfied requirements
            let passed_requirements : Bool = new_user_profile.set_password(password)
            
            if passed_requirements{
                registration_form.update_satisfied_requirements("password", true)
                
            }else{
                registration_form.update_satisfied_requirements("password", false)
                display_error_message("Password must be 8 - 32 characters long")
            }
            
        }
    }
    
    @IBAction func password_conf_entered(_ sender: UITextField) {
        if let password_conf : String = sender.text{
                // Nothing is done when password confirmation field is empty
            if password_conf.isEmpty{
                registration_form.update_satisfied_requirements("password_conf", false)
                return
            }
            
            // Determining if password confirmation matches the previously provided password
            if password_conf == new_user_profile.get_password(){
                registration_form.update_satisfied_requirements("password_conf", true)
                
            }else{
                registration_form.update_satisfied_requirements("password_conf", false)
                display_error_message("Password and confirmation password do not match")
            }
        }

    }
    
    @IBAction func sign_up_button_pressed(_ sender: UIButton) {
        // Determining if registration was successfully completed
        if registration_form.verify_registration_completion(){
            // Registration was successfully completed
            // Redirect user to account security setup
            performSegue(withIdentifier: "registration_sec_ques_one_segue", sender: nil)
        }else{
            //Registration is not completed
            display_error_message("Registration has not been completed")
        }
    }
    
    func display_error_message(_ message : String){
        let alert : UIAlertController = UIAlertController(title: "Registration Error", message: message, preferredStyle: .alert)
        
        let action : UIAlertAction = UIAlertAction(title: "Try Again", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    // The following function override allows us to transfer data between view controllers
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination : SecuritySetupStageOneViewController = segue.destination as! SecuritySetupStageOneViewController
        
        // Transfering data
        destination.new_user_profile  = self.new_user_profile
        destination.registration_form = self.registration_form
      
    }
    
}

