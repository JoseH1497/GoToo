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
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //mainStackView.isBaselineRelativeArrangement = false
        // createCourseButtons(ButtonImage: #imageLiteral(resourceName: "Login_Button_Login"), buttonCount: 2)
        //generateButtons(ButtonCount: 3, ButtonImage: image)
        
        // Do any additional setup after loading the view.
    }
    
    
    
    //MARK: - Actions and Selectors
    @objc func nextGroupScreenAction(sender:UIButton){
        self.performSegue(withIdentifier: "HomeScreenToNextCourseSegue", sender: self)
    }
    
    
    //MARK: Actions For CourseButtons
    @IBAction func Course1Action(_ sender: Any) {
        self.performSegue(withIdentifier: "HomeScreenToNextCourseSegue", sender: self)
    }
    
    @IBAction func Course2Action(_ sender: Any) {
        self.performSegue(withIdentifier: "HomeScreenToNextCourseSegue", sender: self)
    }
    
    @IBAction func Course3Action(_ sender: Any) {
        self.performSegue(withIdentifier: "HomeScreenToNextCourseSegue", sender: self)
    }
    
    @IBAction func Course4Action(_ sender: Any) {
        self.performSegue(withIdentifier: "HomeScreenToNextCourseSegue", sender: self)
    }
    @IBAction func Course5Action(_ sender: Any) {
        self.performSegue(withIdentifier: "HomeScreenToNextCourseSegue", sender: self)
    }
    
    @IBAction func Course6Action(_ sender: Any) {
        self.performSegue(withIdentifier: "HomeScreenToNextCourseSegue", sender: self)
    }
    /** //MARK: - Generate Buttons Function
     fileprivate func generateButtons(ButtonCount : Int, ButtonImage : UIImage){
     for i in 0..<ButtonCount {
     mainStackView.addArrangedSubview(makeButtonWithImage(ButtonImage:ButtonImage, id : i))
     }
     
     
     }
     
     **/
    
    
    
    
    
    
    
    
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
