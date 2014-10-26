//
//  Tiger.swift
//  LionsAndTigers
//
//  Created by Jesús on 19/10/14.
//  Copyright (c) 2014 Jesús. All rights reserved.
//

import Foundation
import UIKit

struct Tiger {
    var age = 0
    var name = ""
    var breed = ""
    var image = UIImage(named:"")
    
    func chuff() {
        println("\(name): Chuff Chuff")
    }
    
    func chuffANumberOfTimes(numberOfTimes:Int) {
        for var chuff = 0; chuff < numberOfTimes; ++chuff {
            //self neccesary for the conflict between the function and the for local variable names:
            self.chuff()
        }
    }
    
    func chuffANumberOfTimes(numberOfTimes:Int, isLoud:Bool) {
        for var chuffTimes = 1; chuffTimes <= numberOfTimes; chuffTimes++ {
            if isLoud {
                chuff()
            }
            else {
                println("\(self.name): purr, purr")
            }
        }
    }
    
    func ageInTigerYearsFromAge(regularAge: Int) -> Int {
        let newAge = regularAge * 3
        return newAge
    }
    
    func randomFact() -> String {
        let randomNumber =  Int(arc4random_uniform(UInt32(3)))
        
        var randomFact:String
        
        if randomNumber == 0 {
            randomFact = "The Tiger is the biggest species in the cat family"
        }
        else if randomNumber == 1 {
            randomFact = "Tigers can reach a lenght of 3.3 meters"
        }
        else {
            randomFact = "A group o tigers is known as an 'ambush' of 'strak'"
        }

        return randomFact
    }
}