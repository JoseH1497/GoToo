//
//  Add_Groups_View_Controller.swift
//  go-too
//
//  Created by Sergio Rosendo on 5/7/18.
//  Copyright © 2018 Reactive Works. All rights reserved.
//

import UIKit

class Add_Groups_View_Controller: UIViewController {
    // Initiating group creator mechanism
    var group_creator : Group_Creator! = nil
    
    // MARK: UI Functionality
    // Function will display a pop up screen with the group creation form
    @IBAction func create_group_button_pressed(_ sender: UIButton) {
        // Redirecting user to the create group form
        performSegue(withIdentifier: "Group_Creation_Segue", sender: nil)
    }
    
    // Function will display a pop up screen with the group joining form
    @IBAction func join_group_button_pressed(_ sender: UIButton) {
        // Redirecting user to the join group form
        performSegue(withIdentifier: "Group_Joining_Segue", sender: nil)
    }
    
    // Function will exit the add group menu
    @IBAction func add_group_menu_exit_button_pressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    // Function will prepare the data that will be transfered to the next view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let segue_identifier : String = segue.identifier{
            // Determining which segue will be taken
            switch segue_identifier{
            case "Group_Creation_Segue":
                // Transfering data
                let destination : Group_Creation_View_Controller = segue.destination as! Group_Creation_View_Controller
                // FIXME: Create get user id function in creator model
                destination.group_creator = Group_Creator(user_id: group_creator.user_id)
                
            case "Group_Joining_Segue":
                // Transfering data
                 let destination : Group_Joining_View_Controller = segue.destination as! Group_Joining_View_Controller
                // FIXME: Create get user id function in creator model
                destination.group_creator = Group_Creator(user_id: group_creator.user_id)
            default:
                print("Will never get here")
            }
        }
    }
}
