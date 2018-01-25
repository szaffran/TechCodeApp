//
//  CompanyManager.swift
//  TechCodeApp
//
//  Created by Mac on 25/12/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

import UIKit
import Firebase

class CompanyManager: NSObject
{
    var company : Company?
    
    static let sharedInstance = CompanyManager()
    
    private  override init() {
        super.init()
    }
    
    func getReservationFromFirebase(completion : @escaping () -> ())
    {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        Database.database().reference().child("companys").child(uid).child("reservations").observeSingleEvent(of: .value) { (snapshot) in
            print("snapshot")
            print(snapshot)
            
            if let dictionary = snapshot.value as? Dictionary<String,Any>  {
                for item in dictionary{
                    
                    self.company?.reservations.append(Reservation(dict: item.value as! Dictionary<String, Any>))
                    print()
                }
                completion()
            }
            else{
                completion()
                
            }
            
          
        }
    }
}

