//
//  Company.swift
//  TechCodeApp
//
//  Created by Mac on 24/12/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

import UIKit
enum status
{
    case Company
    case manager
}

class Company: NSObject
{
    var login : String = ""
    var password : String = ""
    var id : Int
    var name : String
    var responsibleName: String
    var email : String
    var phone : String
    var workforce : Int
    var status : status
    
    override init(){
        self.id = 0
        self.name = ""
        self.responsibleName = ""
        self.email = ""
        self.phone = ""
        self.workforce = 0
        self.status = .Company
    }
    
    init( id : Int, name : String, responsibleName : String,  email : String, phone : String, workforce: Int, status : status){
        self.id = id
        self.name = name
        self.responsibleName = responsibleName
        self.email = email
        self.phone = phone
        self.workforce = workforce
        self.status = status
    }
    
}

