//
//  SettingsViewController.swift
//  ClockySum
//
//  Created by Carson Carbery on 10/31/16.
//  Copyright © 2016 Carson Carbery. All rights reserved.
//

import UIKit
import SwiftRangeSlider
import DeviceKit

class SettingsViewController: UIViewController {
    
    //MARK: - IBOutlets
    
    //@IBOutlet weak var randomMultSwitch: UISwitch!
    
    @IBOutlet weak var fixedMultiplier: UILabel!
    @IBOutlet weak var fixedMultiplierStepper: UIStepper!
    @IBOutlet weak var rangeSlider: RangeSlider!
    @IBOutlet weak var lowerRangeLabel: UILabel!
    @IBOutlet weak var upperRangeLabel: UILabel!
    @IBOutlet weak var rangeSliderOutlet: RangeSlider!
    
    
    @IBOutlet weak var playFixedTitle: UILabel!
    @IBOutlet weak var playFixedText: UILabel!
    @IBOutlet weak var setFixedText: UILabel!
    @IBOutlet weak var playFixedSave: UIButton!
    @IBOutlet weak var playFixedCancel: UIButton!
    
    @IBOutlet weak var playRandomTitle: UILabel!
    @IBOutlet weak var playRandomText: UILabel!
    @IBOutlet weak var playRandomSave: UIButton!
    @IBOutlet weak var playRandomCancel: UIButton!
    
    
    
    //MARK: - Properties
    
    var userMultiplier: Int = 0
    var userRandomSet: Bool = false
    let device = Device()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Get user default settings & display
        let defaultSettings = UserDefaults.standard
        let userMultiplier = defaultSettings.integer(forKey: "userMultiplier")
        if userMultiplier > 0 {
            fixedMultiplier.text = String(userMultiplier)
            fixedMultiplierStepper.value = Double(userMultiplier)
            print(fixedMultiplierStepper.value)
        }

        let userRandomUpper = defaultSettings.integer(forKey: "userRandomUpper")
        if userRandomUpper > 0 {
            rangeSliderOutlet.upperValue = Double(userRandomUpper)
            upperRangeLabel.text = "\(userRandomUpper)"
        }
        let userRandomLower = defaultSettings.integer(forKey: "userRandomLower")
        if userRandomLower > 0 {
            rangeSliderOutlet.lowerValue = Double(userRandomLower)
            lowerRangeLabel.text = "\(userRandomLower)"

        }
            
    }
    
    override func viewWillLayoutSubviews() {
        
        if device.isPad {
            
            // Set text size for Ipad layout
            
            print(device.description)
        
            playFixedTitle.font = UIFont(name: (playFixedTitle.font.fontName), size: 52)
            playFixedText.font = UIFont(name: (playFixedText.font.fontName), size: 36)
            setFixedText.font = UIFont(name: (setFixedText.font.fontName), size: 40)
            fixedMultiplier.font = UIFont(name: (fixedMultiplier.font.fontName), size: 46)
            
            playRandomTitle.font = UIFont(name: (playRandomTitle.font.fontName), size: 52)
            playRandomText.font = UIFont(name: (playRandomText.font.fontName), size: 36)
            
            playFixedSave.titleLabel?.font =  UIFont(name:(playFixedSave.titleLabel?.font.fontName)!, size: 40)
            playFixedCancel.titleLabel?.font = UIFont(name:
                (playFixedCancel.titleLabel?.font.fontName)!, size: 40)
            
            playRandomSave.titleLabel?.font =  UIFont(name:(playRandomSave.titleLabel?.font.fontName)!, size: 40)
            playRandomCancel.titleLabel?.font = UIFont(name:
                (playRandomCancel.titleLabel?.font.fontName)!, size: 40)

        }
        
    }
    
    override func viewDidLayoutSubviews() {
        rangeSlider.updateLayerFrames()
    }

    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        
        multiplier = Int(sender.value)
        fixedMultiplier.text = Int(sender.value).description
        
    }
    
    @IBAction func rangeSliderValueChanged(_ sender: Any) {
        
        randomUpper = Int(rangeSlider.upperValue)
        randomLower = Int(rangeSlider.lowerValue)
        
        upperRangeLabel.text = "\(randomUpper)"
        lowerRangeLabel.text = "\(randomLower)"
    }
    
    @IBAction func saveFixed(_ sender: UIButton) {
        
        randomSwitch = false
        saveUserDefaults()
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveRandom(_ sender: UIButton) {
        
        randomSwitch = true
        saveUserDefaults()
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func cancelSettings(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)

    }
    
    func saveUserDefaults() {
        // Save settings
        let defaultSettings = UserDefaults.standard

        defaultSettings.set(multiplier, forKey: "userMultiplier")
        defaultSettings.set(randomSwitch, forKey: "userRandomSwitch")
        defaultSettings.set(randomUpper, forKey: "userRandomUpper")
        defaultSettings.set(randomLower, forKey: "userRandomLower")
        
    }
    
    
    

}
