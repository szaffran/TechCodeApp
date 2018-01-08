//
//  Room.swift
//  TechCodeApp
//
//  Created by Mac on 24/12/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

import UIKit
import Foundation

class Room
{
    var image : UIImage?
    var roomName : String
    var capacities : Int
    var roomNumber : Int
    var floorNumber : Int
    var facilities : [String]
    var bookingCal :  [String: [Bool]]? = nil
    var reservations : [Reservation] = []
    
    
    
    
    init(  roomName : String,  capacities : Int,  facilities : [String] , roomNumber : Int, floorNumber : Int, image : UIImage? ){
        self.roomName = roomName
        self.capacities = capacities
        self.roomNumber = roomNumber
        self.floorNumber = floorNumber
        self.facilities = facilities
        self.image = image
    }
    
 
}
