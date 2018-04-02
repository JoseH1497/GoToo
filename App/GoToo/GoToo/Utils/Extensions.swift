//
//  Extensions.swift
//  
//
//  Created by Jose Herrera on 4/1/18.
//

import UIKit


extension UIColor{
    
    static func rgb (r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
        return UIColor(displayP3Red: r/255, green: g/255, blue: b/255, alpha: 1)
        
    }
    
    
}



extension UITextField{
    func setBottomBorder(backGroundColor: UIColor, borderColor: UIColor){
        self.layer.backgroundColor =  backGroundColor.cgColor
        
        //defines the layers shadow
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
        self.layer.shadowColor = borderColor.cgColor
    }
}
extension UIView{
    
func anchors(topAnchor: NSLayoutYAxisAnchor?, topPad: CGFloat, bottomAnchor: NSLayoutYAxisAnchor?, bottomPad: CGFloat, leftAnchor: NSLayoutXAxisAnchor?, leftPad: CGFloat, rightAnchor: NSLayoutXAxisAnchor?, rightPad: CGFloat, height: CGFloat, width: CGFloat){
    
    
    
    self.translatesAutoresizingMaskIntoConstraints = false
    
    if let topAnchor = topAnchor {
        self.topAnchor.constraint(equalTo: topAnchor, constant: topPad).isActive = true
    }
    if let bottomAnchor = bottomAnchor {
        self.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -bottomPad).isActive = true
    }
    
    if let leftAnchor = leftAnchor{
        self.leftAnchor.constraint(equalTo: leftAnchor, constant: leftPad).isActive = true
        
    }
    
    if let rightAnchor = rightAnchor{
        self.leftAnchor.constraint(equalTo: rightAnchor, constant: -rightPad).isActive = true
        
    }
    
    if height > 0{
        self.heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    if width > 0{
        self.widthAnchor.constraint(equalToConstant: width).isActive = true
    }
}

}
