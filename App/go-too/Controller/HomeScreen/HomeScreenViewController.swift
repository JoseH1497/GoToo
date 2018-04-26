//
//  HomeScreenViewController.swift
//  go-too
//
//  Created by Sergio Rosendo on 4/2/18.
//  Copyright © 2018 Reactive Works. All rights reserved.
//

import UIKit
//import SQLite3

class HomeScreenViewController: UIViewController {
    //let database     : Connection
    
    
    @IBOutlet weak var TopBar: UIImageView!
    
    
    @IBOutlet weak var AddCoursesButton: UIButton!
    //Course Buttons on Stack View
    @IBOutlet weak var Course1Button: UIButton!
    @IBOutlet weak var Course2Button: UIButton!
    @IBOutlet weak var Course3Button: UIButton!
    @IBOutlet weak var Course4Button: UIButton!
    @IBOutlet weak var Course5Button: UIButton!
    @IBOutlet weak var Course6Button: UIButton!
    
    //set when user presses button, groupId data will be passed to GroupViewController
    var groupId: Int = 0
    //set groupName to be passed to GroupViewController
    var groupSelected = GroupTable()
    
    //uID is user id of current user, transferred from login view controller
    var uID: Int!
    var numOfCourses: Int = 0
    //var courseNames = [String]()
    var Home:HomeScreen!
    //create array to hold all course names and set each button title to that course name for display
    var courseNames = [GroupTable] ()
    
    //function not really needed anymore, fixed bug
    fileprivate func unhideAllCourseButtons(){
        Course6Button.isHidden = false
        Course5Button.isHidden = false
        Course4Button.isHidden = false
        Course3Button.isHidden = false
        Course2Button.isHidden = false
        Course1Button.isHidden = false
        
       
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print(uID)
        //Start by having all course buttons hidden
        //unhideAllCourseButtons()
        hideAllCourseButtons()
        
        
        //hideAllCourseButtons()
        
        Home = HomeScreen(userID: uID) //initialize with proper userID
        groupSelected.userID = uID //SET USERID for next screens
        //button Count will get the number of courses or groups this user has
        numOfCourses = Home.getNumOfCourses()
        
        //Generate buttons based on buttonCount
        if(numOfCourses != 0){
            generateButtons(ButtonCount: numOfCourses)
        }
        
    }
    
    
    
   
    //MARK: - Generate Buttons Function
    //This function will unhide the amount of buttons we need for the number of groups the user has
    //TODO: We need to load the each course title and put it on the button text for each needed button
    //Each button will go to the same view controller
     fileprivate func generateButtons(ButtonCount : Int){
        
        
        
        
        //GET course names from database
        courseNames = Home.getCourseNamesFromDataBase()
        for i in 1...ButtonCount{
            //We know we have 1-6 courses possible so we hide them all at first and will only make the ones visible that need to be
            
            //print("Got here")
            //make buttons visible and set the text to the correct Course name
            switch(i){
                
            case 1:
                //course 1 button
                Course1Button.isHidden = false;
                //MARK: Set actual title for first group, these titles should all have been loaded from database
                Course1Button.setTitle(Home.courseNamesFromDataBase[i-1].groupName, for: .normal)
                break
            case 2:
                //course 2 button
                Course2Button.isHidden = false;
                //MARK: Set actual title for first group, these titles should all have been loaded from database
                Course2Button.setTitle(Home.courseNamesFromDataBase[i-1].groupName, for: .normal)
                break
            case 3:
                //course 3 button
                Course3Button.isHidden = false;
                //MARK: Set actual title for first group, these titles should all have been loaded from database
                Course3Button.setTitle(Home.courseNamesFromDataBase[i-1].groupName, for: .normal)
                break
            case 4:
                //course 4 button
                Course4Button.isHidden = false;
                //MARK: Set actual title for first group, these titles should all have been loaded from database
                Course4Button.setTitle(Home.courseNamesFromDataBase[i-1].groupName, for: .normal)
                break
            case 5:
                //course 5 button
                Course5Button.isHidden = false;
                //MARK: Set actual title for first group, these titles should all have been loaded from database
                Course5Button.setTitle(Home.courseNamesFromDataBase[i-1].groupName, for: .normal)
                break
            case 6:
                //course 6 button
                Course6Button.isHidden = false;
                //MARK: Set actual title for first group, these titles should all have been loaded from database
                Course6Button.setTitle(Home.courseNamesFromDataBase[i-1].groupName, for: .normal)
                break
                
            //should never get here
            default:
                print("ERROR")
                break
                
            }
            
            //print(coursename)
        }
     
     
     }
    
    
    //Function to hide all coursebuttons in StackView
    fileprivate func hideAllCourseButtons(){
        
        Course6Button.isHidden = true
        Course5Button.isHidden = true
        Course4Button.isHidden = true
        Course3Button.isHidden = true
        Course2Button.isHidden = true
        Course1Button.isHidden = true
        
    }
    
    
    
    
 
    
    
    
    //MARK: Actions For CourseButtons
    //TODO: Need to load correct data to the next view screen for the corresponding course
    //TODO: Need to update an instance of a Groups object that is stored in an array in the super user class
    //once, we need to save the info from database and then we can load it to the next screen once the button is pressed
    //Based on which button is pressed, we will know which data to load to the Groups object
    //this will send to the next view
    @IBAction func Course1Action(_ sender: Any) {
        
        //TODO: Get correct groupID from database
        groupId = courseNames[0].groupID
        //information to send over
        groupSelected.groupID = courseNames[0].groupID
        groupSelected.groupName = courseNames[0].groupName
        //groupName = courseNames
        self.performSegue(withIdentifier: "HomeScreenToNextCourseSegue", sender: self)
    }
    
