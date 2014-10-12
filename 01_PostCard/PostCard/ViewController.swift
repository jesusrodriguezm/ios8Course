//
//  ViewController.swift
//  PostCard
//
//  Created by Jesús on 04/10/14.
//  Copyright (c) 2014 Jesús. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var enterNameTextField: UITextField!
    @IBOutlet weak var enterMessageTextField: UITextField!
    @IBOutlet weak var mailButtom: UIButton!
    @IBOutlet weak var nameLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func sendMailButtonPress(sender: UIButton) {
        messageLabel.hidden = false;
        messageLabel.text = enterMessageTextField.text
        messageLabel.textColor = UIColor.redColor()
        
        nameLabel.hidden = false;
        nameLabel.text = enterNameTextField.text
        nameLabel.textColor = UIColor.blueColor()
        
        enterMessageTextField.text = ""
        enterNameTextField.text = ""
        enterMessageTextField.resignFirstResponder()
        
        
        
        mailButtom.setTitle("Mail sent", forState:UIControlState.Normal)
        
    }
    
    
    @IBAction func restartButtonPress(sender: AnyObject) {
        mailButtom.setTitle("Send Mail", forState:UIControlState.Normal)
        
        messageLabel.text = ""
        messageLabel.hidden = true
       
        nameLabel.text = ""
        nameLabel.hidden = true
        nameLabel.resignFirstResponder()

        enterNameTextField.text = ""
        enterMessageTextField.text = ""
        enterMessageTextField.resignFirstResponder()

        
    }

}

