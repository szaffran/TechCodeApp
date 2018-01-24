//
//  MenuViewController.swift
//  SlideMenuExample
//
//  Created by Eric Shorr on 28/12/2017.
//  Copyright © 2017 Developer Institute. All rights reserved.
//

import UIKit

class MenuViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource
{
    //let menuItems = MenuItem.loadSampleFromPlist()
    let menuItems : [MenuItem] = [MenuItem(title: "New reservation",selector: "creation:"),MenuItem(title: "My Reservations",selector: "list:"),MenuItem(title: "Log Out",selector: "logOut:")]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    @IBAction func creation(_ sender: Any?)
    {
        if let slideMenuController : ShownMenuVC = self.viewDeckController as? ShownMenuVC
        {
            slideMenuController.centerViewController = slideMenuController.creationController
            slideMenuController.closeSide(true)
        }
    }
    
    @IBAction func logOut(_ sender: Any?)
    {
        if let slideMenuController : ShownMenuVC = self.viewDeckController as? ShownMenuVC
        {
            slideMenuController.centerViewController = slideMenuController.logOutController
            slideMenuController.closeSide(true)
        }
    }
    
    @IBAction func list(_ sender: Any?)
    {
        if let slideMenuController : ShownMenuVC = self.viewDeckController as? ShownMenuVC
        {
            slideMenuController.centerViewController = slideMenuController.listController
            slideMenuController.closeSide(true)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.menuItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let menuItem = self.menuItems[indexPath.row]
        cell.textLabel?.text = menuItem.title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableView.deselectRow(at: indexPath, animated: false)
        let menuItem = self.menuItems[indexPath.row]
        self.perform(menuItem.selector, with: nil)
    }
    
}
