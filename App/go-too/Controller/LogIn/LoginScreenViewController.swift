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
    @IBOutlet weak var PromptToEnterInfo: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    var userID: Int = 0
    @IBOutlet weak var promptUserToEnter: UITextField!
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
    
    //text pops up if user does not enter password or email
    let enterInfo: UITextField = {
        let wp = UITextField()
        wp.text = "Enter Email and Password"
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
        PromptToEnterInfo.isHidden = true
        promptUserToEnter.isHidden = true
    }
    
    @IBAction func LoginButtonAction(_ sender: Any) {
        print("Action")
        
        /**
         MARK: -LoadInfo
         Input Validation and Use Data base to check if credentials in text fields are correct or not
 
         **/
        
        //check that there is input entered
        let checkInput = isThereUserInput()
        
        if checkInput == false {
            //no input, so return
            return
        }
    
        
        //validate input
        //return in function if input invalid
        inputValidate()
        
        //authenticate
        authenticate()
        
       
        //load database info
        
    }
    
    
    fileprivate func printWrongPassword(){
        incorrectPassword.isHidden = false
        
       
    }
    
    fileprivate func printWrongAccount(){
        incorrectAccount.isHidden = false
        
    }
    fileprivate func displayPromptUserToEnterEandP(){
        promptUserToEnter.isHidden = false
    
    }
    fileprivate func hideWrongAccount(){
        incorrectAccount.isHidden = true
    }
    fileprivate func hideWrongPasssword(){
        incorrectPassword.isHidden = true
    }
    fileprivate func hidePromptUser(){
        promptUserToEnter.isHidden = true
    }
    fileprivate func isThereUserInput() -> Bool{
        if self.passwordTextField.text == ""{
            hideWrongAccount()
            hideWrongPasssword()
            
            //displaye
            displayPromptUserToEnterEandP()
            return true //MARK: CHANGE BACK TO FALSE
        }
        if self.emailText.text == "" {
            //if(emailText.isEmpty || passwordText.isEmpty){
            hideWrongAccount()
            hideWrongPasssword()
            
            //display
            displayPromptUserToEnterEandP()
            return true //MARK: CHANGE BACK TO FALSE
            //}
        }
        return true
    }
    
    fileprivate func authenticate(){
        let displayEmail = emailText.text!
        let displayPassword  = passwordTextField.text!
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
                hidePromptUser()
                hideWrongAccount()
                
                //print the one we need
                printWrongPassword()
            }else{
                hidePromptUser()
                hideWrongPasssword()
                
                //print the one we need
                printWrongAccount()
            }
            
            
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation*/
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let destinationViewController = segue.destination as? HomeScreenViewController {
            destinationViewController.uID = userID
            
        }
    }
 

}
