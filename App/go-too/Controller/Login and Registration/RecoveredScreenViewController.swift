//
//  RecoveredScreenViewController.swift
//  go-too
//
//  Created by Sergio Rosendo on 4/2/18.
//  Copyright © 2018 Reactive Works. All rights reserved.
//

import UIKit

class RecoveredScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UI Functionality
    @IBAction func login_button_pressed(_ sender: UIButton) {
        // Redirect user to login page
        performSegue(withIdentifier: "recovered_to_login_segue", sender: nil)
    }
    
    @IBAction func contact_us_button_pressed(_ sender: UIButton) {
        // TODO: Future feature that will allow users to contact us 
    }
}
