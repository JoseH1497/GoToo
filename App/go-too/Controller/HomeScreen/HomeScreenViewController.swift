//
//  HomeScreenViewController.swift
//  go-too
//
//  Created by Sergio Rosendo on 4/2/18.
//  Copyright © 2018 Reactive Works. All rights reserved.
//

import UIKit

class HomeScreenViewController: UIViewController {
    
    
    
    @IBOutlet weak var TopBar: UIImageView!
    
    
    //Course Buttons on Stack View
    @IBOutlet weak var Course1Button: UIButton!
    @IBOutlet weak var Course2Button: UIButton!
    @IBOutlet weak var Course3Button: UIButton!
    @IBOutlet weak var Course4Button: UIButton!
    @IBOutlet weak var Course5Button: UIButton!
    @IBOutlet weak var Course6Button: UIButton!
    
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
        
        //Start by having all course buttons hidden
        unhideAllCourseButtons()
        hideAllCourseButtons()
        
        
        //hideAllCourseButtons()
        //button Count will get the number of courses or groups this user has
        var buttonCount = getButtonCountFromDatabase()
        
        //Generate buttons based on buttonCount
        generateButtons(ButtonCount: buttonCount)
    }
    
    
    
   
    //MARK: - Generate Buttons Function
    //This function will unhide the amount of buttons we need for the number of groups the user has
    //TODO: We need to load the each course title and put it on the button text for each needed button
    //Each button will go to the same view controller
     fileprivate func generateButtons(ButtonCount : Int){
        
        //create array to hold all course names and set each button title to that course name for display
        var courseNames = [String] ()
        
        
        //GET course names
        courseNames = getCourseNamesFromDataBase(CourseNumber: ButtonCount)
        for i in 1...ButtonCount{
            //We know we have 1-6 courses possible so we hide them all at first and will only make the ones visible that need to be
            
            
            //make buttons visible and set the text to the correct Course name
            switch(i){
                
            case 1:
                //course 1 button
                Course1Button.isHidden = false;
                Course1Button.setTitle(courseNames[i-1], for: .normal)
                break
            case 2:
                //course 2 button
                Course2Button.isHidden = false;
                Course2Button.setTitle(courseNames[i-1], for: .normal)
                break
            case 3:
                //course 3 button
                Course3Button.isHidden = false;
                Course3Button.setTitle(courseNames[i-1], for: .normal)
                break
            case 4:
                //course 4 button
                Course4Button.isHidden = false;
                Course4Button.setTitle(courseNames[i-1], for: .normal)
                break
            case 5:
                //course 5 button
                Course5Button.isHidden = false;
                Course5Button.setTitle(courseNames[i-1], for: .normal)
                break
            case 6:
                //course 6 button
                Course6Button.isHidden = false;
                Course6Button.setTitle(courseNames[i-1], for: .normal)
                break
                
            //should never get here
            default:
                print("ERROR")
                break
                
            }
            
            //print(coursename)
        }
     
     
     }
    
    //This function will go to the database and get the number of groups from a variable
    //being stored in the database
    fileprivate func getButtonCountFromDatabase() -> Int{
        //MARK: - Need to get button count from database
        //TODO: Get integer value from database to buttonCount variable
        var buttonCount : Int
        /**
         Database stuff that gives us buttonCount = # of courses of user
 
         **/
        
        
        buttonCount = 2;//here for testing
        
        return buttonCount
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
    //MARK: -this function returns an array of strings holding the course names to be displayed
    //on the buttons
    fileprivate func getCourseNamesFromDataBase(CourseNumber : Int) -> Array<String>{
        
        
        var courseNamesFromDataBase  = [String]()
        /**TODO:
                Need to get course names from database and put into courseNamesFromDatabase array
 
 
         **/
        
        var courseNames  = [String]()//testing purposes
        courseNames.append("CSE 120")
        courseNames.append("CSE 150")
        courseNames.append("CSE 165")
        courseNames.append("ENGR 65")
        courseNames.append("CSE 175")
        courseNames.append("CSE 111")
        
        courseNamesFromDataBase = courseNames
        
        return courseNamesFromDataBase
        
    }
    
    
    
    //MARK: - Actions and Selectors
    @objc func nextGroupScreenAction(sender:UIButton){
        //this will send to the next view
        self.performSegue(withIdentifier: "HomeScreenToNextCourseSegue", sender: self)
    }
    
    
    
    //MARK: Actions For CourseButtons
    //TODO: Need to load correct data to the next view screen for the corresponding course
    //TODO: Need to update an instance of a Groups object that is stored in an array in the super user class
    //once, we need to save the info from database and then we can load it to the next screen once the button is pressed
    //Based on which button is pressed, we will know which data to load to the Groups object
    //this will send to the next view
    @IBAction func Course1Action(_ sender: Any) {
        
        self.performSegue(withIdentifier: "HomeScreenToNextCourseSegue", sender: self)
    }
    
    @IBAction func Course2Action(_ sender: Any) {
        //this will send to the next view
        self.performSegue(withIdentifier: "HomeScreenToNextCourseSegue", sender: self)
    }
    
    @IBAction func Course3Action(_ sender: Any) {
        //this will send to the next view
        self.performSegue(withIdentifier: "HomeScreenToNextCourseSegue", sender: self)
    }
    
    @IBAction func Course4Action(_ sender: Any) {
        //this will send to the next view
        self.performSegue(withIdentifier: "HomeScreenToNextCourseSegue", sender: self)
    }
    @IBAction func Course5Action(_ sender: Any) {
        //this will send to the next view
        self.performSegue(withIdentifier: "HomeScreenToNextCourseSegue", sender: self)
    }
    
    @IBAction func Course6Action(_ sender: Any) {
        //this will send to the next view
        self.performSegue(withIdentifier: "HomeScreenToNextCourseSegue", sender: self)
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
