//  Created by Sergio Rosendo on 4/2/18.
//  Copyright © 2018 Reactive Works. All rights reserved.

import UIKit

class HomeScreenViewController: UIViewController {
    // Home object will contain all the information needed to be displayed in the home screen
    var home : Home! = nil
    
    // TEST
    override func viewDidLoad() {
        super.viewDidLoad()
        print(home.user_id)
    }
    
    // MARK: UI Functionality
    // Function will display a pop up screen of the user profile
    @IBAction func profile_button_pressed(_ sender: UIButton) {
        // TEST
        performSegue(withIdentifier: "Profile_Pop_Up_Segue", sender: nil)
        
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
        let group_info = home.groups_list[indexPath.row]
        let group_cell = tableView.dequeueReusableCell(withIdentifier: "Group_Cell") as! Group_Cell
        group_cell.set_group(group_name: group_info.group_name)
        
        return group_cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}
