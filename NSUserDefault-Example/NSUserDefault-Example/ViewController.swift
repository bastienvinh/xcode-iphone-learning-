//
//  ViewController.swift
//  NSUserDefault-Example
//
//  Created by Cloud Strife on 20/03/16.
//  Copyright © 2016 Bastien VINH. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelFavouriteColor: UILabel!
    
    var persons = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let color = NSUserDefaults.standardUserDefaults().valueForKey("color") {
            labelFavouriteColor.text = "Favourite Color : \(color)"
        }
        else {
            labelFavouriteColor.text = "Pick a color !"
        }
        
        persons.append(Person(first: "Jerome", last: "Ndaw"))
        persons.append(Person(first: "Mickael", last: "Molli"))
        persons.append(Person(first: "Mareille", last: "Movien"))
        
        
        let dataEncodedRoot = NSKeyedArchiver.archivedDataWithRootObject(persons)
        
        NSUserDefaults.standardUserDefaults().setObject(dataEncodedRoot, forKey: "people")
         NSUserDefaults.standardUserDefaults().synchronize()
    }

    @IBAction func pressGreyButton(sender: AnyObject) {
        labelFavouriteColor.text = "Favourite Color : Grey"
        keepColor("Grey")
    }
    
    
    @IBAction func pressRedButton(sender: AnyObject) {
        labelFavouriteColor.text = "Favourite Color : Red"
        keepColor("Red")
    }
    
    @IBAction func pressOrangeButton(sender: AnyObject) {
        labelFavouriteColor.text = "Favourite Color : Orange"
        keepColor("Orange")
        
        
        if let loadPeople = NSUserDefaults.standardUserDefaults().objectForKey("people") as? NSData {
            
            if let peopleArray  = NSKeyedUnarchiver.unarchiveObjectWithData(loadPeople) as? [Person] {
                
                for person in peopleArray {
                    print(person.firstName)
                }
                
            }
            
            
        }
        
    }
    
    
    func keepColor(color: String) {
        NSUserDefaults.standardUserDefaults().setValue(color, forKey: "color")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
}

