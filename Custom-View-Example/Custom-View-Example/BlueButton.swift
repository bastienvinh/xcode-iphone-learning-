//
//  BlueButton.swift
//  Custom-View-Example
//
//  Created by Cloud Strife on 10/03/16.
//  Copyright © 2016 Bastien VINH. All rights reserved.
//

import UIKit

class BlueButton: UIButton {

    override func awakeFromNib() {
//        super.awakeFromNib()
//        
        layer.cornerRadius = 5.0
        backgroundColor = UIColor(red: 46.0/255.0, green: 135.0/255.0, blue: 195.0/255.0, alpha: 1.0)
        setTitleColor(UIColor.whiteColor(), forState: .Normal)
    }

}
