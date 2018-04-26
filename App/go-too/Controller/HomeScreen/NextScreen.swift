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
   
    @IBOutlet weak var grade: UITextField!
    
    @IBOutlet weak var ReturnHome: UIButton!
    @IBOutlet weak var GroupTitleText: UITextField!
    @IBOutlet weak var MyPointsButton: UIButton!
    @IBOutlet weak var NotesButton: UIButton!
    @IBOutlet weak var QuestionsButton: UIButton!
    @IBOutlet weak var GroupMembersButton: UIButton!
    //group id(gID) and user id(uID) transfered through HomeScreenToGroupController
    //var groupID: Int!
    var userID: Int!
    var groupSelected = GroupTable()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        //initialize group object with group id passed and then load info from
        initCurrentGroup()
        /**print(currentGroup.getGroupID())
        
        print("GroupName")
        print(currentGroup.getGroupName())
        **/
        grade.text = String(currentGroup.getGroupID())
        
    }

    
    
    fileprivate func initCurrentGroup(){
        if(groupSelected.groupID != -1){
            currentGroup.setGroupID(groupID: groupSelected.groupID)
        }
        if(groupSelected.userID != -1){
            print(groupSelected.userID)
            currentGroup.setUserID(userID: groupSelected.userID)
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
        //displayRanking()
        
        
    }
    
    
    //function will get ranking from group determined by database scores and display top 1-3
    
    //We want to display top 3 scores so if we have a groupsize <= 3, we need to display the
    //1 or 2, or 3 members and if the groupSize is >3, we need to rank and pick top 3 members to display
    fileprivate func displayRanking(){
        
        
        //we need to get the top 1,2, or 3 members based on groupSize
        var topMembers = [GroupTable]()
        
        topMembers = currentGroup.getTopRankedMembers()
        
        
        /**
 
 
            //TODO: Transfer to list that displays top three members with score
 
         **/
        
    }

    @IBAction func ReturnHomeAction(_ sender: Any) {
         self.performSegue(withIdentifier: "NextScreenToHome", sender: self)
    }
    @IBAction func MyPointsAction(_ sender: Any) {
        self.performSegue(withIdentifier: "GroupToMyPoints", sender: self)
    }
    
    @IBAction func GroupMembersAction(_ sender: Any) {
        self.performSegue(withIdentifier: "GroupsToMembers", sender: self)
    }
    
    @IBAction func QuestionsAction(_ sender: Any) {
    }
    
    @IBAction func NotesAction(_ sender: Any) {
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //user presses back to all courses button
        if let destinationViewController = segue.destination as? HomeScreenViewController {
            destinationViewController.uID = groupSelected.userID
            
        }
        //prepare data for when user presses my points
        if let destinationViewController = segue.destination as? myPointsViewController {
            destinationViewController.currentGroup = self.currentGroup
            
        }
        
        //prepare data for when user presses button for group members
        if let destinationViewController = segue.destination as? GroupMembersViewController {
            destinationViewController.currentGroup = self.currentGroup
            
        }
    }
}


