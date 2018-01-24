//
//  ReservationList.swift
//  TechCodeApp
//
//  Created by Mac on 14/01/2018.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit

protocol UpdateReservationProtocol : NSObjectProtocol {
    func updateReservation(reservation : Reservation)
}

//protocol TableViewCellDelegate {
//   // func tableViewCell(singleTapActionDelegatedFrom cell: ConfirmationTableViewCell)
//    func tableViewCell(doubleTapActionDelegatedFrom cell: ConfirmationTableViewCell)
//}
//
//extension ReservationList:TableViewCellDelegate {
////    func tableViewCell(singleTapActionDelegatedFrom cell: ConfirmationTableViewCell) {
////        let indexPath = tableView.indexPath(for: cell)
////        print("singleTap \(String(describing: indexPath)) ")
////    }
////
//    func tableViewCell(doubleTapActionDelegatedFrom cell: ConfirmationTableViewCell) {
//        let indexPath = tableView.indexPath(for: cell)
//        print("doubleTap \(String(describing: indexPath)) ")
//    }
//}


class ReservationList: BaseViewController,UITableViewDelegate,UITableViewDataSource ,UpdateReservationProtocol{
    
  
    @IBOutlet weak var tableView: UITableView!
    var myReservations : [Reservation] = []//CompanyManager.sharedInstance.company!.getReservations()
    var indexOfCellToModify = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        self.tableView.register(UINib(nibName: "ReservationCell", bundle: Bundle.main), forCellReuseIdentifier: "myCell")
        // Do any additional setup after loading the view.
    }
    
    // reload data when has been reservation modified
    override func  viewWillAppear(_ animated: Bool) {
        
         myReservations = CompanyManager.sharedInstance.company!.getReservations()
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.indexOfCellToModify = indexPath.row
        self.performSegue(withIdentifier: "editSegue", sender: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myReservations.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : ReservationCell = (tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! ReservationCell)
        cell.fillReservation(reservation: myReservations[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
//        let editAction = UITableViewRowAction(style: .default, title: "edit",  handler: { (action, indexPath) in
//
//            self.indexOfCellToModify = indexPath.row
//            self.performSegue(withIdentifier: "editSegue", sender: indexPath.row)
//        })
        
        let deleteAction = UITableViewRowAction(style: .destructive, title: "delete"){(action, index)
            in
            
            self.myReservations.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        return [deleteAction]
        //return [editAction,deleteAction]
    }
    
    func updateReservation(reservation: Reservation) {
        
        CompanyManager.sharedInstance.company!.updateReservation(reservation: reservation, index: indexOfCellToModify)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination: ReservationBookingViewController = segue.destination as? ReservationBookingViewController {
            //myReservations[sender as! Int].mode = reservationMode.edit
            destination.reservationToModify = myReservations[sender as! Int]
            destination.updateReservationDelegate = self
        }
    }
}
