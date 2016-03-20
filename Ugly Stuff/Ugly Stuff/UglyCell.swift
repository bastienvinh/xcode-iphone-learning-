//
//  UglyCell.swift
//  Ugly Stuff
//
//  Created by Cloud Strife on 19/03/16.
//  Copyright © 2016 Bastien VINH. All rights reserved.
//

import UIKit

class UglyCell: UITableViewCell {
    
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var mainLib: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        mainImage.layer.cornerRadius = 5.0
        mainImage.clipsToBounds = true
    }
    
    func configureCell(image: UIImage, text: String) {
        mainImage.image = image
        mainImage.contentMode = UIViewContentMode.Redraw
        mainLib.text = text
    }

}
