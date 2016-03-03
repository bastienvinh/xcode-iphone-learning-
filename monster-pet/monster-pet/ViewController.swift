//
//  ViewController.swift
//  monster-pet
//
//  Created by Cloud Strife on 03/03/16.
//  Copyright © 2016 Bastien VINH. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var monsterImgView: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        var images = [UIImage]()
        
        for i in 1...4 {
            let img = UIImage(named: "idle\(i).png")
            images.append(img!)
        }
        
        
        monsterImgView.animationImages = images
        monsterImgView.animationDuration = 0.8
        monsterImgView.animationRepeatCount = 0 // 0 means do it infinitely
        monsterImgView.startAnimating()
    }

}

