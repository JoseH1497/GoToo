//
//  Group_Cell.swift
//  go-too
//
//  Created by Sergio Rosendo on 5/3/18.
//  Copyright © 2018 Reactive Works. All rights reserved.
//

import UIKit

class Group_Cell: UITableViewCell {

    @IBOutlet weak var group_name_label: UILabel!
    @IBOutlet weak var group_color_image: UIImageView!
    
    func set_group(group_name : String){
        group_name_label.text = group_name
    }
    
}
