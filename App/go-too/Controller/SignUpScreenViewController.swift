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
        
    }
    @IBAction func emailed_entered(_ sender: UITextField) {
    }
    
    @IBAction func password_entered(_ sender: UITextField) {
    }
    
    @IBAction func password_confirmation_entered(_ sender: UITextField) {
    }
    
    @IBAction func sign_up_button_pressed(_ sender: UIButton) {
    }
}
