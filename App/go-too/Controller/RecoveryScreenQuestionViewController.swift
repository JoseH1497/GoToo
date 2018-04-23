//  Created by Sergio Rosendo on 4/21/18.
//  Copyright © 2018 Reactive Works. All rights reserved.

import UIKit

class RecoveryScreenQuestionViewController: UIViewController {
    //Account recovery continuation
    var account_recovery : Account_Receovery! = nil
    
   // Retriving user profile
    var user_profile : User_Profile! = nil
    
    // UI Attributes
    @IBOutlet weak var question_display_label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Selecting a random security question for user to answer
        let random_question_num : Int = Int(arc4random_uniform(1)) + 1
        
        account_recovery.set_selected_ques(random_question_num)
        account_recovery.set_selected_sec_ques_ans(user_profile.get_sec_ques_ans(random_question_num))
        
        //Displaying selected security question
        question_display_label.text = user_profile.get_sec_ques(random_question_num)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // UI Functionality
    @IBAction func answer_entered(_ sender: UITextField) {
        if let answer : String = sender.text{
            // Nothing is done when answer field is empty
            if answer.isEmpty{
                return
            }
            
            // Setting provided answer for verification
            account_recovery.set_provided_ans(answer)
        }
    }
    
    @IBAction func continue_button_pressed(_ sender: UIButton) {
        // Verifying provided answer
        let correct_answer : Bool = account_recovery.verify_sec_ques_ans()
        
        if correct_answer{
            performSegue(withIdentifier: "security_question_to_password_reset_segue", sender: nil)
            
        }else{
            display_error_message("Incorrect answer to security question")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination : PasswordResetScreenViewController = segue.destination as! PasswordResetScreenViewController
        
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
