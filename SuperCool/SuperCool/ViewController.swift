//
//  ViewController.swift
//  SuperCool
//
//  Created by Cloud Strife on 12/02/16.
//  Copyright © 2016 Bastien VINH. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Region Elements
    @IBOutlet weak var BOOMLogo: UIImageView!
    @IBOutlet weak var BGImageView: UIImageView!
    @IBOutlet weak var MakeCoolButton: UIButton!
    // Endregion
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        BOOMLogo.hidden = true
        BGImageView.hidden = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // When we tip make super cool button
    @IBAction func TipSuperCool(sender: AnyObject) {
        BOOMLogo.hidden = false
        BGImageView.hidden = false
        MakeCoolButton.hidden = true
    }

}

