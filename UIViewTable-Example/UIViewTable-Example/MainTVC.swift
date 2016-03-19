//
//  MainTVC.swift
//  UIViewTable-Example
//
//  Created by Cloud Strife on 16/03/16.
//  Copyright © 2016 Bastien VINH. All rights reserved.
//

import UIKit

class MainTVC: UITableViewController {
    
    var cars = ["Ford", "Volvo", "Toyota", "Subaru", "BWVW"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return cars.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("carCelllID", forIndexPath: indexPath)

        // BV : IndexPath contains the current index and IndexPath.row contains the current line number in some
        
        cell.textLabel?.text = cars[indexPath.row]
        cell.detailTextLabel?.text = "I like new super \(cars[indexPath.row])"

        return cell
    }

}
