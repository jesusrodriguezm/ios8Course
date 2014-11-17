//
//  ViewController.swift
//  LemonadeStand
//
//  Created by Jesús on 16/11/14.
//  Copyright (c) 2014 Jesús. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Status container elements
    @IBOutlet weak var statusMoneyLabel: UILabel!
    @IBOutlet weak var statusIceCubesLabel: UILabel!
    @IBOutlet weak var statusLemonsLabel: UILabel!
    
    //Purchase container elements
    @IBOutlet weak var purchaseLemonsLabel: UILabel!
    @IBOutlet weak var purchaseIceCubesLabel: UILabel!
    @IBOutlet weak var purchaseLemonsStepper: UIStepper!
    @IBOutlet weak var purchaseIceCubesStepper: UIStepper!
    @IBOutlet weak var purchaseTotalLabel: UILabel!
    
    //Mix container elements
    @IBOutlet weak var mixLemonsLabel: UILabel!
    @IBOutlet weak var mixIceCubesLabel: UILabel!
    @IBOutlet weak var mixLemonsStepper: UIStepper!
    @IBOutlet weak var mixIceCubesStepper: UIStepper!
    
    var totalPurchase = 0
    var statusMoney = 10
    var numLemmons = 2
    var numIcesCubes = 4
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupSteppers()
        
        updateView()
    }
    
    func setupSteppers() {
        initializeStepper(purchaseLemonsStepper)
        initializeStepper(purchaseIceCubesStepper)
        initializeStepper(mixLemonsStepper)
        initializeStepper(mixIceCubesStepper)
    }
    
    func initializeStepper(st:UIStepper) {
        st.wraps = false
        st.autorepeat = true
        st.maximumValue = 10
        st.minimumValue = 0

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
     
    }
    
    
    @IBAction func purchaseLemonsStepperValueChanged(sender: UIStepper) {
        purchaseLemonsLabel.text = Int(sender.value).description
        calculateTotalPurchase()
    }
    
    @IBAction func purchaseIceCubesStepperValueChanged(sender: UIStepper) {
        purchaseIceCubesLabel.text = Int(sender.value).description
        calculateTotalPurchase()
    }
    
    func calculateTotalPurchase() {
        totalPurchase = 0
        var numLemmons = self.purchaseLemonsLabel.text?.toInt()
        var numIceCubes = self.purchaseIceCubesLabel.text?.toInt()
        totalPurchase = numLemmons! * 2
        totalPurchase += numIceCubes! * 1
        self.purchaseTotalLabel.text = "$\(totalPurchase)"
    }
    
    @IBAction func purchasePurchaseButton(sender: UIButton) {
        if totalPurchase <= statusMoney {
            statusMoney -= totalPurchase
            numLemmons = numLemmons + Int(purchaseLemonsStepper.value)
            numIcesCubes = numIcesCubes + Int(purchaseIceCubesStepper.value)
            purchaseLemonsStepper.value = 0
            purchaseLemonsStepperValueChanged(purchaseLemonsStepper)
            purchaseIceCubesStepper.value = 0
            purchaseIceCubesStepperValueChanged(purchaseLemonsStepper)
            updateView()
        }
        else {
           showAlertWithText(message: "You don't have money enough for this purchase")
        }
        
    }
    
    func updateView(){
        self.statusMoneyLabel.text = "$\(statusMoney)"
        self.statusLemonsLabel.text = "\(numLemmons)"
        self.statusIceCubesLabel.text = "\(numIcesCubes)"
    }
    
    func showAlertWithText(header: String = "Warning", message: String) {
        var alert = UIAlertController(title: header, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }


}

