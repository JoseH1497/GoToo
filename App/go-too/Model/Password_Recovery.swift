//
//  Password_Recovery.swift
//  go-too
//
//  Created by Sergio Rosendo on 4/7/18.
//  Copyright © 2018 Reactive Works. All rights reserved.
//

import Foundation
class Password_Recovery{
    var security_question_1 : String
    var security_question_2 : String
    var security_question_3 : String
    var provided_answer     : String

    init(){
        security_question_1 = ""
        security_question_2 = ""
        security_question_3 = ""
        provided_answer     = ""
    }

    func set_security_question(question_num : Int , question : String ){
        switch question_num {
            case 1:
                security_question_1 = question
            case 2:
                security_question_2 = question
            case 3:
                security_question_3 = question
            default:
                break
        }
    }

    func get_security_question(question_num : Int){
        switch question_num{
            case 1:
                //
                break
            case 2:
                //
                break
            case 3:
                //
                break 
            default:
                break
        }
    }
}


