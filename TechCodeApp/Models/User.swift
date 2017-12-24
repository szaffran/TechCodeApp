//
//  Client.swift
//  TechCodeApp
//
//  Created by Mac on 24/12/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

import UIKit

class User: NSObject {
    enum status {
        case admin
        case client
    }

    var companyName : String
    var userName : String
    var email : String
    var roomName : String
    var time : Date
    var date : Date
    var autorisationStatus : status
    
    init(companyName : String,  userName : String,  email: String,  roomName: String, time: Date, date: Date, status : status )
    {
        self.companyName = companyName
        self.userName = userName
        self.email = email
        self.roomName = roomName
        self.time = time
        self.date = date
        self.autorisationStatus = status
    }
    
}




