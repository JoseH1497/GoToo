//
//  GroupMembersView.swift
//  go-too
//
//  Created by Jose Herrera on 4/26/18.
//  Copyright © 2018 Reactive Works. All rights reserved.
//

import Foundation
import UIKit


class GroupMembersViewController : UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    
  
    var currentGroup: Group! = Group()
    
    
    //display all members at first not online
    var displayOnline: Bool = false
    
    //table view holds display of Members, use groupMembers array from currentGroup
    //to Get list of members
    
    @IBOutlet weak var groupTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("GroupNameGroupMembers")
        print(currentGroup.getGroupName())
        
        print("GroupID")
        print(currentGroup.getGroupID())
        
        groupTableView.delegate = self
        groupTableView.dataSource = self
        
        
        
        
        
    }
    
    
    
    //Handles data for table.............................................................
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return currentGroup.groupMembers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = groupTableView.dequeueReusableCell(withIdentifier: "cell")
        
        cell?.textLabel?.text = String(currentGroup.groupMembers[indexPath.row].userID)
        cell?.detailTextLabel?.text = String(currentGroup.groupMembers[indexPath.row].score)
        
        
        
        return cell!
    }
    

    @IBAction func BackToGroupAction(_ sender: Any) {
       
        self.performSegue(withIdentifier: "MembersToCourse", sender: self)
    }
    
    
    @IBAction func ViewOnlineMembersAction(_ sender: Any) {
        //find and set Online members we need
        //currentGroup.setOnlineMembers()
        
        
        self.performSegue(withIdentifier: "MembersToDisplay", sender: self)
    }
    
    @IBAction func ViewAllMembersAction(_ sender: Any) {
        //self.performSegue(withIdentifier: "MembersToDisplay", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationViewController = segue.destination as? NextScreenController {
            let groupSelected = GroupTable()
            groupSelected.groupID = currentGroup.getGroupID()
            groupSelected.userID = currentGroup.getUserID()
            groupSelected.groupName = currentGroup.getGroupName()
            groupSelected.score = currentGroup.getUserScore()
            destinationViewController.groupSelected = groupSelected
            
        }
        
        if let destinationViewController = segue.destination as? DisplayMembersViewController {
            destinationViewController.currentGroup = self.currentGroup
            
        }
        
    }
}
