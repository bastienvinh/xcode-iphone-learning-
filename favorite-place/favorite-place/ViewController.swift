//
//  ViewController.swift
//  favorite-place
//
//  Created by Cloud Strife on 10/03/16.
//  Copyright © 2016 Cloud Strife. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var findOutMoreButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        findOutMoreButton.layer.cornerRadius = 2.0
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

