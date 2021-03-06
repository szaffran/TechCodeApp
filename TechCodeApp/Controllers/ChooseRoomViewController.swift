//
//  ChooseRoomViewController.swift
//  TechCodeApp
//
//  Created by Mac on 26/12/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

import UIKit

class ChooseRoomViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
     weak var updateReservationDelegate : UpdateReservationProtocol?
    var date : String?
    var startTime: String?
    var endTime: String?
    var reservation : Reservation = Reservation()
    var unoccupedRooms : [Room] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        getUnoccupedRooms()
        self.tableView.register(UINib(nibName: "Cell1", bundle: Bundle.main), forCellReuseIdentifier: "myCell")
    }
    
    func getUnoccupedRooms(){
        
       // MockObjects.fillReservationsForListRoom()
        
        for room in RoomManager.sharedInstance.rooms{
            if(room.occupiedRoom(newReservation: reservation)){
                unoccupedRooms.append(room)
            }
        }
    }
   
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : Cell1 = (tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as? Cell1)!
        
        cell.fillRoom(room : unoccupedRooms[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let selectedRow = unoccupedRooms[indexPath.row]
        
        performSegue(withIdentifier: "confirmationSegue", sender: selectedRow)
        
    }

     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return unoccupedRooms.count
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let confirmationVC: ConfirmationReservationViewController = segue.destination as? ConfirmationReservationViewController {
            reservation.room = sender as! Room
            reservation.roomId = reservation.room.roomId
            confirmationVC.reservation = self.reservation
            confirmationVC.updateReservationDelegate = self.updateReservationDelegate
        }
    }

    @IBAction func back(_ sender: Any) {
        //self.dismiss
        
        self.navigationController?.popViewController(animated: true)
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
