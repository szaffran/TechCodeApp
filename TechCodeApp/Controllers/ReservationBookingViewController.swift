//
//  ReservationBookingViewController.swift
//  TechCodeApp
//
//  Created by Mac on 07/01/2018.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit
import FSCalendar

class ReservationBookingViewController: BaseViewController, UIPickerViewDelegate, UIPickerViewDataSource, FSCalendarDelegate, FSCalendarDataSource {
    
    var reservation : Reservation = Reservation()
    weak var updateReservationDelegate : UpdateReservationProtocol?
    
    //if open for modify existing reservation, won't be nil
    var reservationToModify : Reservation? = nil
    
    var today : Date = Date()
    var selectedDate : Date =  Calendar.current.date(byAdding: .day, value: 1, to: Date())!
    
    // will be modified each time we change the startTime for define a minimum value to endTime
    var minEndPicker = 0
    
   
    
    @IBOutlet weak var calendar: FSCalendar!
    
    @IBOutlet weak var labelStart: UILabel!
    
    @IBOutlet weak var labelEnd: UILabel!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var picker: UIPickerView!
    
    @IBOutlet weak var endPicker: UIPickerView!
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var leftBarButton: UIBarButtonItem!
    
//    var hours: [String] = [String]()
//    var minuts: [String] = [String]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(reservationToModify == nil)
        {
            leftBarButton.title = "menu"
        }
        else{
            leftBarButton.title = "< Back"
            //editPickerInit()
        }
        
        //initHours ()
        
        self.picker.delegate = self
        self.picker.dataSource = self
        
        calendar.dataSource = self
        calendar.delegate = self
        self.contentView.autoresizingMask = UIViewAutoresizing(rawValue: UIViewAutoresizing.RawValue(UInt8(UIViewAutoresizing.flexibleWidth.rawValue) | UInt8(UIViewAutoresizing.flexibleHeight.rawValue)))
        
        // define the position of the contentContainer begining at 0,0 and  x=height, y=width
        self.contentView.frame = CGRect(x: 0, y: 0, width: self.contentView.frame.size.width, height: self.contentView.frame.size.height)
        
        //define size of scrollView = size of the contentContainer
        self.scrollView.contentSize = self.contentView.frame.size
        
        //map the contentContenair inside the scrollView
        self.scrollView.addSubview(self.contentView)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        initView()
        if(reservationToModify != nil)
        {
            self.reservation = reservationToModify!
            editPickerInit()
        }
        
        
    }
    
//    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
//        return ConfigurationParameters(startDate: startDate!, endDate: endDate!)
//    }
    func calendar(_ calendar: FSCalendar, didSelect cDate: Date, at monthPosition: FSCalendarMonthPosition) {
        
        //probleme date a verifier
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        let mydate = dateFormatter.calendar.date(byAdding: .day, value: 1, to: cDate)
        let strDate = dateFormatter.string(from: mydate!)
        let date: Date = dateFormatter.date(from: strDate)!
        self.reservation.date = date //Calendar.current.date(byAdding: .day, value: 1, to: date)!
    }
    
    func calendar(_ calendar: FSCalendar, shouldSelect date: Date, at monthPosition: FSCalendarMonthPosition) -> Bool {
        
        if (date <= today)
        {
            return false
        }
        else if(monthPosition == .current){
            return true
        }
        else {
            return false
        }
        
    }
    
    func calendar(_ calendar: FSCalendar, willDisplay cell: FSCalendarCell, for date: Date, at monthPosition: FSCalendarMonthPosition) {
       
        self.calendar.select(reservationToModify?.date)
    }
    
