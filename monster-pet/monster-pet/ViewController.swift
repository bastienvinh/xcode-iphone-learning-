//
//  ViewController.swift
//  monster-pet
//
//  Created by Cloud Strife on 03/03/16.
//  Copyright © 2016 Bastien VINH. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var monsterImgView: MonsterImg!
    @IBOutlet weak var heartImgView: DragImg!
    @IBOutlet weak var foodImgView: DragImg!
    
    @IBOutlet weak var skull1ImgView: UIImageView!
    @IBOutlet weak var skull2ImgView: UIImageView!
    @IBOutlet weak var skull3ImgView: UIImageView!
    
    
    let DIM_ALPHA: CGFloat = 0.2 // Float of Cocoa, be careful
    let OPAQUE: CGFloat = 1.0
    let MAX_PENALTIES = 3
    
    var _penalties = 0
    var _timer : NSTimer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        monsterImgView.playIdleAnimation()
        
        heartImgView.dropTarget = monsterImgView
        foodImgView.dropTarget = monsterImgView
        
        skull1ImgView.alpha = DIM_ALPHA
        skull2ImgView.alpha = DIM_ALPHA
        skull3ImgView.alpha = DIM_ALPHA
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.itemDroppedOnCharacter(_:)), name: "onTargetDropped", object: nil)
        
        startTimer()
    }
    
    func startTimer() {
        
        if _timer != nil  {
            _timer.invalidate()
        }
        
        _timer = NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: #selector(ViewController.changeGameStates), userInfo: nil, repeats: true)
    }
    
    func changeGameStates() {
        _penalties += 1
        
        if _penalties == 1 {
            skull1ImgView.alpha = OPAQUE
            skull2ImgView.alpha = DIM_ALPHA
        } else if _penalties == 2 {
            skull2ImgView.alpha = OPAQUE
            skull3ImgView.alpha = DIM_ALPHA
        } else if _penalties == 3 {
            skull3ImgView.alpha = OPAQUE
        }
        else {
            skull1ImgView.alpha = DIM_ALPHA
            skull2ImgView.alpha = DIM_ALPHA
            skull3ImgView.alpha = DIM_ALPHA
        }
        
        if _penalties >= MAX_PENALTIES {
            gameOver()
        }
    }
    
    
    func gameOver() {
        _timer.invalidate()
        
        monsterImgView.playDeathAnimation()
    }
    
    
    func onTargetDropped(notif: AnyObject) {
        
        print("I DROPPED SOMETHING")
    }
    
    func itemDroppedOnCharacter(notif: AnyObject) {
        print("I DROPPED SOMETHING OOOKKKKKKK")
    }
 
}

