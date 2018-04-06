//
//  LoginScreenViewController.swift
//  go-too
//
//  Created by Sergio Rosendo on 4/2/18.
//  Copyright © 2018 Reactive Works. All rights reserved.
//

import UIKit

class LoginScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //:MARK: UI functionality
    @IBAction func email_entered(_ sender: UITextField) {
    }
    
    @IBAction func password_entered(_ sender: UITextField) {
    }
    
    @IBAction func login_button_pressed(_ sender: UIButton) {
    }
    
    @IBAction func signup_button_pressed(_ sender: UIButton) {
        //:Redirect user to registration page
        performSegue(withIdentifier: "registration_page_segue", sender: self)
    }
    
    @IBAction func recovery_button_pressed(_ sender: UIButton) {
        //:Redirect user to account recovery page
        performSegue(withIdentifier: "recovery_page_segue", sender: self)
    }
}
