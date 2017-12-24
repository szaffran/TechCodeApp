//
//  Room.swift
//  TechCodeApp
//
//  Created by Mac on 24/12/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

import UIKit
import Foundation

struct Room {
    var roomName : String = ""
    var capacities : Int = 0
    var facilities : [String] = []
    
    
//    init(  roomName : String,  capacities : Int,  facilities : [String]   ){
//
//    }
    
    var listRoom : [Room]  {
        return [ Room(roomName : "room1", capacities : 20, facilities : ["wifi","vc","tv","tel"]),
                 Room(roomName : "room2", capacities : 30, facilities : ["wifi","vc","tv","tel"])
        ]
    }

}
