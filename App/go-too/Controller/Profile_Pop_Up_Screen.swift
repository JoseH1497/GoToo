//
//  Profile_Pop_Up_Screen.swift
//  go-too
//
//  Created by Sergio Rosendo on 5/3/18.
//  Copyright © 2018 Reactive Works. All rights reserved.
//

import UIKit

class Profile_Pop_Up_Screen: UIViewController {
    @IBOutlet weak var pop_up_screen_view: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: UI Functionality
    // Function is triggered when exit button is pressed
    @IBAction func exit_button_pressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