    @IBAction func Course2Action(_ sender: Any) {
        //this will send to the next view
         //TODO: Get correct groupID from database
        groupId = courseNames[1].groupID
        groupSelected.groupID = courseNames[1].groupID
        groupSelected.groupName = courseNames[1].groupName
        self.performSegue(withIdentifier: "HomeScreenToNextCourseSegue", sender: self)
    }
    
    @IBAction func Course3Action(_ sender: Any) {
        //this will send to the next view
         //TODO: Get correct groupID from database
        groupId = courseNames[2].groupID
        
        groupSelected.groupID = courseNames[2].groupID
        groupSelected.groupName = courseNames[2].groupName
        self.performSegue(withIdentifier: "HomeScreenToNextCourseSegue", sender: self)
    }
    
    @IBAction func Course4Action(_ sender: Any) {
        //this will send to the next view
         //TODO: Get correct groupID from database
        groupId = courseNames[3].groupID
        groupSelected.groupID = courseNames[3].groupID
        groupSelected.groupName = courseNames[3].groupName
        self.performSegue(withIdentifier: "HomeScreenToNextCourseSegue", sender: self)
    }
    @IBAction func Course5Action(_ sender: Any) {
        //this will send to the next view
         //TODO: Get correct groupID from database
        groupId = courseNames[4].groupID
        groupSelected.groupID = courseNames[4].groupID
        groupSelected.groupName = courseNames[4].groupName
        self.performSegue(withIdentifier: "HomeScreenToNextCourseSegue", sender: self)
    }
    
    @IBAction func Course6Action(_ sender: Any) {
        //this will send to the next view
         //TODO: Get correct groupID from database
        groupId = courseNames[5].groupID
        groupSelected.groupID = courseNames[5].groupID
        groupSelected.groupName = courseNames[5].groupName
        
        self.performSegue(withIdentifier: "HomeScreenToNextCourseSegue", sender: self)
    }
    
    
    //Alerts..........................................
    func presentAddCoursesAlert() {
        let alertController = UIAlertController(title: "New Group?", message: "Please enter new Group Name:", preferredStyle: .alert)
        
        let confirmAction = UIAlertAction(title: "Confirm", style: .default) { (_) in
            if let field = alertController.textFields?[0] {
                // store your data
                //UserDefaults.standard.set(field.text, forKey: "userGroup")
                //UserDefaults.standard.synchronize()
                print("tEXT IS ")
                print(field.text)
                //self.Home.addGroup(groupName: field.text!)
            } else {
                // user did not fill field
                print("Nothing filled")
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }
        
        alertController.addTextField { (textField) in
            textField.placeholder = "New Group"
        }
        
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    //displays an alert showing user has reached max number of courses
    func presentCoursesFilledAlert() {
        let alertController = UIAlertController(title: "Oh No!", message: "Maximum Number of Groups Reached!", preferredStyle: .alert)
        
        let confirmAction = UIAlertAction(title: "Done", style: .default) { (_) in
            
        }
        
        alertController.addAction(confirmAction)

        self.present(alertController, animated: true, completion: nil)
    }
    @IBAction func AddCoursesAction(_ sender: Any) {
        
        
        if Home.coursesFull { //user has max groups->display alert
            presentCoursesFilledAlert()
            
        }else{ //can at least add one more group
            
            self.performSegue(withIdentifier: "HomeScreenToAddGroup", sender: self)
        }
    }
    
    
    //send group id to next screen for loading data
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        let userID = uID
        if let destinationViewController = segue.destination as? NextScreenController {
            destinationViewController.userID = userID
           
            destinationViewController.groupSelected = groupSelected
        }
        if let destinationViewController = segue.destination as? AddCourseViewController {
            
            destinationViewController.userID = userID
        }
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
