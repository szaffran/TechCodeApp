//
//  LoginViewController.swift
//  TechCodeApp
//
//  Created by Mac on 24/12/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: BaseViewController , protDelegate {
    
    @IBOutlet weak var AuthenticateButton: UIButton!
    @IBOutlet weak var txtViewLogin: UITextField!
    @IBOutlet weak var password: UITextField!
    //let ref = Database.database().reference(withPath: "userItem")
    
    
    func funDelegate(text : String) {
        txtViewLogin.text = text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AuthenticateButton.layer.cornerRadius = 10
        AuthenticateButton.clipsToBounds = true
        //MockObjects.fillReservationsForListRoom()
    }
    
    
    @IBAction func authenticateButtonTapped(_ sender: Any) {
        
        handleLogin()
       
        
//        if let filtered_list : [Company] = MockObjects.listCompany.filter({$0.login == txtViewLogin.text})
//        {
//            if let filtered_list : [Company] = filtered_list.filter({$0.password == password.text})
//            {
//                if filtered_list.count == 1
//                {
//                    CompanyManager.sharedInstance.company = filtered_list[0]
//                    for res in filtered_list[0].reservations
//                    {
//                        CompanyManager.sharedInstance.company!.addReservation(reservation: res)
//                    }
//                    performSegue(withIdentifier: "userLoginSegue", sender: nil)
//                }
//            }
//        }
    }
    
    func handleLogin(){
        guard let email = txtViewLogin.text,
            let password = password.text else{return}
        Auth.auth().signIn(withEmail: email, password: password, completion:
            { [weak self] (user, error) in
                if error != nil
                {
                    let alertView = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert )
                    print(error)
                    let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
                    
                    alertView.addAction(okAction)
                    
                    self?.present(alertView, animated: true, completion: nil)
                    return
                }
                guard let uid = Auth.auth().currentUser?.uid else {return}
                CompanyManager.sharedInstance.company = Company()
                CompanyManager.sharedInstance.company!.email = self!.txtViewLogin.text!
                CompanyManager.sharedInstance.company!.id = uid
                //CompanyManager.sharedInstance.company!.updateDataBase()
                RoomManager.sharedInstance.getRoomsFromFirebase{ () in
                    
                    print(RoomManager.sharedInstance.rooms)
                    
                    CompanyManager.sharedInstance.getReservationFromFirebase { () in
                        
                        print(CompanyManager.sharedInstance.company?.reservations)
                        
                        self?.performSegue(withIdentifier: "userLoginSegue", sender: nil)
                    }
                }
        })
        
    }
    
    // if let login = MockObjects.listCompany.
    
    
    
    //   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //       if let addUserVC = segue.destination as? OldBookingViewController{
    //            addUserVC.myDelegate = self
    //            addUserVC.myText = "et voila le text que je veux afficher"
    //
    //        }
    //    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    
}
