//
//  ViewController.swift
//  GoToo
//
//  Created by Jose Herrera on 3/31/18.
//  Copyright © 2018 Jose Herrera. All rights reserved.
//

import UIKit


class LoginViewController: UIViewController {
    
    //setup for email text field
    let emailTextField: UITextField = {
        
        let email = UITextField()
        email.placeholder = "Email"
        email.textColor = UIColor(displayP3Red: 191/255, green:191/255, blue: 191/255, alpha: 1)
        //email.backgroundColor = .white
        email.textColor = .black
       // email.layer.borderColor = UIColor.gray.cgColor
        ///email.layer.borderWidth = 2
        //email.layer.borderColor =
        email.setBottomBorder(backGroundColor: .white, borderColor: BLUE_THEME)
        return email
    }()
    
    //setup for password text field
    let passwordTextField: UITextField = {
        let password = UITextField()
        password.placeholder = "Password"
        password.textColor = UIColor(displayP3Red: 191/255, green:191/255, blue: 191/255, alpha: 1)
       // password.backgroundColor = .white
        password.textColor = .black
        
        password.isSecureTextEntry = true
        password.setBottomBorder(backGroundColor: .white, borderColor: BLUE_THEME)
        return password
    }()
    
    //setup log in button
    let loginButton: UIButton = {
        let l = UIButton(type: .system)
        l.setTitleColor(BLUE_THEME, for: .normal)
        //l.setTitle("Log in", for: .normal)
        l.setBackgroundImage(#imageLiteral(resourceName: "Login_Button_Login"), for: .normal)
        //l.setImage(#imageLiteral(resourceName: "Login_Button_Login"), for: .normal)
       // l.backgroundColor = UIColor.rgb(r: 89, g: 156, b: 120)
        l.addTarget(self, action: #selector(loginAction), for: .touchUpInside)
        return l
        
    }()
    
    //Have account button "SIGN Up button"
    let signUpButton: UIButton = {
        let acc = UIButton(type: .system)
        let font = UIFont.systemFont(ofSize: 14)
        //let attributedTitle = NSAttributedString(string: "Sign Up", attributes: [NSAttributedStringKey.foregroundColor: BLUE_THEME, NSAttributedStringKey.font: font]) //font and color
        acc.setImage(#imageLiteral(resourceName: "Sign_Up_Button_Login"), for: .normal)
        //append other titles to the title
        //attributedTitle.append(NSAttributedString(string: "Sign Up", attriubutes: [NSAttributedStringKey.foregroundColor: BLUE_THEME, NSAttributedStringKey.font: font]))
        
        //perform action when button is pressed
        acc.addTarget(self, action: #selector(signUpAction), for: .touchUpInside)
        //acc.setBackgroundImage(#imageLiteral(resourceName: "Sign_Up_Button_Login"), for: .normal)
        
       //acc.setAttributedTitle(attributedTitle, for: .normal)
        
        return acc
        
        
    }()
    
    //forgot password button
    let forgotPasswordButton: UIButton = {
        let fp = UIButton(type: .system)
        fp.setTitleColor(BLUE_THEME, for: .normal)
        //fp.setTitle("Forgot Password?", for: .normal)
        fp.setImage(#imageLiteral(resourceName: "Recovery_Button_Login"), for: .normal)
        //perform action when button is pressed
        fp.addTarget(self, action: #selector(forgotPasswordAction), for: .touchUpInside)
        return fp
    }()
    
    
    
    
    let goTooLogo: UIImageView = {
            let l = UIImageView()
                l.image = #imageLiteral(resourceName: "Go_too_logo")
                //l.contentMode = .scaleAspectFill
                l.layer.masksToBounds = true
                l.layer.cornerRadius = 20
        
            return l
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = .white
        //view.backgroundColor = BLUE_THEME
        navigationController?.isNavigationBarHidden = true
        
        
        //setup logo
        setupLogo()
        
        //setup login features
        setupLoginComponents()
        
        
    }
    

    fileprivate func setupLoginComponents(){
        //sign in features
        setupEmailField()
        setupPasswordField()
        setupLoginButton()
        setupSignUpButton()
        setupForgotPasswordButton()
    }
    
    //put logo on loginview
    fileprivate func setupLogo(){
        view.addSubview(goTooLogo)
        goTooLogo.anchors(topAnchor: view.safeAreaLayoutGuide.topAnchor, topPad: 64, bottomAnchor: nil, bottomPad: 0, leftAnchor: nil, leftPad: 0, rightAnchor: nil, rightPad: 0, height: 180, width: 250)
        
        goTooLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
    }
    
    //When entering components, must have height and width defined in some way
    //setupEmail field in view
    fileprivate func setupEmailField(){
        view.addSubview(emailTextField) //add text field to view
        //emailTextField.backgroundColor = .red
       // emailTextField.anchors(topAnchor: nil, topPad: 0, bottomAnchor: nil, bottomPad: 0, leftAnchor: view.leftAnchor, leftPad: 24, rightAnchor: view.rightAnchor, rightPad: 24, height: 30, width: 0)
       emailTextField.translatesAutoresizingMaskIntoConstraints = false
       // emailTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true //constraining emailtextfield to safeAreaLayoutGuide, which is the safe part of the view canvas we can manipulate on the screen
        emailTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        emailTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant:30).isActive = true
        
        
        
        //center components in view since all are constraint to the emailtext field, we just have to move the email field
       emailTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        
        
    }
    
    fileprivate func setupPasswordField(){ //same thing, this field is constraint to the email text field, thus wherever the email text file moves, this moves too
        view.addSubview(passwordTextField)
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 8).isActive = true //constraining emailtextfield to safeAreaLayoutGuide, which is the safe part of the view canvas we can manipulate on the screen
        passwordTextField.leftAnchor.constraint(equalTo: emailTextField.leftAnchor, constant: 0).isActive = true
        passwordTextField.rightAnchor.constraint(equalTo: emailTextField.rightAnchor, constant: 0).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant:30).isActive = true
       // passwordTextField.anchors(topAnchor: emailTextField.bottomAnchor, topPad: 8, bottomAnchor: nil, bottomPad: 0, leftAnchor: emailTextField.leftAnchor, leftPad: 0, rightAnchor: emailTextField.rightAnchor, rightPad: 0, height: 30, width: 0)
        
    }
    
    
    fileprivate func setupLoginButton(){ //login constaint to password text field which is constrained to the email text field
        view.addSubview(loginButton)
        
        //loginButton.anchors(topAnchor: passwordTextField.bottomAnchor, topPad: 8, bottomAnchor: nil, bottomPad: 0, leftAnchor: passwordTextField.leftAnchor, leftPad: 0, rightAnchor: passwordTextField.rightAnchor, rightPad: 0, height: 30, width: 0)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 14).isActive = true
        loginButton.leftAnchor.constraint(equalTo: passwordTextField.leftAnchor, constant: 0).isActive = true
        loginButton.rightAnchor.constraint(equalTo: passwordTextField.rightAnchor, constant: 0).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
    }
    
    fileprivate func setupSignUpButton(){ //Have an account? button
        view.addSubview(signUpButton)
        
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -48).isActive = true
        signUpButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12).isActive = true
        signUpButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12).isActive = true
        signUpButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        
    }
    
    fileprivate func setupForgotPasswordButton(){
        view.addSubview(forgotPasswordButton)
        
        forgotPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        forgotPasswordButton.topAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: 4).isActive = true
        
        forgotPasswordButton.leftAnchor.constraint(equalTo: signUpButton.leftAnchor, constant: 0).isActive = true
        forgotPasswordButton.rightAnchor.constraint(equalTo: signUpButton.rightAnchor, constant: 0).isActive = true
        
        forgotPasswordButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
    }
    
   /** override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }**/

    
    //function when sign up button pressed
    @objc func signUpAction(){
        let signUpController = SignUpViewContoller()
        navigationController?.pushViewController((signUpController), animated: true)
    }
    
    //forgot password pressed
    @objc func forgotPasswordAction(){
        let passwordController = ForgotPasswordViewController()
        navigationController?.pushViewController(passwordController, animated: true)
        
    }
    
    @objc func loginAction(){
        /**Code that makes sure email and password field are not empty and check for both email and correct password in database, once this happens, we can push dashboard view controller**/
        
        
        
        
        
        //after confirmation of correct information, then we can push the dashboard view controller
        navigationController?.pushViewController(DashboardViewController(), animated: true)
    }
    

}

