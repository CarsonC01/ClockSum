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
    var clockNumber: Int = 0
    var numbersUsed:[Int] = []
    var correctAnswer: Int = 0
    var incorrectAnswer1: Int = 0
    var incorrectAnswer2: Int = 0
    var counterCorrect: Int = 0
    var counterIncorrect: Int = 0
    
    
    
    
}

func getRandomNumber(upperBound: Int, lowerBound: Int = 0) -> Int {
    
    //let randomNumber = GKRandomSource.sharedRandom().nextIntWithUpperBound(in: upperBound)

    let randomNum:UInt32 = arc4random_uniform(UInt32(upperBound)) + UInt32(lowerBound)
    let randomNumber:Int = Int(randomNum)
    
    print(randomNumber)
    
    return randomNumber
}




