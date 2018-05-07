//
//  Group_Creation_View_Controller.swift
//  go-too
//
//  Created by Sergio Rosendo on 5/7/18.
//  Copyright © 2018 Reactive Works. All rights reserved.
//

import UIKit

class Group_Creation_View_Controller: UIViewController {
    // Initiating group creator mechanism (Will allow user to create groups)
    var group_creator : Group_Creator! = nil
    
    // MARK: UI Functionality
    @IBAction func exit_group_creation_button_pressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    

}
