//
//  Room.swift
//  TechCodeApp
//
//  Created by Mac on 24/12/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

import UIKit
import Foundation
import Firebase


//perform an inclusive range in between date check.
extension NSDate {
    func isBetweeen(date date1: NSDate, andDate date2: NSDate) -> Bool {
        return date1.compare(self as Date) == self.compare(date2 as Date)
    }
}



class Room
{
    var roomId : String
    var image : UIImage?
    var imageName : String
    var roomName : String
    var capacities : Int
    var roomNumber : Int
    var floorNumber : Int
    var facilities : [String]
    var reservations : [Reservation] = []
    
    init(){
        self.roomId = ""
        self.roomName = ""
        self.capacities = 0
        self.roomNumber = 0
        self.floorNumber = 0
        self.facilities = []
        self.image = UIImage()
        self.imageName = ""
    }
    
    convenience init(dict : Dictionary<String,Any>)
    {
        self.init()
        
        if let roomId: String = dict["roomId"] as? String  {
            self.roomId = roomId
        }
        if let roomName : String = dict["roomName"] as? String  {
            self.roomName = roomName
        }
        if let capacities : Int = dict["capacities"] as? Int  {
            self.capacities = capacities
        }
    
        if let roomNumber : Int = dict["roomNumber"] as? Int  {
            self.roomNumber = roomNumber
        }
        if let floorNumber : Int = dict["floorNumber"] as? Int  {
            self.floorNumber = floorNumber
        }
        if let imageName : String = dict["imageName"] as? String  {
            self.imageName = imageName
            self.image = UIImage(named: imageName)
        }
        
        
        
    }
    
    init( roomId : String, roomName : String,  capacities : Int,  facilities : [String] , roomNumber : Int, floorNumber : Int,imageName : String, image : UIImage? ){
       self.roomId = roomId
        self.roomName = roomName
        self.capacities = capacities
        self.roomNumber = roomNumber
        self.floorNumber = floorNumber
        self.facilities = facilities
        self.imageName = imageName
        self.image = image
        updateDataBase()
    }
    
    
    func addReservation(reservation : Reservation){
        self.reservations.append(reservation)
        reservation.updateDataBase(to: .room)
    }
    
    func getReservations() -> [Reservation]{
        return self.reservations
    }
    
    func updateDataBase()
    {
        //get reference to database
        let ref = Database.database().reference(fromURL: "https://techcode-1.firebaseio.com/")
        
        //update
        let roomReference = ref.child("rooms").childByAutoId()
        
        let room = ["imageName" : imageName ,"roomId" : roomId, "roomName" : roomName, "capacities" : capacities, "roomNumber" : roomNumber, "floorNumber" : floorNumber,] as [String : Any]
        
        roomReference.updateChildValues(room, withCompletionBlock:{(err,ref) in
            if err != nil
            {
                return
            }
        })
    }

    
     func getReservationsFromFirebase()
    {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        Database.database().reference().child("rooms").child(uid).child("reservations").observeSingleEvent(of: .value) { (snapshot) in
            print("snapshot")
            print(snapshot)
            
            if let dictionary = snapshot.value as? Dictionary<String,Any>{
                for item in dictionary{
                    
                    self.reservations.append(Reservation(dict: item.value as! Dictionary<String, Any>))
                    print()
                }
            }
        }
    }
    
    
    
    func occupiedRoom(newReservation : Reservation) -> Bool {
        let startDateNewReservation = newReservation.checkIn as NSDate
        let endDateNewReservation = newReservation.checkout as NSDate
        
        for reservation in reservations{
            
            let startTime = reservation.checkIn as NSDate
            
            if( startDateNewReservation.isBetweeen(date: reservation.checkIn as NSDate, andDate:  reservation.checkout as NSDate) || endDateNewReservation.isBetweeen(date: reservation.checkIn as NSDate, andDate:  reservation.checkout as NSDate) ||  startTime.isBetweeen(date: startDateNewReservation, andDate:  endDateNewReservation))
            {
                return false
            }
        }
         return true
    }
}
