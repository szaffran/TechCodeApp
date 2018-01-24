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
    
    weak var updateReservationDelegate : UpdateReservationProtocol?
    
     var reservation : Reservation = Reservation()
    
//    var selectedRoom : Room?
    var date : String?
    var startTime: String?
    var endTime: String?
    
    
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initValues()
        
        self.tableView.register(UINib(nibName: "ConfirmationTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "myCellConfirm")
       
        // Do any additional setup after loading the view.
        self.labelConfirmation.text = "Confirm your reservation"
        self.tableViewHeight.constant = 1
        
    }
    
    func initValues(){
        
        let dateFormatter = DateFormatter()
        let timeFormatter = DateFormatter()
        
        timeFormatter.timeStyle = .short
        dateFormatter.dateStyle = .medium
        
        self.date =  dateFormatter.string(from: reservation.date)
        self.startTime = timeFormatter.string(from: reservation.checkIn)
        self.endTime = timeFormatter.string(from:  reservation.checkout)
    }

    
    @IBAction func back(_ sender: Any) {
        //self.dismiss(animated: true)
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func confirm(_ sender: Any) {
        
        if (reservation.mode == reservationMode.edit){
             updateReservationDelegate!.updateReservation(reservation: reservation)
        }
        else{
            self.reservation.mode = reservationMode.edit
            CompanyManager.sharedInstance.company?.addReservation(reservation: self.reservation)
        }
        
        
        if let slideMenuController : ShownMenuVC = self.viewDeckController as? ShownMenuVC
        {
            self.navigationController?.popToRootViewController(animated: false)
            slideMenuController.centerViewController = slideMenuController.listController
            slideMenuController.closeSide(true)
        }
        
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
            cell.fillValue(value : "Room name : \(self.reservation.room.roomName)")
            
        default :
            break
        }
        

            self.tableViewHeight.constant = cell.frame.height * 4
      
        
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
