//
//  ViewController.swift
//  old-school-mac
//
//  Created by Cloud Strife on 21/02/16.
//  Copyright © 2016 Bastien VINH. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var TerminalLabel: UILabel!
    
    var phrases = ["Booting from floopy disk ...\n", "Reading from disk...\n", "Updating Registy...\n", ".......\n", "...........\n", "...................\n", "Welcome, Cloud Strife. \nIt is good to see you again"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        for i in 0 ..< phrases.count {
            var text = TerminalLabel.text!
            text += phrases[i]
            TerminalLabel.text = text
        }
    }

//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }


}

