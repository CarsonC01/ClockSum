//
//  ClockSumFaceViewController.swift
//  ClockySum
//
//  Created by Carson Carbery on 9/12/16.
//  Copyright © 2016 Carson Carbery. All rights reserved.
//

import UIKit

class ClockSumFaceViewController: UIViewController {
    
    
    //@IBOutlet weak var centerLabel: UILabel!
    @IBOutlet weak var centerView: UIView!
    
    @IBOutlet weak var innerView: UIView!
    @IBOutlet weak var outerView: UIView!
    
    @IBOutlet weak var oneOclockLabel: UILabel!
    @IBOutlet weak var twoOclockLabel: UILabel!
    @IBOutlet weak var threeOclockLabel: UILabel!
    
    
    @IBOutlet weak var sixOclockLabel: UILabel!
    
    
    @IBOutlet weak var nineOclockLabel: UILabel!
    
    
    @IBOutlet weak var twelveOclockLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configClockFace()
        
        
     }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func configClockFace() {
        
        // Make views round, like a clock face
        outerView.layer.borderWidth = 0.2
        outerView.layer.masksToBounds = false
        outerView.layer.borderColor = UIColor.blackColor().CGColor
        outerView.layer.cornerRadius = outerView.frame.size.width/2
        outerView.clipsToBounds = true
        
        innerView.layer.borderWidth = 0.2
        innerView.layer.masksToBounds = false
        innerView.layer.borderColor = UIColor.blackColor().CGColor
        innerView.layer.cornerRadius = innerView.frame.size.width/2
        innerView.clipsToBounds = true
        
        centerView.layer.borderWidth = 0.2
        centerView.layer.masksToBounds = false
        centerView.layer.borderColor = UIColor.blackColor().CGColor
        centerView.layer.cornerRadius = centerView.frame.size.width/2
        centerView.clipsToBounds = true
        
        // Make outer rim clock time Labels round
        oneOclockLabel.layer.borderWidth = 0.2
        oneOclockLabel.layer.masksToBounds = false
        oneOclockLabel.layer.borderColor = UIColor.blackColor().CGColor
        oneOclockLabel.layer.cornerRadius = oneOclockLabel.frame.size.width/2
        oneOclockLabel.clipsToBounds = true
        
        twoOclockLabel.layer.borderWidth = 0.2
        twoOclockLabel.layer.masksToBounds = false
        twoOclockLabel.layer.borderColor = UIColor.blackColor().CGColor
        twoOclockLabel.layer.cornerRadius = twoOclockLabel.frame.size.width/2
        twoOclockLabel.clipsToBounds = true
        
        threeOclockLabel.layer.borderWidth = 0.2
        threeOclockLabel.layer.masksToBounds = false
        threeOclockLabel.layer.borderColor = UIColor.blackColor().CGColor
        threeOclockLabel.layer.cornerRadius = threeOclockLabel.frame.size.width/2
        threeOclockLabel.clipsToBounds = true
        
        sixOclockLabel.layer.borderWidth = 0.2
        sixOclockLabel.layer.masksToBounds = false
        sixOclockLabel.layer.borderColor = UIColor.blackColor().CGColor
        sixOclockLabel.layer.cornerRadius = sixOclockLabel.frame.size.width/2
        sixOclockLabel.clipsToBounds = true
        
        nineOclockLabel.layer.borderWidth = 0.2
        nineOclockLabel.layer.masksToBounds = false
        nineOclockLabel.layer.borderColor = UIColor.blackColor().CGColor
        nineOclockLabel.layer.cornerRadius = nineOclockLabel.frame.size.width/2
        nineOclockLabel.clipsToBounds = true

        twelveOclockLabel.layer.borderWidth = 0.2
        twelveOclockLabel.layer.masksToBounds = false
        twelveOclockLabel.layer.borderColor = UIColor.blackColor().CGColor
        twelveOclockLabel.layer.cornerRadius = twelveOclockLabel.frame.size.width/2
        twelveOclockLabel.clipsToBounds = true

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
