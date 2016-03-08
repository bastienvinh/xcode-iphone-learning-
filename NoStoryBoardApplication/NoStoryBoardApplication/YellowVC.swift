//
//  YellowVC.swift
//  NoStoryBoardApplication
//
//  Created by Cloud Strife on 08/03/16.
//  Copyright © 2016 Bastien VINH. All rights reserved.
//

import UIKit

class YellowVC: UIViewController {
    
    var blueVC: BlueVC!
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loadBlueView(sender: AnyObject) {
        blueVC = BlueVC(printMe: "Hello World !!! Blue Power")
        self.presentViewController(blueVC, animated: true, completion: nil)
    }
 
}
