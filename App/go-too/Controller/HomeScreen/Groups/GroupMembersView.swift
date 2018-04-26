//
//  GroupMembersView.swift
//  go-too
//
//  Created by Jose Herrera on 4/26/18.
//  Copyright © 2018 Reactive Works. All rights reserved.
//

import Foundation
import UIKit


class GroupMembersViewController : UIViewController{
    
  
    var currentGroup: Group! = Group()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func BackToGroupAction(_ sender: Any) {
        self.performSegue(withIdentifier: "MembersToCourse", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationViewController = segue.destination as? NextScreenController {
            let groupSelected = GroupTable()
            groupSelected.groupID = currentGroup.getGroupID()
            groupSelected.userID = currentGroup.getUserID()
            groupSelected.groupName = currentGroup.getGroupName()
            
            destinationViewController.groupSelected = groupSelected
            
        }
    }
}
