//
//  SignUpViewController.swift
//  
//
//  Created by Jose Herrera on 4/1/18.
//

import UIKit


//Register user for application, need first and last name and email and password
class SignUpViewContoller: UIViewController{
    
    
    
    let firstNameField: UITextField = {
        
        let fn = UITextField()
        fn.placeholder = "Enter First Name"
        fn.textColor = UIColor(displayP3Red: 191/255, green:191/255, blue: 191/255, alpha: 1)
        //email.backgroundColor = .white
        fn.textColor = .black
        // email.layer.borderColor = UIColor.gray.cgColor
        ///email.layer.borderWidth = 2
        //email.layer.borderColor =
        fn.setBottomBorder(backGroundColor: .white, borderColor: BLUE_THEME)
        return fn
    }()
    let lastNameField: UITextField = {
        
        let ln = UITextField()
        ln.placeholder = "Enter Last Name"
        ln.textColor = UIColor(displayP3Red: 191/255, green:191/255, blue: 191/255, alpha: 1)
        //email.backgroundColor = .white
        ln.textColor = .black
        // email.layer.borderColor = UIColor.gray.cgColor
        ///email.layer.borderWidth = 2
        //email.layer.borderColor =
        ln.setBottomBorder(backGroundColor: .white, borderColor: BLUE_THEME)
        return ln
    }()
    
    //setup for email text field
    let emailTextField: UITextField = {
        
        let email = UITextField()
        email.placeholder = "Enter Organization Email Address"
        email.textColor = UIColor(displayP3Red: 191/255, green:191/255, blue: 191/255, alpha: 1)
        //email.backgroundColor = .white
        email.textColor = .black
        // email.layer.borderColor = UIColor.gray.cgColor
        ///email.layer.borderWidth = 2
        //email.layer.borderColor =
        email.setBottomBorder(backGroundColor: .white, borderColor: BLUE_THEME)
        return email
    }()
    
    //setup for Create password text field
    let passwordTextField: UITextField = {
        let password = UITextField()
        password.placeholder = "Create Password"
        password.textColor = UIColor(displayP3Red: 191/255, green:191/255, blue: 191/255, alpha: 1)
        // password.backgroundColor = .white
        password.textColor = .black
        
        password.isSecureTextEntry = true
        password.setBottomBorder(backGroundColor: .white, borderColor: BLUE_THEME)
        return password
    }()
    
