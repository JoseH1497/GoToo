//
//  Profile_Pop_Up_Screen.swift
//  go-too
//
//  Created by Sergio Rosendo on 5/3/18.
//  Copyright © 2018 Reactive Works. All rights reserved.
//

import UIKit

class Profile_Pop_Up_Screen: UIViewController {
    // User profile object will give us access to the user's personal information (for viewing and editing)
    var user_profile : User_Profile! = User_Profile()
    

    
    // MARK: UI Functionality
    // Function is triggered when exit button is pressed
    @IBAction func exit_button_pressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    // Function is triggered when the change username button is pressed
    @IBAction func change_username_button_pressed(_ sender: UIButton) {
        performSegue(withIdentifier: "Change_Username_Segue", sender: nil)
    }
    
    // Function is triggered when the change password button is pressed
    @IBAction func change_password_button_pressed(_ sender: UIButton) {
         performSegue(withIdentifier: "Change_Password_Segue", sender: nil)
    }
    
    // Function is triggered when the change security questions button is pressed
    @IBAction func change_security_questions_button_pressed(_ sender: UIButton) {
         performSegue(withIdentifier: "Change_Security_Questions_Segue", sender: nil)
    }
    
    
    
}
