//
//  LoginViewController.swift
//  TechCodeApp
//
//  Created by Mac on 24/12/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController , protDelegate {
  
    
    @IBOutlet weak var txtViewLogin: UITextField!
    
    
    func funDelegate(text : String) {
        txtViewLogin.text = text
    }
    

    @IBOutlet weak var AuthenticateButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AuthenticateButton.layer.cornerRadius = 10
        AuthenticateButton.clipsToBounds = true
        
        
        
        
        
    }

    
    @IBAction func authenticateButtonTapped(_ sender: Any) {
        
        
      // performSegue(withIdentifier: "bookingSegue", sender: nil)
        performSegue(withIdentifier: "managerLoginSegue", sender: nil)
        
        
        
        
        
        
    }
    
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
