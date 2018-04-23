//  Created by Sergio Rosendo on 4/22/18.
//  Copyright © 2018 Reactive Works. All rights reserved.


import UIKit

class PasswordResetScreenViewController: UIViewController {
    //Account recovery continuation
    var account_recovery : Account_Receovery! = nil
    
    // Retriving user profile
    var user_profile : User_Profile! = nil
    
    // MARK: UI Functionality
    @IBAction func password_entered(_ sender: UITextField) {
        // Verifying that password meets the password criteria
        if let new_password : String =  sender.text{
            // Nothing is done when password field is empty
            if new_password.isEmpty{
                account_recovery.update_satisfied_requirements("new_password", false)
                return
                
            }else{
                let valid : Bool = user_profile.set_password(new_password)
                
                if valid {
                    account_recovery.update_satisfied_requirements("new_password", true)
                    
                }else{
                    account_recovery.update_satisfied_requirements("new_password", false)
                    display_error_message("Password must be 8 - 32 characters long")
                }
            }
        }
    }
    
    @IBAction func password_confirmation_entered(_ sender: UITextField) {
        // Verifying that password confirmation matches the previously entered password
        if let password_conf : String = sender.text{
            // Nothing is done when the password confirmation field is empty
            if password_conf.isEmpty{
                account_recovery.update_satisfied_requirements("password_conf", false)
                return
                
            }else{
                // Comparing the previously entered password to the confirmation password
                if password_conf == user_profile.get_password(){
                    account_recovery.update_satisfied_requirements("password_conf", true)
                    
                }else{
                    account_recovery.update_satisfied_requirements("password_conf", false)
                    display_error_message("Password and password confirmation do not match")
                }
            }
        }
    }
    
    @IBAction func continue_button_pressed(_ sender: UIButton) {
        //Determining if all password reset requirements have been completed
        let completed : Bool = account_recovery.verify_password_reset_completion()
        
        if completed{
            //Update new password in database
            user_profile.update_password()
            
            //Redirect user to completion screen
            performSegue(withIdentifier: "password_reset_to_completion_segue", sender: nil)
            
        }else{
            display_error_message("Password reset requirements have not been completed")
        }
    }
    
    
    func display_error_message(_ message : String){
        let alert  : UIAlertController = UIAlertController(title: "Password Reset Error", message: message, preferredStyle: .alert)
        let action : UIAlertAction     = UIAlertAction(title: "Try Again", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
}
