//
//  ViewController.swift
//  Webrequest-Example
//
//  Created by Cloud Strife on 19/03/16.
//  Copyright © 2016 Bastien VINH. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    @IBOutlet weak var container: UIView!
    
    var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add out subview
        webView = WKWebView()
        container.addSubview(webView)
    }
    
    override func viewDidAppear(animated: Bool) {
        
        // Create a frame for the view
        let frame = CGRectMake(0, 0, container.bounds.width, container.bounds.height)
        webView.frame = frame
        
        loadRequest("https://www.weheartswift.com/getting-started-with-ios-programming")
    }
    
     
    func loadRequest(url: String) {
        
        
        
        
        // Prepare HTML request
        let UrlStringSwift = url
        let nsUrl = NSURL(string: UrlStringSwift)
        let request = NSURLRequest(URL: nsUrl!)
        
        webView.loadRequest(request)
        
    }

    @IBAction func loadSiwft(sender: UIButton) {
        loadRequest("https://www.weheartswift.com/getting-started-with-ios-programming")
    }
    
    @IBAction func loadGrossip(sender: UIButton) {
        loadRequest("http://www.tmz.com/2016/03/18/rian-johnson-star-wars-director-sued-agent")
    }
    
    @IBAction func loadSteak(sender: UIButton) {
        loadRequest("http://www.steak-enthusiast.com/2016/03/easter-lamb-menu")
    }
}

