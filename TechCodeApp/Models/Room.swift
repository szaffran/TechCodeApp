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
    
    
    init(  roomName : String,  capacities : Int,  facilities : [String] , roomNumber : Int, floorNumber : Int, image : UIImage? ){
        self.roomName = roomName
        self.capacities = capacities
        self.roomNumber = roomNumber
        self.floorNumber = floorNumber
        self.facilities = facilities
        self.image = image
    }
    
    static var listRoom : [Room]  {
        return [ Room(roomName : "room1", capacities : 20, facilities : ["wifi","vc","tv","tel"], roomNumber : 201, floorNumber : 1, image: UIImage(named: "photo1")), Room(roomName : "room2", capacities : 30, facilities : ["wifi","vc","tv","tel"], roomNumber : 202, floorNumber : 1,image: UIImage(named : "photo2")), Room(roomName : "room3", capacities : 10, facilities : ["wifi","vc","tv","tel"], roomNumber : 203, floorNumber : 1, image : UIImage(named : "photo3"))]
    }
 
}
