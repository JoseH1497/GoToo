//
//  LoginScreenViewController.swift
//  go-too
//
//  Created by Sergio Rosendo on 4/2/18.
//  Copyright © 2018 Reactive Works. All rights reserved.
//

import UIKit

class LoginScreenViewController: UIViewController {
    
    @IBOutlet weak var incorrectAccount: UITextField!
    @IBOutlet weak var incorrectPassword: UITextField!
    @IBOutlet weak var LoginButton: UIButton!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    //text field that will pop up when a wrong password is entered
    let wrongPassword: UITextField = {
        let wp = UITextField()
            wp.text = "Incorrect Password, Try Again"
            wp.textColor = .red
        return wp
    }()
    
    
    
    
    let noAccountFound: UITextField = {
        let wp = UITextField()
        wp.text = "Incorrect Email, No Account Found"
        wp.textColor = .red
        return wp
    }()
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        hideWrongText()
        // Do any additional setup after loading the view.
    }

   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    fileprivate func hideWrongText(){
        incorrectPassword.isHidden = true
        incorrectAccount.isHidden = true
    }
    
    @IBAction func LoginButtonAction(_ sender: Any) {
        print("Action")
        
        /**
         TODO: Input Validation and Use Data base to check if credentials in text fields are correct or not
 
         **/
        var displayEmail : String = emailText.text!
        
        let credentials = true
        let emailCorrect = false
        let passwordCorrect = true
        if(credentials == true){
            //if credentials correct, then send to view to homescreen
            print(displayEmail)
            self.performSegue(withIdentifier: "LoginToHomeScreen", sender: self)
        }else{
            print("Credentials Incorrect")
            if(emailCorrect){
                printWrongPassword()
            }else{
                printWrongAccount()
            }
            
            
        }
        
        
    }
    
    
    fileprivate func printWrongPassword(){
        incorrectPassword.isHidden = false
        
       
    }
    
    fileprivate func printWrongAccount(){
        incorrectAccount.isHidden = false
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
