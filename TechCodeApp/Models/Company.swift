//
//  Company.swift
//  TechCodeApp
//
//  Created by Mac on 24/12/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

import UIKit
import Firebase

enum status
{
    case Company
    case manager
}

class Company: NSObject
{
   var login : String = ""
   var password : String = ""
    var id : String
    var name : String
    var responsibleName: String
    var email : String
    var phone : String
    var workforce : Int
    var status : status
    var reservations : [Reservation] = []
    //var ref: DatabaseReference?
    //var key: String!
    
    override init(){
        self.id = ""
        self.name = ""
        self.responsibleName = ""
        self.email = ""
        self.phone = ""
        self.workforce = 0
        self.status = .Company
        
    }

    
    init( login : String, password : String, id : String, name : String, responsibleName : String,  email : String, phone : String, workforce: Int, status : status){
        self.login = login
        self.password = password
        self.id = id
        self.name = name
        self.responsibleName = responsibleName
        self.email = email
        self.phone = phone
        self.workforce = workforce
        self.status = status
    }
    
    func addReservation(reservation : Reservation){
        reservation.updateDataBase(to: .company)
        reservations.append(reservation)
    }
    func updateReservation(reservation : Reservation, index : Int){
        reservations[index] = reservation
        reservation.updateDataBase(to: .company)
        
    }
    func getReservations() -> [Reservation]{
        return self.reservations
    }
    func updateDataBase()
    {
        //get reference to database
        let ref = Database.database().reference(fromURL: "https://techcode-1.firebaseio.com/")

        //update
        let companyReference = ref.child("companys").child(CompanyManager.sharedInstance.company!.id )

        let company = ["name" : name, "responsibleName" : responsibleName, "phone" : phone, "workforce" : workforce, "id" : id] as [String : Any]

        companyReference.updateChildValues(company, withCompletionBlock:{(err,ref) in
            if err != nil
            {
                return
            }
        })
    }
    
    
    
}

