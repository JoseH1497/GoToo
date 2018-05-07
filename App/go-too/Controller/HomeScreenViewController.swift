//  Created by Sergio Rosendo on 4/2/18.
//  Copyright © 2018 Reactive Works. All rights reserved.

import UIKit

class HomeScreenViewController: UIViewController {
    // Home object will contain all the information needed to be displayed in the home screen
    var home : Home! = nil
    
    // Variable will help us keep track of which group cell in the table view was selected
    // This is needed for transfering the correct group id to the topics list view controller
    var selected_group_id : Int = -1
    
    
    // MARK: UI Functionality
    // Function will display a pop up screen of the user profile
    @IBAction func profile_button_pressed(_ sender: UIButton) {
        performSegue(withIdentifier: "Profile_Pop_Up_Segue", sender: nil)
        
    }
    
    // Function will display a pop up screen of the group creation mechanism 
    @IBAction func add_group_button_pressed(_ sender: UIButton) {
        performSegue(withIdentifier: "Add_Groups_Segue", sender: nil)
    }
    
    // Function will prepare the data that will be transfered to the next view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Determining which segue will be taken
        if let segue_identifier = segue.identifier{
            switch segue_identifier{
            case "Profile_Pop_Up_Segue":
                // Transfering data
                let destination : Profile_Pop_Up_Screen = segue.destination as! Profile_Pop_Up_Screen
                destination.user_profile = User_Profile(home.get_user_id())
                
            case "Topics_Segue":
                // Transfering data
                let destination : NextScreenController = segue.destination as! NextScreenController
                destination.groupSelected.groupID = home.get_group_id(row_num: self.selected_group_id)
                destination.groupSelected.userID  = home.get_user_id()
                
            case "Add_Groups_Segue":
                // Transfering data
                let destination : Add_Groups_View_Controller = segue.destination as! Add_Groups_View_Controller
                destination.group_creator = Group_Creator(user_id: home.get_user_id())
                
            default:
                print("Will never get here...")
            }
        }
    }
}

// In order to use table views we must conform to:
// UI table view delegate
// UI table view data source
extension HomeScreenViewController: UITableViewDelegate, UITableViewDataSource{
    // Function determines how many rows (Cells) should be present in our table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return home.groups_list.count
    }
    
    // Function is called everytime a new cell needs to be created
    // Its primary function is to set up each cell with the correct data
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let group_cell = tableView.dequeueReusableCell(withIdentifier: "Group_Cell") as! Group_Cell
        group_cell.set_group(group_name: home.get_group_name(row_num: indexPath.row))
        
        return group_cell
    }
    
    // Function is called when a table view cell is selected
    // Its primary function is to inform the view controller which group was selected and redirect the user to next view controller
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selected_group_id = home.get_group_id(row_num: indexPath.row)
        performSegue(withIdentifier: "Topics_Segue", sender: nil)
    }
}
