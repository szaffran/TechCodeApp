//
//  MockObjects.swift
//  TechCodeApp
//
//  Created by Mac on 09/01/2018.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit

class MockObjects: NSObject {
    
    
    
//    static var listRoom : [Room] = [
//        Room(roomId: "1",roomName : "room1", capacities : 20, facilities : ["wifi","vc","tv","tel"], roomNumber : 201, floorNumber : 1,imageName: "photo1", image: UIImage(named: "photo1")), Room(roomId: "2",roomName : "room2", capacities : 30, facilities : ["wifi","vc","tv","tel"], roomNumber : 202, floorNumber : 1,imageName: "photo2",image: UIImage(named : "photo2")), Room(roomId: "3",roomName : "room3", capacities : 10, facilities : ["wifi","vc","tv","tel"], roomNumber : 203, floorNumber : 1,imageName: "photo3", image : UIImage(named : "photo3"))]
//
     //static var listRoom : [Room]
    
    
//    static func fillReservationsForListRoom(){
//
//        var value = 0
//        let dateFormatter = DateFormatter()
//
//        let today = Date()
//        dateFormatter.dateFormat = "dd"
//        let day: String = String(Int(dateFormatter.string(from: today))! + 1)
//
//        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
//        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
//
//        for room in  MockObjects.listRoom {
//            for index in 0...3{
//
//                let dateStart: Date = dateFormatter.date(from: "\(day)-01-2018 0\(value):00")!
//                value += 1
//                let dateEnd: Date = dateFormatter.date(from: "\(day)-01-2018 0\(value):00")!
//
//                let reservation : Reservation = Reservation(id: "",bookerName: "aaa", bookerMail: "aaa", room: room, date: dateStart, checkIn: dateStart, checkout: dateEnd, company: listCompany[index % 2], numberOfGuest: 10)
//                room.reservations.append(reservation)
//                MockObjects.listCompany[index % 2].reservations.append(reservation)
//
//            }
//        print(room.reservations)
//        }
//    }
//
//        static var listCompany : [Company]  =
//             [ Company(login : "company1", password :"password" ,id: "1", name: "company1", responsibleName: "responsible1", email: "aaaa", phone: "000", workforce: 10, status: .Company),Company(login : "company2", password :"password" ,id: "2", name: "company2", responsibleName: "responsible2", email: "bbb", phone: "000", workforce: 10, status: .Company) ]
//
//
//
    
    
}
