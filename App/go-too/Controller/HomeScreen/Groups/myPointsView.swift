//
//  myPointsView.swift
//  go-too
//
//  Created by Jose Herrera on 4/26/18.
//  Copyright © 2018 Reactive Works. All rights reserved.
//

import Foundation

import UIKit
class myPointsViewController : UIViewController{
    
    //group Object passed over
    
    var currentGroup: Group! = Group()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("User Score")
        print(currentGroup.getUserScore())
        
        
    }
    
    
    
    @IBAction func BackToCourseAction(_ sender: Any) {
        self.performSegue(withIdentifier: "MyPointsToCourse", sender: self)
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
