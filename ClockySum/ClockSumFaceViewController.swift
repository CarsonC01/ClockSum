//
//  ClockSumFaceViewController.swift
//  ClockySum
//
//  Created by Carson Carbery on 9/12/16.
//  Copyright © 2016 Carson Carbery. All rights reserved.
//

import UIKit
import GameKit
import KCFloatingActionButton
import DeviceKit

var multiplier: Int = 2
var randomSwitch: Bool = false
var randomUpper: Int = 10
var randomLower: Int = 1

class ClockSumFaceViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var answerOne: UIButton!
    @IBOutlet weak var answerTwo: UIButton!
    @IBOutlet weak var answerThree: UIButton!
    
    @IBOutlet weak var answerOneView: UIView!
    @IBOutlet weak var answerTwoView: UIView!
    @IBOutlet weak var answerThreeView: UIView!
    
    
//    @IBOutlet weak var resultsView: UIView!
//    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var correctCounter: UILabel!
    @IBOutlet weak var incorrectCounter: UILabel!
    
    @IBOutlet weak var multiplierLabel: UILabel!
    @IBOutlet weak var centerView: UIView!
    @IBOutlet weak var innerView: UIView!
    @IBOutlet weak var outerView: UIView!
    @IBOutlet weak var buttonView: UIView!
    
    @IBOutlet weak var oneOclockLabel: UILabel!
    @IBOutlet weak var twoOclockLabel: UILabel!
    @IBOutlet weak var threeOclockLabel: UILabel!
    @IBOutlet weak var fourOclockLabel: UILabel!
    @IBOutlet weak var fiveOclockLabel: UILabel!
    @IBOutlet weak var sixOclockLabel: UILabel!
    @IBOutlet weak var sevenOclockLabel: UILabel!
    @IBOutlet weak var eightOclockLabel: UILabel!
    @IBOutlet weak var nineOclockLabel: UILabel!
    @IBOutlet weak var tenOclockLabel: UILabel!
    @IBOutlet weak var elevenOclockLabel: UILabel!
    @IBOutlet weak var twelveOclockLabel: UILabel!
    
    //MARK: - IBConstraints
    @IBOutlet weak var outerImageWidth: NSLayoutConstraint!
    @IBOutlet weak var outerImageHeight: NSLayoutConstraint!
    @IBOutlet weak var outerViewWidth: NSLayoutConstraint!
    @IBOutlet weak var outerViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var buttonHeight: NSLayoutConstraint!
    @IBOutlet weak var buttonWidth: NSLayoutConstraint!
    
    @IBOutlet weak var answersTopToClockBt: NSLayoutConstraint!
    
    @IBOutlet weak var elevenTop: NSLayoutConstraint!
    @IBOutlet weak var elevenX: NSLayoutConstraint!
    @IBOutlet weak var tenLeading: NSLayoutConstraint!
    @IBOutlet weak var tenY: NSLayoutConstraint!
    @IBOutlet weak var oneTop: NSLayoutConstraint!
    @IBOutlet weak var oneX: NSLayoutConstraint!
    @IBOutlet weak var twoTrailing: NSLayoutConstraint!
    @IBOutlet weak var twoY: NSLayoutConstraint!
    @IBOutlet weak var fourTrailing: NSLayoutConstraint!
    @IBOutlet weak var fourY: NSLayoutConstraint!
    @IBOutlet weak var fiveBottom: NSLayoutConstraint!
    @IBOutlet weak var fiveX: NSLayoutConstraint!
    @IBOutlet weak var sevenBottom: NSLayoutConstraint!
    @IBOutlet weak var sevenX: NSLayoutConstraint!
    @IBOutlet weak var eightLeading: NSLayoutConstraint!
    @IBOutlet weak var eightY: NSLayoutConstraint!
    
    
    //MARK: - Properties
    var clockNumber: Int = 0
    var counterCorrect: Int = 0
    var counterIncorrect: Int = 0
    let clockySum = ClockySum()
    let device = Device()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // do initial set up
        speedDialMenu()
        getUserDefaults()
    
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        //adjustConstraintsForType()
        // Start play...
        configClockFace()
        setUpNextPlay()
        
    }
    
    override func viewWillLayoutSubviews() {
        adjustConstraintsForType()
    }
    
    func adjustConstraintsForType() {
        
        let iPhone5Types: [Device] = [.iPhone5, .iPhoneSE, .iPhone5s, .iPhone5c, .simulator(.iPhone5), .simulator(.iPhoneSE), .simulator(.iPhone5s), .simulator(.iPhone5c)]
        
        // Set constraints for IPhone SE screen size
        
        if device.isOneOf(iPhone5Types) {
            
            outerImageWidth.constant = 320
            outerImageHeight.constant = 320
            outerViewWidth.constant = 320
            outerViewHeight.constant = 320
            
            // set clockface numbers positions
            oneX.constant = 61
            oneTop.constant = 27
            twoY.constant = -61
            twoTrailing.constant = 27
            
            fourY.constant = 61
            fourTrailing.constant = 27
            fiveX.constant = 61
            fiveBottom.constant = 27
            
            sevenX.constant = -61
            sevenBottom.constant = 27
            eightY.constant = 61
            eightLeading.constant = 27
            
            elevenX.constant = -61
            elevenTop.constant = 27
            tenY.constant = -61
            tenLeading.constant = 27
            
        } else if device.isPad {
            
            // Set text size for Ipad layout
            
            print(device.description)
            
            answerOne.titleLabel?.font =  UIFont(name: (answerOne.titleLabel?.font.fontName)!, size: 60)
            answerTwo.titleLabel?.font = UIFont(name: (answerTwo.titleLabel?.font.fontName)!,
                size: 60)
            answerThree.titleLabel?.font = UIFont(name: (answerThree.titleLabel?.font.fontName)!, size: 60)
            
            oneOclockLabel.font = UIFont(name: (oneOclockLabel.font.fontName), size: 52)
            twoOclockLabel.font = UIFont(name: (twoOclockLabel.font.fontName), size: 52)
            threeOclockLabel.font = UIFont(name: (threeOclockLabel.font.fontName), size: 52)
            fourOclockLabel.font = UIFont(name: (fourOclockLabel.font.fontName), size: 52)
            fiveOclockLabel.font = UIFont(name: (fiveOclockLabel.font.fontName), size: 52)
            sixOclockLabel.font = UIFont(name: (sixOclockLabel.font.fontName), size: 52)
            sevenOclockLabel.font = UIFont(name: (sevenOclockLabel.font.fontName), size: 52)
            eightOclockLabel.font = UIFont(name: (eightOclockLabel.font.fontName), size: 52)
            nineOclockLabel.font = UIFont(name: (nineOclockLabel.font.fontName), size: 52)
            tenOclockLabel.font = UIFont(name: (tenOclockLabel.font.fontName), size: 52)
            elevenOclockLabel.font = UIFont(name: (elevenOclockLabel.font.fontName), size: 52)
            twelveOclockLabel.font = UIFont(name: (twelveOclockLabel.font.fontName), size: 52)
        
        }
        
        
        print(view.frame.width)

        
    }
    

    func speedDialMenu() {
        
        // Set up Floating Action Button as Speed Dial Menu, using KCFloatingActionButton framework
        
        let fab = KCFloatingActionButton()
        
        fab.buttonImage = UIImage(named: "Menu")
        fab.buttonColor = UIColor(red: 31/255.0, green: 125/255.0, blue: 234/255.0, alpha: 1.0)
        
        // if view is larger than IphoneSE width increase size of fab
        if view.frame.width > 320.0 {
            fab.size = 65.0
        }
        if view.frame.width == 320.0 {
            fab.size = 45.0
            fab.paddingY = 5.0
            fab.paddingX = 5.0

        }
        
        fab.tintColor = UIColor.white

        
        fab.addItem("Settings", icon: UIImage(named: "Setting")!, handler: { item in
            
            self.performSegue(withIdentifier: "settingsSegue", sender: nil)
            
            fab.close()
        })
        
        fab.addItem("Reset Scores", icon: UIImage(named: "Reset")!, handler: { item in
            
            self.counterCorrect = 0
            self.counterIncorrect = 0
            self.correctCounter.text = "Correct: \(self.counterCorrect)"
            self.incorrectCounter.text = "Incorrect: \(self.counterIncorrect)"
            
            fab.close()
        })

        fab.addItem("Tell a friend", icon: UIImage(named: "Write")!, handler: { item in
            
            self.showTellAFriend()
            
            fab.close()
        })
        
        fab.addItem("Instructions", icon: UIImage(named: "Info")!, handler: { item in
            
            self.performSegue(withIdentifier: "instSegue", sender: nil)
            
            fab.close()
        })

        self.view.addSubview(fab)

    }
    
    func showTellAFriend() {
        
        let shareText = "Hi, try this new app, it's a fun way to build math skills!"
        if let appURL = NSURL(string: "https://itunes.apple.com/app/id1182293244") {
            
            let vc = UIActivityViewController(activityItems: [shareText, appURL], applicationActivities: [])
            
            vc.popoverPresentationController?.sourceView = view
            present(vc, animated: true)
            
        }
    }
    
    func getUserDefaults() {
        
        // Get and set up user default settings
        let defaultSettings = UserDefaults.standard
        let userMultiplier = defaultSettings.integer(forKey: "userMultiplier")
        if userMultiplier > 0 {
            multiplier = userMultiplier
        }
        randomSwitch = defaultSettings.bool(forKey: "userRandomSwitch")
        
        let userRandomUpper = defaultSettings.integer(forKey: "userRandomUpper")
        if userRandomUpper > 0 {
            randomUpper = userRandomUpper
        }
        let userRandomLower = defaultSettings.integer(forKey: "userRandomLower")
        if userRandomLower > 0 {
            randomLower = userRandomLower
        }
        
    }
    
    @IBAction func answerTouchDown(_ sender: AnyObject) {
        
        // Check answer, show results, update counters
        
        if let answer = Int((sender.titleLabel??.text)!) {
            
            if answer == clockySum.getCorrectAnswer(clockNumber: clockNumber) {
                centerView.backgroundColor = UIColor.green
                multiplierLabel.text = "Y"
                counterCorrect += 1
                correctCounter.text = "Correct: \(counterCorrect)"
            }else {
                centerView.backgroundColor = UIColor.red
                multiplierLabel.text = "N"
                counterIncorrect += 1
                incorrectCounter.text = "Incorrect: \(counterIncorrect)"
            }
            
        }
        
     }
    
    
    @IBAction func answerTouchUp(_ sender: AnyObject) {

        setUpNextPlay()
    }
    
    
    func setUpNextPlay() {
        
        // Clear previous play view, get next play, show clock face and multiple choices
        
        // set last play clock number color to clear
        setClockNumberColor(number: clockNumber, color: UIColor.clear)
        
        // get new unused number
        clockNumber = clockySum.handleClockNumbering()
        
        // set background color of clockface number to yellow
        setClockNumberColor(number: clockNumber, color: UIColor.yellow)
        
        if randomSwitch {
            
            print(randomUpper, randomLower)
            
            multiplier = getRandomNumber(upperBound: randomUpper - 1, lowerBound: randomLower - 1) + 1
        }
        multiplierLabel.text = "\(multiplier)x"
        
        // get the three multiple choice answers including the correct answer
        let shuffledAns:[Int] = clockySum.handleAnswers(clockNumber: clockNumber)
        
        answerOne.setTitle(String(describing: shuffledAns[0]), for: .normal)
        answerTwo.setTitle(String(describing: shuffledAns[1]), for: .normal)
        answerThree.setTitle(String(describing: shuffledAns[2]), for: .normal)

    }
    
    
    func setClockNumberColor(number: Int, color: UIColor) {
        
        switch number {
        case 1:
            oneOclockLabel.backgroundColor = color
        case 2:
            twoOclockLabel.backgroundColor = color
        case 3:
            threeOclockLabel.backgroundColor = color
        case 4:
            fourOclockLabel.backgroundColor = color
        case 5:
            fiveOclockLabel.backgroundColor = color
        case 6:
            sixOclockLabel.backgroundColor = color
        case 7:
            sevenOclockLabel.backgroundColor = color
        case 8:
            eightOclockLabel.backgroundColor = color
        case 9:
            nineOclockLabel.backgroundColor = color
        case 10:
            tenOclockLabel.backgroundColor = color
        case 11:
            elevenOclockLabel.backgroundColor = color
        case 12:
            twelveOclockLabel.backgroundColor = color
            
        default:
            break
        }
    }
    
    func configClockFace() {
        
        // Make clockface views round & give shadow
        makeRoundShadow(view: centerView)
//        makeRoundShadow(view: innerView)
//        makeRoundShadow(view: outerView)
        
        // Make answer views round & give shadow
        makeRoundShadow(view: answerOneView)
        makeRoundShadow(view: answerTwoView)
        makeRoundShadow(view: answerThreeView)
        
        // Make outer rim clock time Labels round
        makeLabelRound(label: oneOclockLabel)
        makeLabelRound(label: twoOclockLabel)
        makeLabelRound(label: threeOclockLabel)
        makeLabelRound(label: fourOclockLabel)
        makeLabelRound(label: fiveOclockLabel)
        makeLabelRound(label: sixOclockLabel)
        makeLabelRound(label: sevenOclockLabel)
        makeLabelRound(label: eightOclockLabel)
        makeLabelRound(label: nineOclockLabel)
        makeLabelRound(label: tenOclockLabel)
        makeLabelRound(label: elevenOclockLabel)
        makeLabelRound(label: twelveOclockLabel)
    }
    
    
    func makeRoundShadow(view: UIView, height: CGFloat = 10.0) {
        
        // Make view round
        view.layer.cornerRadius = view.frame.size.width/2
        // Add shadow
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = CGSize(width: 0.0, height: height)
        view.layer.shadowRadius = 6.0

    }
    
    
    func makeLabelRound(label: UILabel) {
        
        // Make Labels round
        label.layer.masksToBounds = false
        label.layer.cornerRadius = label.frame.size.width/2
        label.clipsToBounds = true
    }
    
}
