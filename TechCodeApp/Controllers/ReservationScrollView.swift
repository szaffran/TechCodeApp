//
//  ReservationScrollView.swift
//  TechCodeApp
//
//  Created by Mac on 07/01/2018.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit

class ReservationScrollView: UIScrollView {
    
    
     @IBOutlet weak var  contentView :UIView!
    
    
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        
//        self.contentView.autoresizingMask = UIViewAutoresizing(rawValue: UIViewAutoresizing.RawValue(UInt8(UIViewAutoresizing.flexibleWidth.rawValue) | UInt8(UIViewAutoresizing.flexibleHeight.rawValue)))
//        
//        
//        // define the position of the contentContainer begining at 0,0 and  x=height, y=width
//        self.contentView.frame = CGRect(x: 0, y: 0, width: self.contentView.frame.size.width, height: self.contentView.frame.size.height)
//        
//        //define size of scrollView = size of the contentContainer
//        self.contentSize = self.contentView.frame.size
//        
//        
//        
//        //map the contentContenair inside the scrollView
//        self.addSubview(self.contentView)
    }
    
    
    
    
}
