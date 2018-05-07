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
    // Initiate User Verification Mechanism
    let verification : Login_Verification! = Login_Verification()
    
    // MARK: Preliminary functionality.
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: UI Functionality
    @IBAction func email_entered(_ sender: UITextField) {
        if let email : String = sender.text{
            verification.set_user_email(email)
        }
    }
    
    @IBAction func password_entered(_ sender: UITextField) {
        if let password : String = sender.text{
            verification.set_user_password(password)
        }
    }
    
    @IBAction func login_button_pressed(_ sender: UIButton) {
        // Verify provided user information
        let valid = verification.verify_login_info()
        
        if valid {
            performSegue(withIdentifier: "login_home_segue", sender: nil)
            //:FIXME: PASS USER ID TO NEXT VIEW CONTROLLER
            
        }else{
            display_error("Login Error", "Invalid email or password")
        }
    }
    
    // Function redirects user to sign up page
    @IBAction func sign_up_button_pressed(_ sender: UIButton) {
        performSegue(withIdentifier: "login_registration_segue", sender: nil)
    }
    
    // Function redirects user to recovery page
    @IBAction func recovery_button_page(_ sender: UIButton) {
        performSegue(withIdentifier: "login_recovery_segue", sender: nil)
    }
    
    // MARK: Error Handling
    func display_error(_ title : String , _ message : String){
        let alert : UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action : UIAlertAction = UIAlertAction(title: "Try Again", style: .default, handler: nil)
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    // The following function override allows us to transfer data between view controllers
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination : HomeScreenViewController = segue.destination as! HomeScreenViewController
        
        // Transfering data
        destination.home = Home(user_id: verification.get_user_id())
    }
}
