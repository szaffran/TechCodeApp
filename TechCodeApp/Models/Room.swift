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
    func updateReservation(reservation : Reservation, index : Int){
        reservations[index] = reservation
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
        Database.database().reference().child("rooms").child(roomId).child("reservations").observeSingleEvent(of: .value) { (snapshot) in
            print("snapshot")
            print(snapshot)
            
            if let reservationsDic = snapshot.value as? Dictionary<String,Any>{
                
                for reservation in reservationsDic{
                    
                    print()
                    
                        var x = reservation.value as! Dictionary<String, Any>
                        self.reservations.append(Reservation(dict: reservation.value as! Dictionary<String, Any>))
                        print()
                    
                }
            }
        }
    }
    
    func occupiedRoom(newReservation : Reservation) -> Bool {
        
        //let dateNewReservation = newReservation.date
        let startTimeNewReservation = newReservation.checkIn
        let endTimeNewReservation = newReservation.checkout
        
        
        if let filteredList : [Reservation] = self.reservations.filter({$0.date == newReservation.date})
        {
            for reservation in filteredList
            {
                
                if ( newReservation.checkIn.isBetweeen(startTime : reservation.checkIn, EndTime : reservation.checkout)
                    || newReservation.checkout.isBetweeen(startTime : reservation.checkIn, EndTime : reservation.checkout)
                    || reservation.checkIn.isBetweeen(startTime : newReservation.checkIn, EndTime : newReservation.checkout))
                {
                    return false
                }
            }
            return true
        }
    }
}

