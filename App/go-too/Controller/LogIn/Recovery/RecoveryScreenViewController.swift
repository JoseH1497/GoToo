//
//  RecoveryScreenViewController.swift
//  go-too
//
//  Created by Sergio Rosendo on 4/2/18.
//  Copyright © 2018 Reactive Works. All rights reserved.
//

import UIKit

class RecoveryScreenViewController: UIViewController {

    @IBOutlet weak var EmailText: UITextField!
    
    @IBOutlet weak var SendButton: UIButton!
    
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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func SendButtonAction(_ sender: Any) {
        /*
         TODO: Check that Email in EmailText Field is in our database and
               we can send password to email
        */
        let credentials = true
        
        if(credentials == true){
            
            self.performSegue(withIdentifier: "SendPasswordInfo", sender: self)
        }else{
            //don't push Recovered screen view controller
        }
        
    }
    
    fileprivate func setupHaveAccountButton(){
        view.addSubview(haveAccountButton)
        haveAccountButton.anchors(topAnchor: nil, topPad: 0, bottomAnchor: view.safeAreaLayoutGuide.bottomAnchor, bottomPad: 24, leftAnchor: view.leftAnchor, leftPad:120, rightAnchor: view.rightAnchor, rightPad: 120, height: 20, width: 0)
    }
    @objc func alreadyHaveAccAction(){
        // self.performSegue(withIdentifier: "HaveAccountToLogIn", sender: self)
        self .dismiss(animated: true, completion: nil)
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
