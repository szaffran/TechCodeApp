//
//  ConfirmationReservationViewController.swift
//  TechCodeApp
//
//  Created by Mac on 27/12/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

import UIKit

class ConfirmationReservationViewController: BaseViewController, UITableViewDelegate,UITableViewDataSource {
   
    @IBOutlet weak var labelConfirmation: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var selectedRoom : Room?
    var date : String?
    var startTime: String?
    var endTime: String?
    
    
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib(nibName: "ConfirmationTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "myCellConfirm")
        // Do any additional setup after loading the view.
        self.labelConfirmation.text = "Confirm your reservation"
        self.tableViewHeight.constant = 1
        
        
    }

    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
       
                return 4
    }
    
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : ConfirmationTableViewCell = (tableView.dequeueReusableCell(withIdentifier: "myCellConfirm", for: indexPath) as? ConfirmationTableViewCell)!
        
        
        switch indexPath.row {
      
        case 0:
            cell.fillValue(value : "date : \(self.date!)")
        case 1:
            cell.fillValue(value : "start time : \(self.startTime!)")
        case 2:
            cell.fillValue(value : "end time : \(self.endTime!)")
        case 3:
            cell.fillValue(value : "Room name : \(self.selectedRoom!.roomName)")
        default :
            break
        }
        
         self.tableViewHeight.constant += cell.frame.height
        return cell
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
