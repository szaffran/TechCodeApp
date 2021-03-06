//
//  Client.swift
//  TechCodeApp
//
//  Created by Mac on 24/12/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

import UIKit
import  Firebase
enum reservationMode {
    case creation
    case edit
}

enum addedTo {
    case room
    case company
}


class Reservation {
    var id : String = ""
    var mode = reservationMode.creation
    var checkIn : String
    var checkout : String
    var date : String
    var room : Room
    var roomId : String
    var bookerName : String
    var bookerMail : String
    var company : Company
    var numberOfGuest : Int
    
    
    convenience init(dict : Dictionary<String,Any>)
    {
        self.init()
        
        //        let dateFormatter = DateFormatter()
        //         dateFormatter.dateStyle = .medium
        //        var sharedDateStr: String = ""
        //
        //         dateFormatter.dateStyle = .medium
        //        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
        
        if let id: String = dict["id"] as? String  {
            self.id = id
        }
        if let bookerName : String = dict["bookerName"] as? String  {
            self.bookerName = bookerName
        }
        if let bookerMail : String = dict["bookerMail"] as? String  {
            self.bookerMail = bookerMail
        }
        if let strDate : String = dict["date"] as? String  {
            //            sharedDateStr = strDate
            //            let dateString = "\(strDate) 00:00"
            //           let date: Date = dateFormatter.date(from: dateString)!
            self.date = strDate
        }
        if var checkInStr : String = dict["checkIn"] as? String  {
            //             checkInStr = "\(sharedDateStr) \(checkInStr)"
            //            let checkIn: Date = dateFormatter.date(from: checkInStr)!
            //
            self.checkIn = checkInStr
        }
        if var checkoutStr : String = dict["checkout"] as? String  {
            //             checkoutStr = "\(sharedDateStr) \(checkoutStr)"
            //            let checkout: Date = dateFormatter.date(from: checkoutStr)!
            self.checkout = checkoutStr
        }
        
        if let numberOfGuest : Int = dict["numberOfGuest"] as? Int  {
            self.numberOfGuest = numberOfGuest
        }
        if let indexRoom : String = dict["numberOfGuest"] as? String  {
            self.roomId = indexRoom
        }
        
        if let roomId : String = dict["roomId"] as? String  {
            self.room = getRoomById(id: roomId)
        }
        
        self.mode = reservationMode.edit
        
    }
    
    
    init()
    {
        self.bookerName = ""
        self.bookerMail = ""
        self.company = Company()
        self.room = Room()
        self.checkIn = "00:00"
        self.checkout = "00:00"
        self.date = ""
        self.numberOfGuest = 0
        self.roomId = ""
    }
    
    init(id: String, bookerName : String,  bookerMail : String, room: Room, date: String, checkIn: String, checkout : String, company : Company, numberOfGuest : Int)
    {
        self.bookerName = bookerName
        self.bookerMail = bookerMail
        self.company = company
        self.room = room
        self.checkIn = checkIn
        self.checkout = checkout
        self.date = date
        self.numberOfGuest = numberOfGuest
        self.roomId = room.roomId
    }
    
    
    func getRoomById( id : String) -> Room
    {
        for item in RoomManager.sharedInstance.rooms{
            if(item.roomId == id){
                return item
            }
        }
        return Room()
    }
    
    func updateDataBase(to added : addedTo )
    {
        let ref = Database.database().reference(fromURL: "https://techcode-1.firebaseio.com/")
        var reservationReference = ref
        
        
        if ( self.id == ""){
            self.id = ref.child("companys").child(CompanyManager.sharedInstance.company!.id ).child("reservations").childByAutoId().key
        }
        
        //update
        if (added == addedTo.company){
            
             reservationReference = ref.child("companys").child(CompanyManager.sharedInstance.company!.id ).child("reservations").child(self.id)
            
            
//            if let res = ref.child("companys").child(CompanyManager.sharedInstance.company!.id ).child("reservations") as?  Dictionary<String,Any> {
//
//                ref.child("companys").child(CompanyManager.sharedInstance.company!.id ).child("reservations").observeSingleEvent(of: .value) { (snapshot) in
//
//                    if let dictionary = snapshot.value as? Dictionary<String,Any>{
//                        var reservationExist = false
//                        for item in dictionary{
//                            if(item.key == self.id){
//                                reservationReference = ref.child("companys").child(CompanyManager.sharedInstance.company!.id ).child("reservations").child(self.id)
//                                reservationExist = true
//                            }
//                        }
//                        if (reservationExist == false){
//                           reservationReference = ref.child("companys").child(CompanyManager.sharedInstance.company!.id ).child("reservations").childByAutoId()
//                        }
//                    }
//                }
//            }
//            else{
//                reservationReference = ref.child("companys").child(CompanyManager.sharedInstance.company!.id ).child("reservations").childByAutoId()
//                self.id = reservationReference.key
//            }
        }
            
        else if (added == addedTo.room){
            reservationReference = ref.child("rooms").child(self.roomId).child("reservations").child(self.id)
        }
            
        else{
            
            return
        }
        
     
        let reservation = ["roomId": roomId,"id" : id,"bookerName" : bookerName, "bookerMail" : bookerMail, "checkIn" : self.checkIn, "checkout" : self.checkout, "date" : self.date] as [String : Any]
        
        reservationReference.updateChildValues(reservation, withCompletionBlock:{(err,ref) in
            if err != nil
            {
                return
            }
        })
    }
}






//    func updateDataBase(to added : addedTo )
//    {
//        let ref = Database.database().reference(fromURL: "https://techcode-1.firebaseio.com/")
//        var reservationReference = ref
//
//
//        //update
//        if (added == addedTo.company){
//         reservationReference = ref.child("companys").child(CompanyManager.sharedInstance.company!.id ).child("reservations").childByAutoId()
//        }
//        else if (added == addedTo.room){
//          reservationReference = ref.child("room").child(roomId).child("reservations").childByAutoId()
//        }
//        else{
//
//            return
//        }
//        let dateFormatter = DateFormatter()
//        let timeFormatter = DateFormatter()
//
//        timeFormatter.timeStyle = .short
//        dateFormatter.dateStyle = .medium
//
//        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
//
//
////        dateFormatter.dateFormat = "dd-MM-yyyy"
////        let strDate =  dateFormatter.string(from: self.date)
////        dateFormatter.dateFormat = "HH:mm"
////        let startTime = dateFormatter.string(from: self.checkIn)
////        let endTime = dateFormatter.string(from:  self.checkout)
//
//
//         let reservation = ["roomId": roomId,"id" : reservationReference.key,"bookerName" : bookerName, "bookerMail" : bookerMail, "checkIn" : self.checkIn, "checkout" : self.checkout, "date" : self.date] as [String : Any]
//
//        reservationReference.updateChildValues(reservation, withCompletionBlock:{(err,ref) in
//            if err != nil
//            {
//                return
//            }
//        })
//    }
//}




