//
//  NextScreen.swift
//  go-too
//
//  Created by Jose Herrera on 4/16/18.
//  Copyright © 2018 Reactive Works. All rights reserved.
//

import Foundation
import UIKit
class NextScreenController : UIViewController {
    let currentGroup: Group!  = Group()
    
    @IBOutlet weak var ReturnToHomeButton: UIButton!
    @IBOutlet weak var grade: UITextField!
    
    //group id(gID) and user id(uID) transfered through HomeScreenToGroupController
    var groupID: Int!
    var userID: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        print(groupID)
        grade.text = String(groupID)
        //initialize group object with group id passed and then load info from
        initCurrentGroup()
        
    }

    
    
    fileprivate func initCurrentGroup(){
        if(groupID != -1){
            currentGroup.setGroupID(groupID: groupID)
        }
        if(userID != -1){
            print(userID)
            currentGroup.setUserID(userID: userID)
        }
        //use userID and groupID to see if this user ID is admin or not 
        currentGroup.setAdmin()
        
    }
    @IBAction func ReturnToHomeAction(_ sender: Any) {
        self.performSegue(withIdentifier: "NextScreenToHome", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationViewController = segue.destination as? HomeScreenViewController {
            destinationViewController.uID = userID
            
        }
    }
}


