//
//  ConfirmationTableViewCell.swift
//  TechCodeApp
//
//  Created by Mac on 27/12/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

import UIKit

class ConfirmationTableViewCell: UITableViewCell {

   
    @IBOutlet private weak var value: UILabel!
    
    func fillValue(value : String ){
        self.value.text = value
    }
    
}
