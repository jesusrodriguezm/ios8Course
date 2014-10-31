//
//  ViewController.swift
//  99RedBallons
//
//  Created by Jesús on 26/10/14.
//  Copyright (c) 2014 Jesús. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentPosition:Int = 0
    var ballonsArray:[Ballon] = []
    
    let numberOfBallons:Int = 99
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var backGround: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       self.createRandomBalloms(numberOfBallons)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createRandomBalloms(number:Int){
        for var i = 0; i < number; i++ {
            self.ballonsArray.append(initializeBallon(i+1))
        }
    }
    
    func initializeBallon(number:Int) -> Ballon {
        var ballon = Ballon()
        ballon.number = number
        
        let randomNumberImage:Int = Int(arc4random_uniform(UInt32(4)))
        
        switch randomNumberImage {
        case 0:
            ballon.backGroundImage = UIImage(named:"RedBalloon1.jpg")!
        case 1:
            ballon.backGroundImage = UIImage(named:"RedBalloon2.jpg")!
        case 2:
            ballon.backGroundImage = UIImage(named:"RedBalloon3.jpg")!
        case 3:
            ballon.backGroundImage = UIImage(named:"RedBalloon4.jpg")!
        default:
            ballon.backGroundImage = UIImage(named:"BerlinTVTower.jpg")!
        }
        return ballon
    }
    
    @IBAction func nextButton(sender: UIBarButtonItem) {
        let ballon:Ballon = self.ballonsArray[currentPosition]
        if currentPosition == numberOfBallons - 1 {
            currentPosition = 0
        }
        else {
            currentPosition++
        }
        label.text = "Ballon number: \(ballon.number)"
        backGround.image = ballon.backGroundImage
    }
    

}

