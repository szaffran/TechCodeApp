//
//  LogOutViewController.swift
//  TechCodeApp
//
//  Created by Mac on 20/01/2018.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit
import Firebase

class LogOutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        handleLogout()
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "login") as? LoginViewController
        {
           // vc.newsObj = newsObj
            present(vc, animated: true, completion: nil)
        }
    }
    
    func handleLogout(){
        if Auth.auth().currentUser?.uid != nil{
            do {
                try Auth.auth().signOut()
                
            } catch let logOutError {
                print(logOutError.localizedDescription)
            }
        }
        
    }
}
