//
//  BlueVC.swift
//  NoStoryBoardApplication
//
//  Created by Cloud Strife on 08/03/16.
//  Copyright © 2016 Bastien VINH. All rights reserved.
//

import UIKit

class BlueVC: UIViewController {
    
    @IBOutlet weak var testLabel: UILabel!
    
    var printText = ""
    
    convenience init(printMe: String ) {
        self.init(nibName: "BlueVC", bundle: nil)
        
        printText = printMe
    }
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        testLabel.text = printText
    }

}
