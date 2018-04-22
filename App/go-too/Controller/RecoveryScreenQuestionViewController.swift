//  Created by Sergio Rosendo on 4/21/18.
//  Copyright © 2018 Reactive Works. All rights reserved.

import UIKit

class RecoveryScreenQuestionViewController: UIViewController {
    //Account recovery continuation
    var account_recovery : Account_Receovery! = nil
    
   // Obtainining user profile
    var user_profile : User_Profile! = nil
    
    // UI Attributes
    @IBOutlet weak var question_display_label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Selecting a random security question for user to answer
        let random_question_num : Int = Int(arc4random_uniform(1)) + 1
        account_recovery.set_selected_question(random_question_num)
        
        //Displaying selected security question
        question_display_label.text = user_profile.get_sec_ques(random_question_num)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // UI Functionality
    @IBAction func answer_entered(_ sender: UITextField) {
        
    }
    
    @IBAction func continue_button_pressed(_ sender: UIButton) {
        
    }
}
