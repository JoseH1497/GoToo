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
    var currentGroup: Group!  = Group()
    
    @IBOutlet weak var ReturnToHomeButton: UIButton!
    @IBOutlet weak var grade: UITextField!
    
    @IBOutlet weak var GroupTitleText: UITextField!
    //group id(gID) and user id(uID) transfered through HomeScreenToGroupController
    //var groupID: Int!
    var userID: Int!
    var groupSelected = GroupTable()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        //initialize group object with group id passed and then load info from
        initCurrentGroup()
        print(currentGroup.getGroupID())
        grade.text = String(currentGroup.getGroupID())
        print("GroupName")
        print(currentGroup.getGroupName())
        
        
        
    }

    
    
    fileprivate func initCurrentGroup(){
        if(groupSelected.groupID != -1){
            currentGroup.setGroupID(groupID: groupSelected.groupID)
        }
        if(userID != -1){
            print(userID)
            currentGroup.setUserID(userID: userID)
        }
        if(groupSelected.groupName != ""){
            currentGroup.setGroupName(groupName: groupSelected.groupName)
        }
        //use userID and groupID to see if this user ID is admin or not 
        currentGroup.setAdmin()
        
        //set Title to screen
        if(currentGroup.getGroupName() != ""){
            GroupTitleText.text = currentGroup.getGroupName()
            
        }
        
        //display top 3 scores in current group
        
        displayRanking()
        
        
    }
    
    
    //function will get ranking from group determined by database scores and display top 1-3
    
    //We want to display top 3 scores so if we have a groupsize <= 3, we need to display the
    //1 or 2, or 3 members and if the groupSize is >3, we need to rank and pick top 3 members to display
    fileprivate func displayRanking(){
        //set currentGroup size first so we can know how many members we got
        currentGroup.setGroupSize()
        //next, set members of group
        if(currentGroup.getGroupSize() != 0){
            currentGroup.setGroupMembers()
            
            
        }else{
            
            print("ERROR, group size shouldnt be 0")
        }
        
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


