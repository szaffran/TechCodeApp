//
//  RoomManager.swift
//  TechCodeApp
//
//  Created by Mac on 23/01/2018.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit
import Firebase

class RoomManager: NSObject {

    var rooms : [Room] = []
    
    static let sharedInstance = RoomManager()
    
    private  override init() {
        super.init()
    }
    
    func getRoomsFromFirebase(completion : @escaping () -> ())
    {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        Database.database().reference().child("rooms").observeSingleEvent(of: .value) { (snapshot) in
            print("snapshot")
            print(snapshot)

            if let dictionary = snapshot.value as? Dictionary<String,Any>{
                for item in dictionary{
                    let room = Room(dict: item.value as! Dictionary<String, Any>)
                    //room.roomId = item.key
                    room.getReservationsFromFirebase()
                    self.rooms.append(room)
                }
                completion()
            }

        }
    }

}
