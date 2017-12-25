//
//  User.swift
//  TechCodeApp
//
//  Created by Mac on 24/12/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

import UIKit

enum status
{
    case member
    case manager
    case guest
}

class User: NSObject {
    var id : Int
    var name : String
    var surname : String
    var email : String
    var phone : String
    var company : Company
    var status : status
    
    
    init( id: Int,  name : String, surname : String,  email : String, phone : String, status : status, company : Company){
        self.id = id
        self.name = name
        self.surname = surname
        self.email = email
        self.phone = phone
        self.status = status
        self.company = company
        
    }
}
