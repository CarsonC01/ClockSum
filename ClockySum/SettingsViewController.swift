//
//  SettingsViewController.swift
//  ClockySum
//
//  Created by Carson Carbery on 10/31/16.
//  Copyright © 2016 Carson Carbery. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var randomMultSwitch: UISwitch!
    
    @IBOutlet weak var fixedMultiplier: UILabel!
    
    @IBOutlet weak var fixedMultiplierStepper: UIStepper!
    
    //MARK: - Properties
    
    var userMultiplier: Int = 0
    var userRandomSwitch: Bool = false
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Get user default settings
        let defaultSettings = UserDefaults.standard
        let userMultiplier = defaultSettings.integer(forKey: "userMultiplier")
        if userMultiplier > 0 {
            fixedMultiplier.text = String(userMultiplier)
            fixedMultiplierStepper.value = Double(userMultiplier)
            print(fixedMultiplierStepper.value)
        }
        randomSwitch = defaultSettings.bool(forKey: "userRandomSwitch")
        if randomSwitch {
            randomMultSwitch.setOn(true, animated: true)
        } else {
            randomMultSwitch.setOn(false, animated: true)
        }


    }

    
    @IBAction func switchValueChanged(_ sender: UISwitch) {
        
        if sender.isOn {
            print("UISwitch is ON")
            randomSwitch = true
        } else {
            print("UISwitch is OFF")
            randomSwitch = false
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        
        multiplier = Int(sender.value)
        
        print(multiplier)
        
        fixedMultiplier.text = Int(sender.value).description
        
    }
    
    
    @IBAction func saveSettingsAction(_ sender: AnyObject) {
        
        // Save settings
        let defaultSettings = UserDefaults.standard
        defaultSettings.set(multiplier, forKey: "userMultiplier")
        defaultSettings.set(randomSwitch, forKey: "userRandomSwitch")
        
        self.dismiss(animated: true, completion: nil)
        
    }
    

}
