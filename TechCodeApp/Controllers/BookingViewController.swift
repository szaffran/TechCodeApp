//
//  ViewController.swift
//  TechCodeBookingRooms
//
//  Created by Adrien Meyer on 24/12/2017.
//  Copyright © 2017 Developer.Institute. All rights reserved.
//

import UIKit

protocol protDelegate : NSObjectProtocol {
    func funDelegate(text : String)
}

class BookingViewController: BaseViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    weak var myDelegate : protDelegate?
    
    
    var myText = ""
    
    

    @IBOutlet weak var companyDropDownHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet var containerView: UIView!
    @IBOutlet weak var companiesBox: UITextField!
    @IBOutlet weak var CompaniesDropDown: UIPickerView!
    
    let users : [User] = [User]()
    
    var pickerHeigt = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        myDelegate!.funDelegate(text: "delegate working")
        
        companiesBox.text = myText
        
        self.containerView.autoresizingMask = UIViewAutoresizing(rawValue: UIViewAutoresizing.RawValue(UInt8(UIViewAutoresizing.flexibleWidth.rawValue) | UInt8(UIViewAutoresizing.flexibleHeight.rawValue)))
        
        self.containerView.frame = CGRect(x: 0, y: 0, width: self.scrollView.frame.size.width, height: self.containerView.frame.size.height) // only to scroll up and down
        
        self.scrollView.contentSize = self.containerView.frame.size // allows the scrollview to actually scroll
        
        self.scrollView.addSubview(self.containerView)
        // Do any additional setup after loading the view, typically from a nib.
    }
   
    
  
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10 //companies.count
    }
    

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {

//        self.view.endEditing(true)

        return "hello"

    }
//
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//
//        self.companiesBox.text = self.companies[row]
//        self.CompaniesDropDown.isHidden = true
//
//    }
    
    @IBAction func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if textField == self.companiesBox {
            self.CompaniesDropDown.isHidden = false
            //if you dont want the users to se the keyboard type:
            
            textField.endEditing(true)
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func companiesBoxBegin(_ sender: Any)
    {
        if( self.companyDropDownHeightConstraint.constant == 0)
        {
             self.companyDropDownHeightConstraint.constant = 216.0
        }
        else
        {
             self.companyDropDownHeightConstraint.constant = 0
        }
        
        UIView.animate(withDuration: 0.5, animations: {
            UIView.animate(withDuration: 0.5) {
                self.view.layoutIfNeeded()
            }
        }) { (completed) in
            self.companiesBox.resignFirstResponder()
        }
        
        
    }
    
}

