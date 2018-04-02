//
//  confirmedSendButtonViewController.swift
//  
//
//  Created by Jose Herrera on 4/1/18.
//

import UIKit

class confirmedSendButtonViewController : UIViewController {
    
    
    //logo
    let sendButtonPressedLogo: UIImageView = {
        let l = UIImageView()
        l.image = #imageLiteral(resourceName: "Macot_Recovered")
        //l.contentMode = .scaleAspectFill
        l.layer.masksToBounds = true
        l.layer.cornerRadius = 0
        return l
    }()
    
    //Recovery Message
    let messageRecovered: UIImageView = {
        let l = UIImageView()
        l.image = #imageLiteral(resourceName: "Message_Recovered")
        //l.contentMode = .scaleAspectFill
        l.layer.masksToBounds = true
        l.layer.cornerRadius = 0
        return l
    }()
    
    let signUpButton: UIButton = {
        let acc = UIButton(type: .system)
        let font = UIFont.systemFont(ofSize: 14)
        //let attributedTitle = NSAttributedString(string: "Sign Up", attributes: [NSAttributedStringKey.foregroundColor: BLUE_THEME, NSAttributedStringKey.font: font]) //font and color
        acc.setImage(#imageLiteral(resourceName: "Login_Button_Recovered"), for: .normal)
        //append other titles to the title
        //attributedTitle.append(NSAttributedString(string: "Sign Up", attriubutes: [NSAttributedStringKey.foregroundColor: BLUE_THEME, NSAttributedStringKey.font: font]))
        
        //perform action when button is pressed
        acc.addTarget(self, action: #selector(signInAction), for: .touchUpInside)
        //acc.setBackgroundImage(#imageLiteral(resourceName: "Sign_Up_Button_Login"), for: .normal)
        
        //acc.setAttributedTitle(attributedTitle, for: .normal)
        
        return acc
        
        
    }()
    
    let contactUsButton: UIButton = {
        let acc = UIButton(type: .system)
        let font = UIFont.systemFont(ofSize: 14)
        //let attributedTitle = NSAttributedString(string: "Sign Up", attributes: [NSAttributedStringKey.foregroundColor: BLUE_THEME, NSAttributedStringKey.font: font]) //font and color
        acc.setImage(#imageLiteral(resourceName: "Contact_Us_Button_Recovered"), for: .normal)
        //append other titles to the title
        //attributedTitle.append(NSAttributedString(string: "Sign Up", attriubutes: [NSAttributedStringKey.foregroundColor: BLUE_THEME, NSAttributedStringKey.font: font]))
        
        //perform action when button is pressed
        acc.addTarget(self, action: #selector(contactUsAction), for: .touchUpInside)
        //acc.setBackgroundImage(#imageLiteral(resourceName: "Sign_Up_Button_Login"), for: .normal)
        
        //acc.setAttributedTitle(attributedTitle, for: .normal)
        
        return acc
        
        
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupLogo()
        
    }
    
    
    fileprivate func setupLogo(){
        
        //logo
        view.addSubview(sendButtonPressedLogo)
                sendButtonPressedLogo.anchors(topAnchor: view.safeAreaLayoutGuide.topAnchor, topPad: 90, bottomAnchor: nil, bottomPad: 0, leftAnchor: nil, leftPad: 0, rightAnchor: nil, rightPad: 0, height: 140, width: 200)
        
        sendButtonPressedLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        //recovery message
        view.addSubview(messageRecovered)
        messageRecovered.anchors(topAnchor: sendButtonPressedLogo.bottomAnchor, topPad: 50, bottomAnchor: nil, bottomPad: 0, leftAnchor: view.leftAnchor, leftPad: 100, rightAnchor: view.rightAnchor, rightPad: 24, height: 30, width: 0)

        
        
        //sign Up button
        view.addSubview(signUpButton)
        
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.topAnchor.constraint(equalTo: messageRecovered.bottomAnchor, constant: 60).isActive = true
        signUpButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12).isActive = true
        signUpButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12).isActive = true
        signUpButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        //contact us button
        view.addSubview(contactUsButton)
        
        contactUsButton.translatesAutoresizingMaskIntoConstraints = false
        contactUsButton.topAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: 20).isActive = true
        contactUsButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12).isActive = true
        contactUsButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12).isActive = true
        contactUsButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    @objc func signInAction(){
        navigationController?.pushViewController(LoginViewController(), animated: true)
        
    }
    
    @objc func contactUsAction(){
        navigationController?.pushViewController(contactUsViewController(), animated: true)
    }
}
