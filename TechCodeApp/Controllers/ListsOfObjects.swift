//
//  ListsOfObjects.swift
//  TechCodeApp
//
//  Created by Mac on 28/12/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

import UIKit

class ListsOfObjects: NSObject {
    
    static var listRoom : [Room]  {
        return [ Room(roomName : "room1", capacities : 20, facilities : ["wifi","vc","tv","tel"], roomNumber : 201, floorNumber : 1, image: UIImage(named: "photo1")), Room(roomName : "room2", capacities : 30, facilities : ["wifi","vc","tv","tel"], roomNumber : 202, floorNumber : 1,image: UIImage(named : "photo2")), Room(roomName : "room3", capacities : 10, facilities : ["wifi","vc","tv","tel"], roomNumber : 203, floorNumber : 1, image : UIImage(named : "photo3"))]
    }

//    static var listCompany : [Company]  {
//        return [ Company(id: 1, name: "company1", responsibleName: "responsible1", email: "aaaa", phone: 000, workforce: 10, status: )]
//    }
    
    

}
