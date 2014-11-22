//
//  Util.swift
//  LemonadeStand
//
//  Created by Jesús on 22/11/14.
//  Copyright (c) 2014 Jesús. All rights reserved.
//

import Foundation
import UIKit

class Util {
    
    class func getRandom() -> CGFloat {
//        let randomNumber = CGFloat(Float(arc4random()) / Float(UINT32_MAX))
//        return randomNumber
        return CGFloat(arc4random_uniform(10)) / CGFloat(10.0)
    }
    
    
}
