//
//  BlueVC.swift
//  navigation-controller-example
//
//  Created by Cloud Strife on 21/03/16.
//  Copyright © 2016 Bastien VINH. All rights reserved.
//

import UIKit

class BlueVC: UIViewController {

    
    @IBAction func pressButton(sender: UIButton!) {
        
        
        navigationController?.popToRootViewControllerAnimated(true)
        
    }
    
}