    //setup for Reenter password text field
    let confirmPasswordTextField: UITextField = {
        let password = UITextField()
        password.placeholder = "Reenter Password"
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
        l.setBackgroundImage(#imageLiteral(resourceName: "Sign_Up_Button_Sign_Up"), for: .normal)
        //l.setImage(#imageLiteral(resourceName: "Login_Button_Login"), for: .normal)
        // l.backgroundColor = UIColor.rgb(r: 89, g: 156, b: 120)
        return l
        
    }()
    
    //Have account button
    let signUpButton: UIButton = {
        let acc = UIButton(type: .system)
        let font = UIFont.systemFont(ofSize: 14)
        let attributedTitle = NSAttributedString(string: "Already Have an Account?", attributes: [NSAttributedStringKey.foregroundColor: BLUE_THEME, NSAttributedStringKey.font: font]) //font and color
        
        //append other titles to the title
        //attributedTitle.append(NSAttributedString(string: "Sign Up", attriubutes: [NSAttributedStringKey.foregroundColor: BLUE_THEME, NSAttributedStringKey.font: font]))
        
        //perform action when button is pressed
        acc.addTarget(self, action: #selector(alreadyHaveAccAction), for: .touchUpInside)
        
        acc.setAttributedTitle(attributedTitle, for: .normal)
        
        return acc
        
        
    }()
    let registerLogo: UIImageView = {
        let l = UIImageView()
        l.image = #imageLiteral(resourceName: "Macot_Sign_Up")
        //l.contentMode = .scaleAspectFill
        l.layer.masksToBounds = true
        l.layer.cornerRadius = 20
        
        return l
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupLogo()
        
        
        
        setupFields()
        
        
        setupHaveAccountButton()
        setupSignUpButton()
    }
    
    //if user presses already have an account button go back to sign in
    @objc func alreadyHaveAccAction(){
        navigationController?.popViewController(animated: true)
    }
    
    fileprivate func setupFields(){
        setupNameFields()
        setupEmailField()
        setupPasswordField()
    }
    //setup registrationlogo
    fileprivate func setupLogo(){
        view.addSubview(registerLogo)
        registerLogo.anchors(topAnchor: view.safeAreaLayoutGuide.topAnchor, topPad: 64, bottomAnchor: nil, bottomPad: 0, leftAnchor: nil, leftPad: 0, rightAnchor: nil, rightPad: 0, height: 180, width: 200)
        
        registerLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
    }
    
    fileprivate func setupSignUpButton(){
        view.addSubview(loginButton)
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.topAnchor.constraint(equalTo: confirmPasswordTextField.bottomAnchor, constant: 14).isActive = true
        loginButton.leftAnchor.constraint(equalTo: confirmPasswordTextField.leftAnchor, constant: 0).isActive = true
        loginButton.rightAnchor.constraint(equalTo: confirmPasswordTextField.rightAnchor, constant: 0).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    fileprivate func setupHaveAccountButton(){
        view.addSubview(signUpButton)
        signUpButton.anchors(topAnchor: nil, topPad: 0, bottomAnchor: view.safeAreaLayoutGuide.bottomAnchor, bottomPad: 24, leftAnchor: view.leftAnchor, leftPad:120, rightAnchor: view.rightAnchor, rightPad: 120, height: 20, width: 0)
    }
    
    fileprivate func setupNameFields(){
        view.addSubview(firstNameField)
        firstNameField.translatesAutoresizingMaskIntoConstraints = false
        firstNameField.topAnchor.constraint(equalTo: registerLogo.bottomAnchor, constant: 26).isActive = true //constraining emailtextfield to safeAreaLayoutGuide, which is the safe part of the view canvas we can manipulate on the screen
        firstNameField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        firstNameField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
        firstNameField.heightAnchor.constraint(equalToConstant:30).isActive = true
        
        
        view.addSubview(lastNameField)
        lastNameField.translatesAutoresizingMaskIntoConstraints = false
        lastNameField.topAnchor.constraint(equalTo: firstNameField.bottomAnchor, constant: 8).isActive = true //constraining emailtextfield to safeAreaLayoutGuide, which is the safe part of the view canvas we can manipulate on the screen
        lastNameField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        lastNameField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
        lastNameField.heightAnchor.constraint(equalToConstant:30).isActive = true
        
    }
    fileprivate func setupEmailField(){
        view.addSubview(emailTextField) //add text field to view
        //emailTextField.backgroundColor = .red
        // emailTextField.anchors(topAnchor: nil, topPad: 0, bottomAnchor: nil, bottomPad: 0, leftAnchor: view.leftAnchor, leftPad: 24, rightAnchor: view.rightAnchor, rightPad: 24, height: 30, width: 0)
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.topAnchor.constraint(equalTo: lastNameField.bottomAnchor, constant: 8).isActive = true //constraining emailtextfield to safeAreaLayoutGuide, which is the safe part of the view canvas we can manipulate on the screen
        emailTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        emailTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant:30).isActive = true
        
        
        
        //center components in view since all are constraint to the emailtext field, we just have to move the email field
       // emailTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        
        
    }
    
    fileprivate func setupPasswordField(){ //same thing, this field is constraint to the email text field, thus wherever the email text file moves, this moves too
        view.addSubview(passwordTextField)
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 8).isActive = true //constraining emailtextfield to safeAreaLayoutGuide, which is the safe part of the view canvas we can manipulate on the screen
        passwordTextField.leftAnchor.constraint(equalTo: emailTextField.leftAnchor, constant: 0).isActive = true
        passwordTextField.rightAnchor.constraint(equalTo: emailTextField.rightAnchor, constant: 0).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant:30).isActive = true
        // passwordTextField.anchors(topAnchor: emailTextField.bottomAnchor, topPad: 8, bottomAnchor: nil, bottomPad: 0, leftAnchor: emailTextField.leftAnchor, leftPad: 0, rightAnchor: emailTextField.rightAnchor, rightPad: 0, height: 30, width: 0)
        
        view.addSubview(confirmPasswordTextField)
        confirmPasswordTextField.translatesAutoresizingMaskIntoConstraints = false
        confirmPasswordTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 8).isActive = true //constraining emailtextfield to safeAreaLayoutGuide, which is the safe part of the view canvas we can manipulate on the screen
        confirmPasswordTextField.leftAnchor.constraint(equalTo: passwordTextField.leftAnchor, constant: 0).isActive = true
        confirmPasswordTextField.rightAnchor.constraint(equalTo: passwordTextField.rightAnchor, constant: 0).isActive = true
        confirmPasswordTextField.heightAnchor.constraint(equalToConstant:30).isActive = true
    }
    

    
    
}
