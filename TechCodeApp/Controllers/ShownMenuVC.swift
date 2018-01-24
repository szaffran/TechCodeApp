//
//  ShownMenuVC.swift
//  TechCodeApp
//
//  Created by Mac on 14/01/2018.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit
import ViewDeck

class ShownMenuVC: IIViewDeckController
{
    
    
    lazy var menuController : UIViewController = {
        
        return UIStoryboard(name: "Menu", bundle: Bundle.main).instantiateInitialViewController()
        
        }()!
    
    lazy var creationController : UIViewController = {
        
        return UIStoryboard(name: "Creation", bundle: Bundle.main).instantiateInitialViewController()
        
        }()!
    
    lazy var listController : UIViewController = {
        
        return UIStoryboard(name: "List", bundle: Bundle.main).instantiateInitialViewController()
        
        }()!
    
    lazy var logOutController : UIViewController = {
        
        return UIStoryboard(name: "LogOut", bundle: Bundle.main).instantiateInitialViewController()
        
        }()!
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        
        self.leftViewController = self.menuController
        self.centerViewController = self.listController
        self.isPanningEnabled = false
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    
    
}
