//
//  ViewController.swift
//  monster-pet
//
//  Created by Cloud Strife on 03/03/16.
//  Copyright © 2016 Bastien VINH. All rights reserved.
//

import UIKit
import AVFoundation

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
    var monsterHappy = false
    var currentItem: UInt32 = 0
    
    var musicPlayer: AVAudioPlayer!
    var sfxBite: AVAudioPlayer!
    var sfxHeart: AVAudioPlayer!
    var sfxDeath: AVAudioPlayer!
    var sfxSkull: AVAudioPlayer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        monsterImgView.playIdleAnimation()
        
        heartImgView.dropTarget = monsterImgView
        foodImgView.dropTarget = monsterImgView
        
        
        skull1ImgView?.alpha = DIM_ALPHA
        skull2ImgView?.alpha = DIM_ALPHA
        skull3ImgView?.alpha = DIM_ALPHA
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.itemDroppedOnCharacter(_:)), name: "onTargetDropped", object: nil)
        
        
        // TODO : Improve that, it is not super
        do {
            let path = NSBundle.mainBundle().pathForResource("cave-music", ofType: "mp3")
            let url = NSURL(fileURLWithPath: path!)
            
            try musicPlayer = AVAudioPlayer(contentsOfURL: url)
            
            try sfxBite = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("bite", ofType: "wav")!))
            
            try sfxHeart = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("heart", ofType: "wav")!))
            
            try sfxDeath = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("death", ofType: "wav")!))
            
            
            try sfxSkull = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("skull", ofType: "wav")!))
            
            musicPlayer.prepareToPlay()
            musicPlayer.play()
            
            sfxSkull.prepareToPlay()
            sfxHeart.prepareToPlay()
            sfxDeath.prepareToPlay()
            sfxBite.prepareToPlay()
            
        } catch let err as NSError  {
            print(err.debugDescription)
        }
        
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
        
        if !monsterHappy {
            
            sfxSkull.play()
            
            if _penalties == 1 {
                skull1ImgView.alpha = OPAQUE
                skull2ImgView.alpha = DIM_ALPHA
            } else if _penalties == 2 {
                skull2ImgView?.alpha = OPAQUE
                skull3ImgView?.alpha = DIM_ALPHA
            } else if _penalties == 3 {
                skull3ImgView?.alpha = OPAQUE
            }
            else {
                skull1ImgView.alpha = DIM_ALPHA
                skull2ImgView.alpha = DIM_ALPHA
                skull3ImgView?.alpha = DIM_ALPHA
            }
            
            if _penalties >= MAX_PENALTIES {
                gameOver()
            }
        }
        
        
        // what food is Okay and must choose to feed him
        let rand = arc4random_uniform(2) // 0 or 1
        
        if rand == 0 {
            foodImgView.alpha  = DIM_ALPHA
            foodImgView.userInteractionEnabled = false
            
            heartImgView.alpha  = OPAQUE
            heartImgView.userInteractionEnabled = true
            
        }
        else if (rand == 1) {
            
            foodImgView.alpha  = OPAQUE
            foodImgView.userInteractionEnabled = true
            
            heartImgView.alpha  = DIM_ALPHA
            heartImgView.userInteractionEnabled = false
            
        }
        
        currentItem = rand
        monsterHappy = false
    }
    
    
    func gameOver() {
        _timer.invalidate()
        
        monsterImgView.playDeathAnimation()
        sfxDeath.play()
    }
    
    func itemDroppedOnCharacter(notif: AnyObject) {
        monsterHappy = true
        startTimer()
        
        foodImgView.alpha = DIM_ALPHA
        foodImgView.userInteractionEnabled = false
        
        heartImgView.alpha = DIM_ALPHA
        heartImgView.userInteractionEnabled = false
        
        if currentItem == 0 {
            sfxHeart.play()
        } else if currentItem == 1 {
            sfxBite.play()
        }
    }
 
}

