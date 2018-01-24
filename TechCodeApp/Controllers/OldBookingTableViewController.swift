//
//  BookingTableViewController.swift
//  TechCodeApp
//
//  Created by Mac on 26/12/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

import UIKit

class BookingTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateDateViews()
        
     
        let currentDate = Date()
        self.datePicker.minimumDate = currentDate
        
        self.startTimeDatePicker.date = currentDate
        self.startTimeDatePicker.minimumDate = currentDate
        
        self.endTimeDatePicker.minimumDate = currentDate
    
    }
    
    
    
    
    
    //    var registration:Registration? {
    //        //guard let roomType = roomType else { return nil }
    //        let roomType = self.roomType!
    //        let firstName = firstNameTextField.text ?? ""
    //        let lastName = lastNameTextField.text ?? ""
    //        let email = emailTextField.text ?? ""
    //        let checkInDate = checkInDatePicker.date
    //        let checkOutDate = checkOutDatePicker.date
    //
    //        let numberOfAdults = Int(numberOfAdultsStepper.value)
    //        let numberOfChildren = Int(numberOfChildrenStepper.value)
    //        let hasWifi = wifiSwitch.isOn
    //
    //        return Registration(firstName: firstName, lastName: lastName, emailAddress: email, checkInDate: checkInDate, checkOutDate: checkOutDate, numberOfAdults: numberOfAdults, numberOfChildren: numberOfChildren, roomType: roomType, wifi: hasWifi)
    //    }
    
    //    func didSelect(roomType: RoomType) {
    //        self.roomType = roomType
    //        updateRoomType()
    //    }
    
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var lblStartTime: UILabel!
    @IBOutlet weak var startTimeDatePicker: UIDatePicker!
    
    @IBOutlet weak var lblEndTime: UILabel!
    @IBOutlet weak var endTimeDatePicker: UIDatePicker!
    
    
    
    let datePickerIndexPath = IndexPath(row: 1, section: 1)
    let startTimePickerIndexPath = IndexPath(row: 3, section: 1)
    let endTimePickerIndexPath = IndexPath(row: 5, section: 1)
    
    var datePickerShown = false
    var startTimePickerShown = false
    var endTimePickerShown = false
    
    
    func updateDateViews() {
        let dateFormatter = DateFormatter()
        let timeFormatter = DateFormatter()
        
        timeFormatter.timeStyle = .short
        
        dateFormatter.dateStyle = .medium
        
        
        lblDate.text = dateFormatter.string(from: datePicker.date)
        lblStartTime.text = timeFormatter.string(from: startTimeDatePicker.date)
        lblEndTime.text = timeFormatter.string(from: endTimeDatePicker.date)
    }
    
    
    /*
     
     var formatter = NSDateFormatter()
     dateFormatter.dateFormat = "MM-dd-yyyy"
     let time1 = dateFormatter.dateFromString("August 6, 2015")
     
     
     */
    
    
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        
        // endTimeDatePicker.minimumDate = startTimeDatePicker.date
        updateDateViews()
        
    }
    
    
    
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch(indexPath.section, indexPath.row) {
            
        case (datePickerIndexPath.section, datePickerIndexPath.row):
            if  datePickerShown{
                return 216.0
            } else {
                return 0
            }
        case (startTimePickerIndexPath.section, startTimePickerIndexPath.row):
            if startTimePickerShown {
                return 216.0
            } else {
                return 0
            }
        case (endTimePickerIndexPath.section, endTimePickerIndexPath.row):
            if endTimePickerShown {
                return 216.0
            } else {
                return 0
            }
            
        default:
            return 44.0
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch(indexPath.section, indexPath.row) {
            
            
        case (datePickerIndexPath.section, datePickerIndexPath.row - 1):
            if datePickerShown {
                datePickerShown = false
            }
            else if startTimePickerShown {
                startTimePickerShown = false
                datePickerShown = true
            }
            else if endTimePickerShown {
                endTimePickerShown = false
                datePickerShown = true
            }
                
            else {
                datePickerShown = true
            }
            
            
        case (startTimePickerIndexPath.section, startTimePickerIndexPath.row - 1):
            if startTimePickerShown {
                startTimePickerShown = false
            }
            else if datePickerShown {
                datePickerShown = false
                startTimePickerShown = true
            }
            else if endTimePickerShown {
                endTimePickerShown = false
                startTimePickerShown = true
            }
                
            else {
                startTimePickerShown = true
            }
            
            
            
        case (endTimePickerIndexPath.section, endTimePickerIndexPath.row - 1):
            if endTimePickerShown {
                endTimePickerShown = false
            }
            else if startTimePickerShown {
                startTimePickerShown = false
                endTimePickerShown = true
            }
            else if datePickerShown {
                datePickerShown = false
                endTimePickerShown = true
            }
                
            else {
                endTimePickerShown = true
            }
            
            
            
            
            
            
        default:
            break
        }
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    
    
    
    @IBAction func bookingButton(_ sender: Any) {
        
        performSegue(withIdentifier: "chooseRoomSegue", sender: nil)
        
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "chooseRoomSegue" {
            if let destination = segue.destination as? ChooseRoomViewController {
                
               
                destination.date = lblDate.text
                destination.endTime = lblStartTime.text
                destination.startTime = lblEndTime.text
                
                
                //destination.delegate = self
                //destination.roomType = roomType
                
                
            }
        }
    }
    
    
    
    
    
    
    
    
    
    // MARK: - Table view data source
    
    //    override func numberOfSections(in tableView: UITableView) -> Int {
    //        // #warning Incomplete implementation, return the number of sections
    //        return 2
    //    }
    //
    //    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //        // #warning Incomplete implementation, return the number of rows
    //        return 0
    //    }
    
    /*
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
     
     // Configure the cell...
     
     return cell
     }
     */
    
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
