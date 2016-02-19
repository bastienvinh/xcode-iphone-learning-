//
//  ViewController.swift
//  exercice-hide-elements
//
//  Created by Cloud Strife on 12/02/16.
//  Copyright © 2016 Bastien VINH. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Region component
    
    @IBOutlet weak var IMGBlueBomb: UIImageView!
    @IBOutlet weak var IMGRedBomb: UIImageView!
    
    
    
    // End region
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func TipRedButton(sender: AnyObject) {
        IMGRedBomb.hidden = true
        IMGBlueBomb.hidden = false
    }
    
    @IBAction func TipBlueButton(sender: AnyObject) {
        IMGRedBomb.hidden = false
        IMGBlueBomb.hidden = true
    }

}

