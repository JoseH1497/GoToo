//
//  ForgotPasswordViewController.swift
//  
//
//  Created by Jose Herrera on 4/1/18.
//

import UIKit


class ForgotPasswordViewController: UIViewController{
    
    
    //Have account button
    let signUpButton: UIButton = {
        let acc = UIButton(type: .system)
        let font = UIFont.systemFont(ofSize: 14)
        let attributedTitle = NSAttributedString(string: "Already Have an Account?", attributes: [NSAttributedStringKey.foregroundColor: BLUE_THEME, NSAttributedStringKey.font: font]) //font and color
        
        //append other titles to the title
        //attributedTitle.append(NSAttributedString(string: "Sign Up", attriubutes: [NSAttributedStringKey.foregroundColor: BLUE_THEME, NSAttributedStringKey.font: font]))
        
        //perform action when button is pressed
        acc.addTarget(self, action: #selector(signInAction), for: .touchUpInside)
        
        acc.setAttributedTitle(attributedTitle, for: .normal)
        
        return acc
        
        
    }()
    
    let forgotPasswordTitle: UIImageView = {
        let fp = UIImageView()
        fp.image = #imageLiteral(resourceName: "Title_Recovery")
        fp.layer.masksToBounds = true
        fp.layer.cornerRadius = 0
        return fp
        
    }()
    
    //logo
    let forgotPasswordLogo: UIImageView = {
        let l = UIImageView()
        l.image = #imageLiteral(resourceName: "Mascot_Recovery")
        //l.contentMode = .scaleAspectFill
        l.layer.masksToBounds = true
        l.layer.cornerRadius = 20
        
        return l
    }()
    
    //setup log in button
    let sendButton: UIButton = {
        let l = UIButton(type: .system)
        l.setTitleColor(BLUE_THEME, for: .normal)
        //l.setTitle("Log in", for: .normal)
        l.setBackgroundImage(#imageLiteral(resourceName: "Send_Buttom_Recovery"), for: .normal)
        //l.setImage(#imageLiteral(resourceName: "Login_Button_Login"), for: .normal)
        // l.backgroundColor = UIColor.rgb(r: 89, g: 156, b: 120)
        l.addTarget(self, action: #selector(sendButtonAction), for: .touchUpInside)
        return l
        
    }()
    
    let emailTextField: UITextField = {
        
        let email = UITextField()
        email.placeholder = "Enter Email"
        email.textColor = UIColor(displayP3Red: 191/255, green:191/255, blue: 191/255, alpha: 1)
        //email.backgroundColor = .white
        email.textColor = .black
        // email.layer.borderColor = UIColor.gray.cgColor
        ///email.layer.borderWidth = 2
        //email.layer.borderColor =
        email.setBottomBorder(backGroundColor: .white, borderColor: BLUE_THEME)
        return email
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupHaveAccountButton()
        
        setupForgotPasswordLogo()
        
        setupForgotPasswordText()
        
        setupEmailText()
        
        setUpSendButton()
       
        
    }
    
    @objc func signInAction(){
        navigationController?.popViewController(animated: true)
    }
    //setup registrationlogo
    fileprivate func setupForgotPasswordLogo(){
        view.addSubview(forgotPasswordLogo)
        forgotPasswordLogo.anchors(topAnchor: view.safeAreaLayoutGuide.topAnchor, topPad: 50, bottomAnchor: nil, bottomPad: 0, leftAnchor: nil, leftPad: 0, rightAnchor: nil, rightPad: 0, height: 180, width: 200)
        
        forgotPasswordLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
    }
    
    //forgot your password text
    fileprivate func setupForgotPasswordText(){
         view.addSubview(forgotPasswordTitle)
         forgotPasswordTitle.anchors(topAnchor: forgotPasswordLogo.bottomAnchor, topPad: 50, bottomAnchor: nil, bottomPad: 0, leftAnchor: view.leftAnchor, leftPad: 100, rightAnchor: view.rightAnchor, rightPad: 24, height: 30, width: 0)
        
        //forgotPasswordTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
    }
    
    
    
    fileprivate func setupHaveAccountButton(){
        view.addSubview(signUpButton)
        signUpButton.anchors(topAnchor: nil, topPad: 0, bottomAnchor: view.safeAreaLayoutGuide.bottomAnchor, bottomPad: 24, leftAnchor: view.leftAnchor, leftPad:120, rightAnchor: view.rightAnchor, rightPad: 120, height: 20, width: 0)
    }
    
    fileprivate func setupEmailText(){
        view.addSubview(emailTextField)
        //emailTextField.anchors(topAnchor: forgotPasswordTitle.bottomAnchor, topPad: 50, bottomAnchor: nil, bottomPad: 0, leftAnchor: view.leftAnchor, leftPad: 24, rightAnchor: view.rightAnchor, rightPad: 24, height: 30, width: 0)
        
        //emailTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
       emailTextField.translatesAutoresizingMaskIntoConstraints = false
        //emailTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true //constraining emailtextfield to safeAreaLayoutGuide, which is the safe part of the view canvas we can manipulate on the screen
       emailTextField.topAnchor.constraint(equalTo: forgotPasswordTitle.bottomAnchor, constant: 20).isActive = true
        emailTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        emailTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant:30).isActive = true
        

        
        //center components in view since all are constraint to the emailtext field, we just have to move the email field
       //emailTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    fileprivate func setUpSendButton(){
        
        view.addSubview(sendButton)
        
       // sendButton.anchors(topAnchor: emailTextField.bottomAnchor, topPad: 40, bottomAnchor: nil, bottomPad: 0, leftAnchor: emailTextField.leftAnchor, leftPad: 0, rightAnchor: emailTextField.rightAnchor, rightPad: 0, height: 60, width: 0)
        
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        sendButton.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 14).isActive = true
        sendButton.leftAnchor.constraint(equalTo: emailTextField.leftAnchor, constant: 0).isActive = true
        sendButton.rightAnchor.constraint(equalTo: emailTextField.rightAnchor, constant: 0).isActive = true
        sendButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
    }
    
    //action when send button pressed
    @objc func sendButtonAction(){
        let sendButtonView = confirmedSendButtonViewController()
        navigationController?.pushViewController(sendButtonView, animated: true)
        
    }
    
}
