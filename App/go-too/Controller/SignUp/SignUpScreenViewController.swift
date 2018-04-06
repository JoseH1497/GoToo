//
//  SignUpScreenViewController.swift
//  go-too
//
//  Created by Sergio Rosendo on 4/2/18.
//  Copyright © 2018 Reactive Works. All rights reserved.
//


import UIKit




class SignUpScreenViewController: UIViewController {
  
    @IBOutlet weak var EmailText: UITextField!
    @IBOutlet weak var CreatePasswordText: UITextField!
    @IBOutlet weak var ConfirmPasswordText: UITextField!
    @IBOutlet weak var SignUpButton: UIButton!
    
    @IBOutlet weak var promptUserToEnter: UITextField!
    
    //Have account button
    let haveAccountButton: UIButton = {
        let acc = UIButton(type: .system)
        let font = UIFont.systemFont(ofSize: 14)
        let attributedTitle = NSAttributedString(string: "Already Have an Account?", attributes: [NSAttributedStringKey.foregroundColor:  UIColor(displayP3Red: 43/255, green: 129/255, blue: 233/255, alpha: 1), NSAttributedStringKey.font: font, ]) //font and color
        
        //append other titles to the title
        //attributedTitle.append(NSAttributedString(string: "Sign Up", attriubutes: [NSAttributedStringKey.foregroundColor: BLUE_THEME, NSAttributedStringKey.font: font]))
        
        //perform action when button is pressed
        acc.addTarget(self, action: #selector(alreadyHaveAccAction), for: .touchUpInside)
        
        acc.setAttributedTitle(attributedTitle, for: .normal)
        
        return acc
        
        
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupHaveAccountButton()
        promptUserToEnter.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    
   fileprivate func setupHaveAccountButton(){
        view.addSubview(haveAccountButton)
        haveAccountButton.anchors(topAnchor: nil, topPad: 0, bottomAnchor: view.safeAreaLayoutGuide.bottomAnchor, bottomPad: 24, leftAnchor: view.leftAnchor, leftPad:120, rightAnchor: view.rightAnchor, rightPad: 120, height: 20, width: 0)
    }
    @objc func alreadyHaveAccAction(){
       // self.performSegue(withIdentifier: "HaveAccountToLogIn", sender: self)
       self .dismiss(animated: true, completion: nil)
    }
 

    @IBAction func SignUpAction(_ sender: Any) {
        /**
         
         TODO: Make sure each input is valid, then check that CreatePasswordText and ConfirmPasswordText are the same and then
         add to the database the new account member and sign them up
         still need to decide what view should be display once signup button is pressed and info is correctly submitted to database
         
         
         **/
    /**if(checkAllDataIsInputed()){
            
            
            
            
        }
       **/
        //check that there is input entered
        let checkInput = isThereUserInput()
        
        if checkInput == false {
            //no input, so return
            return
        }
        
        hidePromptUserToEnter()
        inputValidate()
        
        
        checkPasswordMatch()
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    fileprivate func isThereUserInput() -> Bool{
        if self.CreatePasswordText.text == ""{
            
            
            //displaye
            displayPromptUserToEnterEandP()
            return false
        }
        if self.EmailText.text == "" {
            //if(emailText.isEmpty || passwordText.isEmpty){
            
            
            //display
            displayPromptUserToEnterEandP()
            return false
            //}
        }
        return true
    }
    //make sure createpasswordText and ConfirmedPasswordText match
    fileprivate func checkPasswordMatch(){
    
    }
    
    //validate input
    fileprivate func inputValidate(){
        
    }
    fileprivate func displayPromptUserToEnterEandP(){
        promptUserToEnter.isHidden = false
        
    }
    fileprivate func hidePromptUserToEnter(){
        promptUserToEnter.isHidden = true
    }
    
}



