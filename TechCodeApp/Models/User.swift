//
//  User.swift
//  TechCodeApp
//
//  Created by Mac on 24/12/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

import UIKit



class User: NSObject
{
    var name : String
    var email : String
    var phone : String
    var company : Company
    
    init( name : String,  email : String, phone : String, company : Company){
       
        self.name = name
        self.email = email
        self.phone = phone
        self.company = company
    }
}