//    func initHours ()
//    {
//        for index in 1...24 {
//            self.hours.append(String(index))
//
//        }
//        for index in 1...60 {
//            self.minuts.append(String(index))
//        }
//    }
    
    func initView(){
        self.reservation = Reservation()
        self.labelStart.text = "00 : 00"
        self.labelEnd.text = "00 : 00"
    
    }
    
    //if edit mode, uodate the picker to reservation value
    func editPickerInit() {
        
        let dateChekIn =  self.reservationToModify!.checkIn
        let dateChekOut =  self.reservationToModify!.checkout
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "HH"
        let hourStart = dateFormatter.string(from: dateChekIn)
        let hourEnd = dateFormatter.string(from: dateChekOut)
        dateFormatter.dateFormat = "mm"
        let mnStart = dateFormatter.string(from: dateChekIn)
        let mnEnd = dateFormatter.string(from: dateChekOut)
        
        dateFormatter.dateFormat = "HH:mm"
        
        let intHourStart : Int = Int(hourStart)!
        let intHourEnd : Int = Int(hourEnd)!
        
      
         self.picker.selectRow(intHourStart, inComponent: 0, animated: true)
        self.picker.selectRow(1, inComponent: 1, animated: true)
        
        self.endPicker.selectRow(intHourEnd, inComponent: 0, animated: true)
        self.endPicker.selectRow(1, inComponent: 1, animated: true)
        
        print(self.picker.selectedRow(inComponent: 0))
        print(self.endPicker.selectedRow(inComponent: 0))
        
        self.labelStart.text = dateFormatter.string(from: dateChekIn)
        self.labelEnd.text = dateFormatter.string(from: dateChekOut)
    }
    
    
    // The number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0
        {
            return 100000
        }
        else {
            return 1000000
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        guard let hour : String = self.pickerView(pickerView, titleForRow: pickerView.selectedRow(inComponent: 0), forComponent: 0) else
        {
            return
        }
        
        guard let minute : String = self.pickerView(pickerView, titleForRow: pickerView.selectedRow(inComponent: 1), forComponent: 1) else
        {
            return
        }
        
        if( pickerView == self.picker )
        {
            self.labelStart.text = "\(hour) : \(minute)"
            
            let temp =  self.reservation.date
            
            let dateFormatter = DateFormatter()
            dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
            
            dateFormatter.dateFormat = "dd-MM-yyyy"
            let strDate = dateFormatter.string(from: temp)
            let dateString = "\(strDate) \(hour):\(minute)"
            
            dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
            let date: Date = dateFormatter.date(from: dateString)!
            
           // self.reservation.date = date
            self.reservation.checkIn = date
            
            self.endPicker.selectRow(row, inComponent: component, animated: true)
            self.reservation.checkout = date
            self.labelEnd.text = "\(hour) : \(minute)"
            self.minEndPicker = Int(hour+minute)!
            
            print(date)
            
        }
            
            
        else if( pickerView == self.endPicker )
        {
            
//            let validTime = Int(hour+minute)! > self.minEndPicker
//
            //            if(validTime ){
            self.labelEnd.text = "\(hour) : \(minute)"
            
            let temp =  self.reservation.date
            
            let dateFormatter = DateFormatter()
            dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
            
            dateFormatter.dateFormat = "dd-MM-yyyy"
            let strDate = dateFormatter.string(from: temp)
            let dateString = "\(strDate) \(hour):\(minute)"
            
            dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
            let date: Date = dateFormatter.date(from: dateString)!
            
            self.reservation.checkout = date
            print(date)
            //            }
            //            else{
            //
            //                guard let hour : String = self.pickerView(self.picker, titleForRow: self.picker.selectedRow(inComponent: 0), forComponent: 0) else
            //                {
//                    return
//                }
//
//                guard let minute : String = self.pickerView(self.picker, titleForRow: self.picker.selectedRow(inComponent: 1), forComponent: 1) else
//                {
//                    return
//                }
//                 self.endPicker.selectRow(self.picker.selectedRow(inComponent: 0), inComponent: 0, animated: true)
//                self.endPicker.selectRow(self.picker.selectedRow(inComponent: 1), inComponent: 1, animated: true)
//                 self.labelEnd.text = "\(hour) : \(minute)"
//            }
            

        }
        
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component
        {
        case 0:
            
            return "\(row % 24)"
        case 1:
            if row % 2 == 0
            {
                return "00"
            }
            else if row % 2 == 1
            {
                return "30"
            }
            else
            {
                return ""
            }
        default:
            return ""
        }
    }

    
    @IBAction override func menu(_ sender: Any)
    {
        if reservationToModify != nil{
            self.navigationController?.popToRootViewController(animated: true)
        }
        else{
            self.viewDeckController?.open(.left, animated: true)
        }
    }
    
    
    @IBAction func next(_ sender: Any)
    {
        performSegue(withIdentifier: "chooseRoomSegue", sender: nil)
        
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "chooseRoomSegue" {
            if let destination = segue.destination as? ChooseRoomViewController {
                
                destination.reservation = self.reservation
                 destination.updateReservationDelegate = self.updateReservationDelegate
                
            }
        }
    }
    
    
    
    
}
