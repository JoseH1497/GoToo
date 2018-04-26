//
//  AddCourseViewController.swift
//  go-too
//
//  Created by Jose Herrera on 4/25/18.
//  Copyright © 2018 Reactive Works. All rights reserved.
//

import Foundation
import UIKit
class AddCourseViewController: UIViewController{
    var userID: Int!
    var Home = HomeScreen()
    @IBOutlet weak var GroupNameText: UITextField!
    @IBOutlet weak var InviteUsersText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print(userID)
        
    }
    
    
    @IBAction func FinishedAction(_ sender: Any) {
        
        if GroupNameText.text != ""{
            //MARK: Add to database by using userID and new groupName
            Home.addGroup(groupName: GroupNameText.text!, userID: userID)
            if InviteUsersText.text != ""{
                Home.inviteUsers(groupName: GroupNameText.text!, userID: userID)
            }
            self.performSegue(withIdentifier: "AddGroupToHome", sender: self)
        }else{
            presentNoGroupNameAlert()
        }
        
        
        
    }
    @IBOutlet weak var CancelAction: UIButton!
    
    @IBAction func CancelButtonAction(_ sender: Any) {
        self.performSegue(withIdentifier: "AddGroupToHome", sender: self)
    }
    
    //displays an alert showing user has reached max number of courses
    func presentNoGroupNameAlert() {
        let alertController = UIAlertController(title: "No Group Created!", message: "You did Not specify a Group Name!", preferredStyle: .alert)
        
        let confirmAction = UIAlertAction(title: "Fix", style: .default) { (_) in
            
        }
        
        alertController.addAction(confirmAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationViewController = segue.destination as? HomeScreenViewController {
            destinationViewController.uID = userID
            
        }
    }
}
