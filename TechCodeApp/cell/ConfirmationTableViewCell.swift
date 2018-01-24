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
    //var delegate: TableViewCellDelegate? 
    
    func fillValue(value : String ){
        self.value.text = value
    }
    //    func tapAction() {
    //
    //        let tap = UITapGestureRecognizer(target: self, action: #selector(doubleTapAction))
    //        tap.numberOfTapsRequired = 2
    //        self.addGestureRecognizer(tap)
    //        //view.addGestureRecognizer(tap)
    //    }
    //
    //    @objc func doubleTapAction() {
    //        delegate?.tableViewCell(doubleTapActionDelegatedFrom: self)
    //    }
}

