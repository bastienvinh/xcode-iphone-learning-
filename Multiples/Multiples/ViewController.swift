//
//  ViewController.swift
//  Multiples
//
//  Created by Cloud Strife on 20/02/16.
//  Copyright © 2016 Bastien VINH. All rights reserved.
//

import UIKit

class PartyInformation {
    
    var max : Int
    var numberToAdd : Int
    var cumul : Int
    
    init() {
        max = 5
        numberToAdd = 0
        cumul = 0
    }
}

class ViewController: UIViewController {

    
     // ***************** Outlets / Controls ******************************
 
    // First page outlet
    @IBOutlet weak var TitleMultipleLabel: UIImageView!
    @IBOutlet weak var NumberToAddtextBox: UITextField!
    @IBOutlet weak var PlayButton: UIButton!
    

    // Second page outlet
    @IBOutlet weak var Addbutton: UIButton!
    @IBOutlet weak var OperationsLabel: UILabel!
    
    
    // ***************** Informations ******************************
    private var currentPartyInformation : PartyInformation? = nil
    
    private let MAX_TO_PLAY : Int = 5
    private let MESSAGE_ORIGIN : String = "Press Add to add!"
    private let FORMAT_CALCUL : String = "%u + %u = %u" // Must have 3 value %u
    
    // ***************** Events ******************************
    override func viewDidLoad() {
        currentPartyInformation = PartyInformation()
        super.viewDidLoad()
    }
    
    // When the guys
    @IBAction func PlayButtonPressed(sender: UIButton) {
        
        if !IsANumberEntered() {
            // Show a Message
            // TODO : Create a label for error case
            return
        }
        
        // We continue the game
        // we need first to save vital information
        if ( currentPartyInformation != nil ) {
            currentPartyInformation?.numberToAdd = Int(NumberToAddtextBox.text!)!
            
            HideFirstPage()
            HideSeconPage(false)
        }
    }
    
    @IBAction func AddButtonPressed(sender: UIButton) {
        
        if (currentPartyInformation?.cumul == currentPartyInformation?.max) {
            ResetParty()
            HideSeconPage()
            HideFirstPage(false)
            return
        }
        
        let oldResult : Int? = (currentPartyInformation?.cumul)! * (currentPartyInformation?.numberToAdd)!
        
        // Add muliple time to textbox
        OperationsLabel.text = String(format: FORMAT_CALCUL, oldResult!, (currentPartyInformation?.numberToAdd)!, oldResult! + (currentPartyInformation?.numberToAdd)!)

        currentPartyInformation?.cumul += 1
    }
    
    // ***************** Utilities ******************************
    
    private func IsANumberEntered() -> Bool {
        
        // TODO : verify this can be convert into a number
        // TODO : verify a maximum to account UInt limit
        
        return (NumberToAddtextBox.text != nil
            && NumberToAddtextBox.text != "")
    }
    
    
    private func ResetParty() {
        currentPartyInformation?.max = MAX_TO_PLAY
        currentPartyInformation?.cumul = 0
        
        NumberToAddtextBox.text = ""
        OperationsLabel.text = MESSAGE_ORIGIN
    }
    
    
    // ***************** Function to UI Helper ******************************
    
    // Should hide the first page or not
    func HideFirstPage(isDisable: Bool = true) {
        
        TitleMultipleLabel.hidden = isDisable
        NumberToAddtextBox.hidden = isDisable
        PlayButton.hidden = isDisable
        
    }
    
    // Should hide the second page or not
    func HideSeconPage(isDisable: Bool = true) {
        Addbutton.hidden = isDisable
        OperationsLabel.hidden = isDisable
    }
    
}

