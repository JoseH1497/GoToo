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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
