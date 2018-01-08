//
//  ReservationBookingViewController.swift
//  TechCodeApp
//
//  Created by Mac on 07/01/2018.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit
import FSCalendar

class ReservationBookingViewController: BaseViewController, UIPickerViewDelegate, UIPickerViewDataSource, FSCalendarDelegate {
    
    var today : Date = Date()
    
    @IBOutlet weak var calendar: FSCalendar!
    
    @IBOutlet weak var labelStart: UILabel!
    
    @IBOutlet weak var labelEnd: UILabel!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var picker: UIPickerView!
    
    @IBOutlet weak var endPicker: UIPickerView!
    
    var hours: [String] = [String]()
    var minuts: [String] = [String]()
    
    
//    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
//        return ConfigurationParameters(startDate: startDate!, endDate: endDate!)
//    }
    

    func selectedCalendar(){
        
    }
    
    func forbiddenDate(){
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initHours ()

        self.picker.delegate = self
        self.picker.dataSource = self
        
        self.contentView.autoresizingMask = UIViewAutoresizing(rawValue: UIViewAutoresizing.RawValue(UInt8(UIViewAutoresizing.flexibleWidth.rawValue) | UInt8(UIViewAutoresizing.flexibleHeight.rawValue)))
        
        
        // define the position of the contentContainer begining at 0,0 and  x=height, y=width
        self.contentView.frame = CGRect(x: 0, y: 0, width: self.contentView.frame.size.width, height: self.contentView.frame.size.height)
        
        //define size of scrollView = size of the contentContainer
        self.scrollView.contentSize = self.contentView.frame.size
        
        
        
        //map the contentContenair inside the scrollView
        self.scrollView.addSubview(self.contentView)

    }
    
    func initHours ()
    {
        for index in 1...24 {
            self.hours.append(String(index))
           
        }
        for index in 1...60 {
            self.minuts.append(String(index))
        }
    }
    
    func getNextHalf()
    {
        
    }
    
    
    
   
    
    // The number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0
        {
            return 24
        }
        else {
            return 2
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
        }
        else if( pickerView == self.endPicker )
        {
            self.labelEnd.text = "\(hour) : \(minute)"
        }
        
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component
        {
        case 0:
            return "\(row)"
        case 1:
            if row == 0
            {
                return "00"
            }
            else if row == 1
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
        
        return ""
    }


    
    
}
