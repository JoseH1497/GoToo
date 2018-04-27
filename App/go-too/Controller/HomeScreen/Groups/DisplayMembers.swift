//
//  File.swift
//  go-too
//
//  Created by Jose Herrera on 4/26/18.
//  Copyright © 2018 Reactive Works. All rights reserved.
//

import Foundation
import UIKit

class DisplayMembersViewController : UIViewController,UITableViewDataSource, UITableViewDelegate{
    
    
    var currentGroup: Group! = Group()
    
    @IBOutlet weak var onlineTableView: UITableView!
    
    @IBOutlet weak var NoOneOnlineTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //hide at first
        NoOneOnlineTextField.isHidden = true
        print("GroupNameDISPLAYS")
        print(currentGroup.getGroupName())
        
        //set Online members
       // currentGroup.setOnlineMembers()
        
        
        onlineTableView.delegate = self
        onlineTableView.dataSource = self
        
        if(currentGroup.getOnlineSize() == 0){
            onlineTableView.isHidden = true
            NoOneOnlineTextField.isHidden = false
            
        }
        
    }
    
    
    
    //Handles data for table.............................................................
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return currentGroup.onlineMembers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = onlineTableView.dequeueReusableCell(withIdentifier: "cell")
        
        cell?.textLabel?.text = String(currentGroup.onlineMembers[indexPath.row].userID)
        cell?.detailTextLabel?.text = String(currentGroup.onlineMembers[indexPath.row].score)
        
        
        
        return cell!
    }
    
    
    
    
    @IBAction func BackToGroupMembsAction(_ sender: Any) {
        self.performSegue(withIdentifier: "DisplayMemsToGroupMem", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        
        if let destinationViewController = segue.destination as? GroupMembersViewController {
            destinationViewController.currentGroup = self.currentGroup
            
        }
        
    }
    
    
    
    
    
}
