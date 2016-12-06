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
    
    
    @IBOutlet weak var resultsView: UIView!
    @IBOutlet weak var resultLabel: UILabel!
    
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
    
    
    
    //MARK: - Properties
    var clockNumber: Int = 0
    //var numbersUsed:[Int] = []
//    var correctAnswer: Int = 0
//    var incorrectAnswer1: Int = 0
//    var incorrectAnswer2: Int = 0
    var counterCorrect: Int = 0
    var counterIncorrect: Int = 0
    let clockySum = ClockySum()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        speedDialMenu()
        getUserDefaults()
        //multiplierLabel.text = "\(multiplier)x"
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        adjustConstraintsForType()
        // Start play...
        configClockFace()
        setUpNextPlay()
        
    }
    
    func adjustConstraintsForType() {
        
        if view.frame.width == 320.0 {
            
            outerImageWidth.constant = 310
            outerImageHeight.constant = 310
            outerViewWidth.constant = 310
            outerViewHeight.constant = 310
        }
    }
    

    func speedDialMenu() {
        
        // Set up Floating Action Button as Speed Dial Menu, using KCFloatingActionButton framework
        
        let fab = KCFloatingActionButton()
        
        fab.buttonImage = UIImage(named: "Menu")
        fab.buttonColor = UIColor(red: 31/255.0, green: 125/255.0, blue: 234/255.0, alpha: 1.0)
        //fab.itemButtonColor = UIColor(red: 50/255.0, green: 149/255.0, blue: 243/255.0, alpha: 1.0)
        fab.size = 65.0
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
            
            self.showFeedbackController()
            
            fab.close()
        })
        
        fab.addItem("Instructions", icon: UIImage(named: "Info")!, handler: { item in
            
            self.performSegue(withIdentifier: "instructionsSegue", sender: nil)
            
            fab.close()
        })

        self.view.addSubview(fab)

    }
    
    func showFeedbackController() {
        
        let shareText = "Hey why not try out this wonderful new app!"
        
        let vc = UIActivityViewController(activityItems: [shareText], applicationActivities: [])
        present(vc, animated: true)

    }
    
    func getUserDefaults() {
        
        // Get user default settings
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
    
        
    
//    func handleClockNumbering() -> Int {
//        
//        // remove last play number color = set last play clockface number color to default
//        setClockNumberColor(number: clockNumber, color: UIColor.clear)
//        
//        // clear numbersUsed after three goes,  so can keep on playing indefinitely. Just avoids same numbers one after each other
//        if numbersUsed.count > 7 {
//            numbersUsed.removeAll()
//        }
//        
//        // get random number 1 - 12 for clock face. +1 to avoid zero numbering on clock face
//        clockNumber = getRandomNumber(upperBound: 12) + 1
//        
//        
//        // get a new number that hasn't been used before
//        while numbersUsed.contains(clockNumber) && numbersUsed.count < 12 {
//            // get random number 1 - 12 for clock face
//            clockNumber = getRandomNumber(upperBound: 12) + 1
//        }
//        
//        print(numbersUsed)
//        print(numbersUsed.count)
//        
//        
//        if numbersUsed.count < 12 {
//            // add to last numbers array for checking that number has not already been used
//            numbersUsed.append(clockNumber)
//            
//            // set background color of clockface number to yellow
//            setClockNumberColor(number: clockNumber, color: UIColor.yellow)
//            
//        }
//        
//        return clockNumber
//        
//    }
    
    
//    func handleAnswers(clockNumber: Int) {
//        
//        correctAnswer = clockNumber * multiplier
//        
//        // Create two incorrect answers
//        
//        incorrectAnswer1 = getRandomNumber(upperBound: correctAnswer + 8, lowerBound: correctAnswer + 2)
//        if correctAnswer > 2 {
//            incorrectAnswer2 = getRandomNumber(upperBound: correctAnswer - 1, lowerBound: 1)
//        } else {
//            incorrectAnswer2 = getRandomNumber(upperBound: correctAnswer + 15, lowerBound: correctAnswer + 9)
//        }
//        
//        print(correctAnswer, incorrectAnswer1, incorrectAnswer2)
//        
//        // Show Answers in random order
//        
//        // get random number from 3
//        let answersArray = [correctAnswer, incorrectAnswer1, incorrectAnswer2]
//        let shuffledAns = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: answersArray)
//        print(shuffledAns[0])
//        print(shuffledAns[1])
//        print(shuffledAns[2])
//        
//        answerOne.setTitle(String(describing: shuffledAns[0]), for: .normal)
//        answerTwo.setTitle(String(describing: shuffledAns[1]), for: .normal)
//        answerThree.setTitle(String(describing: shuffledAns[2]), for: .normal
//        )
//        
//    }
    
    
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
