//
//  ReservationCell.swift
//  TechCodeApp
//
//  Created by Mac on 15/01/2018.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit


class ReservationCell: UITableViewCell {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var start: UILabel!
    @IBOutlet weak var end: UILabel!
    @IBOutlet weak var roomName: UILabel!
    

    
    func fillReservation(reservation : Reservation){
        
        //img = UIImageView(frame: CGRectMake(0, 0, 100, 100))
        img.layer.cornerRadius = 12
        img.clipsToBounds = true
        
        let dateFormatter = DateFormatter()
        let timeFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.dateFormat = "dd-MM-yyyy"
        timeFormatter.timeStyle = .medium
        timeFormatter.dateFormat = "HH:mm"
        
        
        self.img.image = reservation.room.image
        //self.start.text = "reservation validate on : \(dateFormatter.string(from: reservation.checkIn))"
        self.start.text = "reservation validate on : \(reservation.date)"
        self.end.text = "from : \( reservation.checkIn)  to : \(reservation.checkout)"
        self.roomName.text = "at th room : \(reservation.room.roomName)"
        
    }
    
    
}
