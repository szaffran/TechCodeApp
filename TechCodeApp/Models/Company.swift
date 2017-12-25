//
//  Company.swift
//  TechCodeApp
//
//  Created by Mac on 24/12/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

import UIKit

class Company: NSObject
{
    var id : Int
    var name : String
    var responsibleName: String
    var email : String
    var phone : String
    var workforce : Int
    
    init( id : Int, name : String, responsibleName : String,  email : String, phone : String, workforce: Int){
        self.id = id
        self.name = name
        self.responsibleName = responsibleName
        self.email = email
        self.phone = phone
        self.workforce = workforce
    }
    
}

