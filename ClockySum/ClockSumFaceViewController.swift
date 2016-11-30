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
    
    //MARK: - Properties
    var clockNumber: Int = 0
    var numbersUsed:[Int] = []
    var correctAnswer: Int = 0
    var incorrectAnswer1: Int = 0
    var incorrectAnswer2: Int = 0
    var counterCorrect: Int = 0
    var counterIncorrect: Int = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        speedDialMenu()
        
        multiplierLabel.text = "\(multiplier)x"
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Get user default settings
        let defaultSettings = UserDefaults.standard
        let userMultiplier = defaultSettings.integer(forKey: "userMultiplier")
        if userMultiplier > 0 {
            multiplier = userMultiplier
        }
        randomSwitch = defaultSettings.bool(forKey: "userRandomSwitch")
        
        configClockFace()
        
        setUpNextPlay()
        
    }
    

    func speedDialMenu() {
        
        let fab = KCFloatingActionButton()
        //fab.buttonColor = UIColor.blue
        fab.itemButtonColor = UIColor.brown
        fab.size = 65.0

        fab.addItem("Settings", icon: UIImage(named: "Settings")!, handler: { item in
            
            item.size = 65.0
            
            self.performSegue(withIdentifier: "settingsSegue", sender: nil)
            
            fab.close()
        })
        self.view.addSubview(fab)

    }
    
    @IBAction func answerTouchDown(_ sender: AnyObject) {
        
        // Check answer, show results, update counters
        
        if let answer = Int((sender.titleLabel??.text)!) {
            
            if answer == correctAnswer {
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
        
        let clockNumber = handleClockNumbering()
        if randomSwitch {
            multiplier = getRandomNumber(upperBound: 10, lowerBound: 2) + 1
        }
        
        multiplierLabel.text = "\(multiplier)x"
        handleAnswers(clockNumber: clockNumber)

    }
    
        
    
    func handleClockNumbering() -> Int {
        
        // remove last play number color = set last play clockface number color to default
        setClockNumberColor(number: clockNumber, color: UIColor.clear)
        
        // clear numbersUsed after three goes,  so can keep on playing indefinitely. Just avoids same numbers one after each other
        if numbersUsed.count > 7 {
            numbersUsed.removeAll()
        }
        
        // get random number 1 - 12 for clock face. +1 to avoid zero numbering on clock face
        clockNumber = getRandomNumber(upperBound: 12) + 1
        
        
        // get a new number that hasn't been used before
        while numbersUsed.contains(clockNumber) && numbersUsed.count < 12 {
            // get random number 1 - 12 for clock face
            clockNumber = getRandomNumber(upperBound: 12) + 1
        }
        
        print(numbersUsed)
        print(numbersUsed.count)
        
        
        if numbersUsed.count < 12 {
            // add to last numbers array for checking that number has not already been used
            numbersUsed.append(clockNumber)
            
            // set background color of clockface number to yellow
            setClockNumberColor(number: clockNumber, color: UIColor.yellow)
            
        }
        
        return clockNumber
        
    }
    
    
    func handleAnswers(clockNumber: Int) {
        
        correctAnswer = clockNumber * multiplier
        
        // Create two incorrect answers
        
        incorrectAnswer1 = getRandomNumber(upperBound: correctAnswer + 8, lowerBound: correctAnswer + 2)
        if correctAnswer > 2 {
            incorrectAnswer2 = getRandomNumber(upperBound: correctAnswer - 1, lowerBound: 1)
        } else {
            incorrectAnswer2 = getRandomNumber(upperBound: correctAnswer + 15, lowerBound: correctAnswer + 9)
        }
        
        print(correctAnswer, incorrectAnswer1, incorrectAnswer2)
        
        // Show Answers in random order
        
        // get random number from 3
        let answersArray = [correctAnswer, incorrectAnswer1, incorrectAnswer2]
        let shuffledAns = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: answersArray)
        print(shuffledAns[0])
        print(shuffledAns[1])
        print(shuffledAns[2])
        
        answerOne.setTitle(String(describing: shuffledAns[0]), for: .normal)
        answerTwo.setTitle(String(describing: shuffledAns[1]), for: .normal)
        answerThree.setTitle(String(describing: shuffledAns[2]), for: .normal
        )
        
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
        
        // Make views round, like a clock face
        
        // Make answer views round & give shadow
        makeRoundShadow(view: centerView)
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
    
    
    func makeRoundBorder(view: UIView, border: CGFloat){
        
        // Make views round and add border
        view.layer.borderWidth = border
        view.layer.masksToBounds = false
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.cornerRadius = view.frame.size.width/2
        view.clipsToBounds = true

    }
    
    func makeLabelRound(label: UILabel) {
        
        // Make outer rim clock time Labels round
        label.layer.masksToBounds = false
        label.layer.cornerRadius = label.frame.size.width/2
        label.clipsToBounds = true
    }
    
}
