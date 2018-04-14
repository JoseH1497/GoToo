//
//  LoginScreenViewController.swift
//  go-too
//
//  Created by Sergio Rosendo on 4/2/18.
//  Copyright © 2018 Reactive Works. All rights reserved.
//

import UIKit
import SQLite

class LoginScreenViewController: UIViewController {
    //:Initiate login verification mechanism 
    let login_verification : Login_Verification = Login_Verification()
    
    
    //:MARK: Preliminary functionality................................................
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //:MARK: UI functionality........................................................
    @IBAction func email_entered(_ sender: UITextField) {
        //:Safely extract the email in text field
        //:NOTE:
        //:The following will not execute when there is no data in the text field
        if let user_email : String = sender.text{
            //:Update user email
            login_verification.set_user_email(email: user_email)
        }
    }
    
    @IBAction func password_entered(_ sender: UITextField) {
        //:Safely extract password in text field
        //:NOTE:
        //:The following will not execute when there is no data in the text field
        if let user_password : String = sender.text{
            //:Update user password
            login_verification.set_user_password(password: user_password)
        }
    }
    
    @IBAction func login_button_pressed(_ sender: UIButton) {
        //:Validate user information
        //:NOTE: If email and password are correct a unique user id associated with the account will be returned
        if let user_id : Int = login_verification.verify_user_info(){
            //:Direct user to home page
            //:TODO: TRANSFER USER ID TO THE NEXT VIEW CONTROLLER
            print(user_id)
            performSegue(withIdentifier:"login_to_home_segue" , sender: self)
        }
        else{
            //:Display login error message
            display_error_message()
        }
    }
    
    @IBAction func signup_button_pressed(_ sender: UIButton) {
        //:Redirect user to registration page
        performSegue(withIdentifier: "registration_page_segue", sender: self)
    }
    
    @IBAction func recovery_button_pressed(_ sender: UIButton) {
        //:Redirect user to account recovery page
        performSegue(withIdentifier: "recovery_page_segue", sender: self)
    }
    
    func display_error_message(){
        //:Create alert view controller (Pop up)
        let alertVC : UIAlertController = UIAlertController(title: "Login Error", message: "Invalid email or password" , preferredStyle: .alert)
        
        //Create alert action (Pop up button)
        let action : UIAlertAction = UIAlertAction(title: "Try Again", style: .default, handler: nil)
        alertVC.addAction(action)
        
        //:Present alert
        present(alertVC, animated: true, completion: nil)
    }
}
