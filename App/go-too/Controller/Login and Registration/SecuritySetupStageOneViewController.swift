//
//  SecuritySetupStageOneViewController.swift
//  go-too
//
//  Created by Sergio Rosendo on 4/21/18.
//  Copyright © 2018 Reactive Works. All rights reserved.
//

import UIKit

class SecuritySetupStageOneViewController: UIViewController {
    // Registration continuation
    // User profile and registration form will be transfered from sign up screen view controller
    var new_user_profile  : User_Profile! = nil
    var registration_form : Registration! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UI Functionality
    @IBAction func security_question_entered(_ sender: UITextField) {
        if let question : String = sender.text{
            // Nothing is done when question field is empty
            if question.isEmpty{
                registration_form.update_satisfied_security_requirements("question_one", false)
                display_error_message("Invalid question")
                return
            }
            
            // Users are free to enter whatever they want
            // This will increase security as user can enter something they only understand
            new_user_profile.set_sec_ques(1, question)
            registration_form.update_satisfied_security_requirements("question_one", true)
        }
    }
    
    @IBAction func answer_entered(_ sender: UITextField) {
        if let answer : String = sender.text{
            // Nothing is done when answer field is empty
            if answer.isEmpty{
                registration_form.update_satisfied_security_requirements("answer_one", false)
                display_error_message("Invalid answer")
                return
            }
            
            // Users are free to enter whatever they want
            // This will increase security as user can enter something they only understand
            new_user_profile.set_sec_ques_ans(1, answer)
            registration_form.update_satisfied_security_requirements("answer_one", true)
        }
    }
    
    @IBAction func continue_button_pressed(_ sender: UIButton) {
        // Determining if security stage one has been completed
        if registration_form.verify_security_completion(level: 1){
            /// Security stage one was successfully completed
            // Redirect user to account security stage 2
            performSegue(withIdentifier: "sec_stage_one_sec_stage_two_segue", sender: nil)
            
        }else{
            //Security stage one is not completed
            display_error_message("Security setup has not been completed")
        }
        
    }
    
    func display_error_message(_ message : String){
        let alert : UIAlertController = UIAlertController(title: "Security Error", message: message, preferredStyle: .alert)
        
        let action : UIAlertAction = UIAlertAction(title: "Try Again", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    // The following function override allows us to transfer data between view controllers
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination : SecuritySetupStageTwoViewController = segue.destination as! SecuritySetupStageTwoViewController
        
        // Transfering data
        destination.new_user_profile  = self.new_user_profile
        destination.registration_form = self.registration_form
        
    }
}
