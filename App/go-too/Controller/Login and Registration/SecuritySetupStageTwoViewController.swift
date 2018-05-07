//
//  SecuritySetupStageTwoViewController.swift
//  go-too
//
//  Created by Sergio Rosendo on 4/21/18.
//  Copyright © 2018 Reactive Works. All rights reserved.
//

import UIKit

class SecuritySetupStageTwoViewController: UIViewController {
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
                registration_form.update_satisfied_security_requirements("question_two", false)
                display_error_message("Invalid question")
                return
            }
            
            // Users are free to enter whatever they want
            // This will increase security as user can enter something they only understand
            new_user_profile.set_sec_ques(2, question)
            registration_form.update_satisfied_security_requirements("question_two", true)
        }
    }
    
    @IBAction func answer_entered(_ sender: UITextField) {
        if let answer : String = sender.text{
            // Nothing is done when answer field is empty
            if answer.isEmpty{
                registration_form.update_satisfied_security_requirements("answer_two", false)
                display_error_message("Invalid answer")
                return
            }
            
            // Users are free to enter whatever they want
            // This will increase security as user can enter something they only understand
            new_user_profile.set_sec_ques_ans(2, answer)
            registration_form.update_satisfied_security_requirements("answer_two", true)
        }
    }
    
    @IBAction func continue_button_pressed(_ sender: UIButton) {
        // Determining if security stage two has been completed
        if registration_form.verify_security_completion(level: 2){
            // Create new user in database
            registration_form.create_new_user_in_database(profile: self.new_user_profile)
            
            // FIXME: Redirect user to completion page
            
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
}
