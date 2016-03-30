//
//  AddPostVC.swift
//  myHood
//
//  Created by Cloud Strife on 24/03/16.
//  Copyright © 2016 Bastien VINH. All rights reserved.
//

import UIKit

class AddPostVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var loadedImagesView: UIImageView!
    @IBOutlet weak var titleTxt: UITextField!
    @IBOutlet weak var descriptionTxt: UITextField!
    
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Print("FRAME SIZE IS : \(loadedImagesView.frame.size.width)")
        
        // This to make our image view a circle one
        loadedImagesView.layer.cornerRadius = loadedImagesView.frame.size.width / 2
        loadedImagesView.clipsToBounds = true
        
        // Initialize components
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
    
        // This called when we pick our image
        
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        loadedImagesView.image =  image
    
    }
    
    
    @IBAction func cancelButtonPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func addPhoto(sender: UIButton) {
        // TODO Add photo
        sender.setTitle("", forState: .Normal)
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func makePostPressed(sender: UIButton) {
        
        if let desc = descriptionTxt.text, let title = titleTxt.text, let img = loadedImagesView.image {
            
            // TODO : Verify that title is not empty
            
            // We must save our image
            let imgPath = DataService.saveImageAndCreatePath(img)
            
            // We create a new post
            let post = Post(imagePath: imgPath, title: title, description: desc)
            DataService.addPost(post)
        }
        
    }
    
    
    
}
