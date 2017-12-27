//
//  Client.swift
//  TechCodeApp
//
//  Created by Mac on 24/12/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

import UIKit

class Reservation: NSObject {
   
    
    var checkIn : Date
    var checkout : Date
    var date : Date
    var room : Room
    var bookerName : String
    var bookerMail : String
    var company : Company
    var numberOfGuest : Int
    
    init(  bookerName : String,  bookerMail : String, room: Room, date: Date, checkIn: Date, checkout : Date, company : Company, numberOfGuest : Int)
    {
        self.bookerName = bookerName
        self.bookerMail = bookerMail
        self.company = company
        self.room = room
        self.checkIn = checkIn
        self.checkout = checkout
        self.date = date
        self.numberOfGuest = numberOfGuest
    }
    
}




