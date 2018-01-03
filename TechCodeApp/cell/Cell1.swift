//
//  cell1.swift
//  TechCodeApp
//
//  Created by Mac on 25/12/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

import UIKit

class Cell1: UITableViewCell {

   
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var surname: UILabel!
    
    
    func fillRoom(room : Room){
        self.img.image = room.image
        self.name.text = room.roomName
        self.surname.text = String(room.roomNumber)
    }
   
    
}
