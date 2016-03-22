//
//  ViewController.swift
//  UIScrollTest-Example
//
//  Created by Cloud Strife on 21/03/16.
//  Copyright © 2016 Bastien VINH. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var ourScrollView: UIScrollView!
    
    let WITDH: CGFloat = 225.0
    let HEIGHT: CGFloat = 438.0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 1...5 {
            let image = UIImage(named: "\(i)")
            let imageview = UIImageView(image: image)
            
            ourScrollView.addSubview(imageview)
            
            imageview.frame = CGRectMake(-WITDH + (WITDH * CGFloat(i)), 300, WITDH, HEIGHT)
        }
        
        ourScrollView.contentSize = CGSizeMake(WITDH * 5, ourScrollView.frame.size.height)
        
    }

}

 