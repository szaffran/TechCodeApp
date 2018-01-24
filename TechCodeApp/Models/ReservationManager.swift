//
//  ReservationManager.swift
//  TechCodeApp
//
//  Created by Mac on 14/01/2018.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit

class ReservationManager: NSObject {
    static var sharedInstance  = ReservationManager()
    
     var reservations :[Reservation] =  []

    private override init() {}
    
    func getReservations() -> [Reservation]{
        return reservations
    }
    
    func updateReservations(newReservation : Reservation){
        reservations.append(newReservation)
    }
    
}
