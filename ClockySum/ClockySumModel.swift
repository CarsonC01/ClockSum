//
//  ClockySumModel.swift
//  ClockySum
//
//  Created by Carson Carbery on 9/13/16.
//  Copyright © 2016 Carson Carbery. All rights reserved.
//

import Foundation
import GameKit

class ClockySum {
    
    //MARK: - Properties
    var numbersUsed:[Int] = []
    
    
    func handleClockNumbering() -> Int {
        
        // clear numbersUsed after 7,  so can keep on playing indefinitely. Just avoids same numbers one after each other
        if numbersUsed.count > 7 {
            numbersUsed.removeAll()
        }
        
        // get random number 1 - 12 for clock face. +1 to avoid returning zero
        var clockNumber = getRandomNumber(upperBound: 12) + 1
        
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
            
        }
        
        return clockNumber
        
    }
    
    func getCorrectAnswer(clockNumber: Int) -> Int {
        return clockNumber * multiplier
    }
    
    
    func handleAnswers(clockNumber: Int) -> [Int]{
        
        var incorrectAnswer1: Int = 0
        var incorrectAnswer2: Int = 0
        let correctAnswer = self.getCorrectAnswer(clockNumber: clockNumber)
        
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
        let shuffledAns: [Int] = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: answersArray) as! [Int]
        print(shuffledAns[0])
        print(shuffledAns[1])
        print(shuffledAns[2])
        
        return shuffledAns
        
        
    }

    
    
}

func getRandomNumber(upperBound: Int, lowerBound: Int = 0) -> Int {
    
    //let randomNumber = GKRandomSource.sharedRandom().nextIntWithUpperBound(in: upperBound)

    let randomNum:UInt32 = arc4random_uniform(UInt32(upperBound)) + UInt32(lowerBound)
    let randomNumber:Int = Int(randomNum)
    
    print(randomNumber)
    
    return randomNumber
}




