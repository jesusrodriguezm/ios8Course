//
//  ViewController.swift
//  AgeOfLaika
//
//  Created by Jesús on 12/10/14.
//  Copyright (c) 2014 Jesús. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var yearsTextField: UITextField!

    @IBOutlet weak var dogsYearsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func convertButtonPress(sender: UIButton) {
        let conversiontRate = 7
        let yearsConverted = yearsTextField.text.toInt()! * conversiontRate
        
        dogsYearsLabel.text = "\(yearsConverted) human years."
        dogsYearsLabel.hidden = false
        yearsTextField.resignFirstResponder()
    }

}

