//  Created by Sergio Rosendo on 4/2/18.
//  Copyright © 2018 Reactive Works. All rights reserved.

import UIKit

class RecoveryScreenViewController: UIViewController {
    // Initiate account recovery mechanism
    let account_recovery : Account_Receovery! = Account_Receovery()
    
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
            // Nothing is done when email field is empty
            if email.isEmpty{
                return
            }
            
            // Setting email for future verification
            account_recovery.set_email(email)
        }
    }
    
    @IBAction func continue_button_pressed(_ sender: UIButton) {
        // Attempting to find user id associated with provided email
        let id : Int = account_recovery.verify_email()
        
        // Email is associated with account
        if id > 0{
            account_recovery.set_user_id(id)
            performSegue(withIdentifier: "account_recovery_email_question_segue", sender: nil)
            
        }else{
            display_error_message("Email is not associated with an account")
        }
    }
    
    // The following function override allows us to transfer data between view controllers
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination : RecoveryScreenQuestionViewController = segue.destination as! RecoveryScreenQuestionViewController
        
        // Transfering data
        destination.account_recovery = self.account_recovery
        destination.user_profile     = User_Profile(account_recovery.get_user_id())
    }
    
    func display_error_message(_ message : String){
        let alert  : UIAlertController = UIAlertController(title: "Account Recovery Error", message: message, preferredStyle: .alert)
        let action : UIAlertAction     = UIAlertAction(title: "Try Again", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
}
