//
//  ViewController.swift
//  Ugly Stuff
//
//  Created by Cloud Strife on 19/03/16.
//  Copyright © 2016 Bastien VINH. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableViewBanner: UITableView!
    
    var posterImages = ["http://static1.comicvine.com/uploads/scale_super/11116/111165556/4275825-b1cd2c5ae2907aa9063c1f9ed615b823.jpeg"]
    
    var posterTitles = ["Monkey D. Luffy"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewBanner.delegate  = self
        tableViewBanner.dataSource = self
        
    }
    
    
    /// These three fucntions are madatories to continue
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier("uglyCell") as?  UglyCell {
            
            let url = NSURL(string: posterImages[indexPath.row])!

            if let data = NSData(contentsOfURL: url) {
                let image = UIImage(data: data)
                cell.configureCell(image!, text: posterTitles[indexPath.row])
            }
             
            return cell
        }
        
        
        return UglyCell()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func  tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posterImages.count
    }

}

