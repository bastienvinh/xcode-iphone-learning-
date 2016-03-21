//
//  OrangeVC.swift
//  navigation-controller-example
//
//  Created by Cloud Strife on 21/03/16.
//  Copyright © 2016 Bastien VINH. All rights reserved.
//

import UIKit

class OrangeVC: UIViewController {

    
    
    @IBAction func pressPOPButton(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
}
