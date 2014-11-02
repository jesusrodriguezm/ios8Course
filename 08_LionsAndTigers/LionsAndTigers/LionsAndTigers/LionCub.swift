//
//  LionCub.swift
//  LionsAndTigers
//
//  Created by Jesús on 2/11/14.
//  Copyright (c) 2014 Jesús. All rights reserved.
//

import Foundation

class LionCub: Lion {
    
    func rubLionCubsBelly () {
        println("\(name): Snuggle and be happy")
    }
    
    override func roar(){
        super.roar()
        println("\(name): Growl Growl")
    }
    
    override func randomFact() -> String {
        var randomFact: String
        if isAlphaMale {
            randomFact = "Cubs are usually hidden in the dense woods for aproximately six months"
        }
        else {
            randomFact = "Cubs begin eating meat about the age of six weeks"
        }
        return randomFact
    }
}
