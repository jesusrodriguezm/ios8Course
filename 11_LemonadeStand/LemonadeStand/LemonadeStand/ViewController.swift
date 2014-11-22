//
//  ViewController.swift
//  LemonadeStand
//
//  Created by Jesús on 16/11/14.
//  Copyright (c) 2014 Jesús. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //App const
    let maxNumberOfClientsDay = 10
    var alive:Bool = true
    var weather:Int = 1
    
    //Status container elements
    @IBOutlet weak var statusMoneyLabel: UILabel!
    @IBOutlet weak var statusNumberDay: UILabel!
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
    @IBOutlet weak var mixRatioLabel: UILabel!
    @IBOutlet weak var mixLemonsStepper: UIStepper!
    @IBOutlet weak var mixIceCubesStepper: UIStepper!
    
    //startDay elements
    @IBOutlet weak var startDayButton: UIButton!
    
    @IBOutlet weak var startDayWeatherImage: UIImageView!
    
    //status variables
    var numberOfDay = 0
    var statusMoney = 10
    var numLemmons = 1
    var numIcesCubes = 1

    //purchase variables
    var totalPurchase = 0

    //mix variables
    var mixNumLemmons = 0
    var mixNumIceCubes = 0
    var mixRatio:Double = 1.0
    

    //startDay variables
    var numberOfCostumers = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        setupSteppers()
        updateView()
    }
    
    func restartApp(){
        alive = true
        startDayButton.setTitle("Start day", forState: UIControlState.Normal)
        numberOfDay = 0
        statusMoney = 10
        numLemmons = 1
        numIcesCubes = 1
        
        updateView()
    }
    
    func updateView(){
        self.statusMoneyLabel.text = "$\(statusMoney)"
        self.statusLemonsLabel.text = "\(numLemmons)"
        self.statusIceCubesLabel.text = "\(numIcesCubes)"
        self.mixIceCubesLabel.text = "\(mixNumIceCubes)"
        self.mixLemonsLabel.text = "\(mixNumLemmons)"
        

        if self.mixNumLemmons == 0 || self.mixNumIceCubes == 0 {
            self.mixRatioLabel.text = "Impossible"
        }
        else {
            var ratioDesc = ""
            if mixRatio < 1  {
                ratioDesc = "Diluted"
            }
            else if mixRatio == 1 {
                ratioDesc = "Equal"
            }
            else {
                ratioDesc = "Acidic"
            }
            self.mixRatioLabel.text = "\(mixRatio) - " + ratioDesc
        }
        
        self.statusNumberDay.text = "\(numberOfDay)"
        
        if alive {
            startDayButton.enabled = (mixNumIceCubes > 0 && mixNumLemmons > 0)
        }
        else {
            startDayButton.enabled = true
        }
    }
    
    func setupSteppers() {
        initializeStepper(purchaseLemonsStepper)
        initializeStepper(purchaseIceCubesStepper)
        setupMixSteppers()        
    }
    
    func setupMixSteppers() {
        mixLemonsStepper.maximumValue = Double(numLemmons)
        mixIceCubesStepper.maximumValue = Double(numIcesCubes)
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
            setupMixSteppers()
            updateView()
        }
        else {
           showAlertWithText(message: "You don't have money enough for this purchase")
        }
    }
    
    
    @IBAction func mixLemonsStepperValueChanged(sender: UIStepper) {
        mixLemonsLabel.text = Int(sender.value).description
        mixNumLemmons = Int(sender.value)
        calculateMixRatio()
    }
    
    
    @IBAction func mixIceCubesStepperChangedValue(sender: UIStepper) {
        mixIceCubesLabel.text = Int(sender.value).description
        mixNumIceCubes = Int(sender.value)
        calculateMixRatio()
    }
    
    func calculateMixRatio(){
        if mixNumLemmons == 0 {
            mixRatio = 0.0
        }
        else {
            if mixNumIceCubes == 0 {
                mixRatio = 1.0
            }
            else {
                mixRatio = Double(mixNumLemmons) / Double(mixNumIceCubes)
            }
        }
        updateView()
    }
    
    func restartMixValues() {
        numLemmons -= mixNumLemmons
        numIcesCubes -= mixNumIceCubes
        mixNumLemmons = 0
        mixLemonsStepper.value = 0
        mixLemonsStepperValueChanged(mixLemonsStepper)
        mixNumIceCubes = 0
        mixIceCubesStepper.value = 0
        mixIceCubesStepperChangedValue(mixIceCubesStepper)
        calculateMixRatio()
        setupMixSteppers()
    }
    
    @IBAction func startDayButtonPressed(sender: UIButton) {
        if alive {
            println()
            println("\(self.numberOfDay) --------------------------------------------------------")
            println("Today lemonade ratio: \(mixRatio)")
            
            var dayWeather:String = ""
            numberOfDay += 1
            numberOfCostumers = numberOfDayCostumers()
            println("Today's number of costumbers:  \(numberOfCostumers) ")
            
            self.weather = weatherOfDay()
            if self.weather == 1 {
                numberOfCostumers -= 3
                dayWeather = "cold"
                startDayWeatherImage.image = UIImage(named: "Cold")
            } else if weather == 2 {
                numberOfCostumers += 0
                dayWeather = "fair"
                startDayWeatherImage.image = UIImage(named: "Mild")
            } else {
                numberOfCostumers += 3
                dayWeather = "warn"
                startDayWeatherImage.image = UIImage(named: "Warm")
            }
            if numberOfCostumers < 0 {
                numberOfCostumers = 0
            }
            

            println("Today's number of costumbers:  \(numberOfCostumers) ")
            println("Today's weather: " + dayWeather)
            
            let currentMoney = statusMoney
            
            for var i = 0; i < numberOfCostumers; i++ {
                sellToCostumber(i)
            }
            
            restartMixValues()
            updateView()
            
            let paid = statusMoney - currentMoney
            showAlertWithText(header:"Day result", message:"Day \(numberOfDay) (" + dayWeather + "): \(numberOfCostumers) costumer(s) paid $\(paid)!")

            evaluateEnd()
        }
        else {
            restartApp()
        }
    }
    
    func numberOfDayCostumers() -> Int {
        return Int(Util.getRandom() * CGFloat(maxNumberOfClientsDay))
    }
    
    func weatherOfDay() -> Int {
        return Int(Util.getRandom() * CGFloat(3))
    }
    
    func sellToCostumber(numberOfCostumer:Int) {
        var costumberPreference = Util.getRandom()
        
        if costumberPreference <= 0.4 { //acidic
            if mixRatio > 1 {
                println("Costumer (acidic) \(numberOfCostumers) Paid!")
                statusMoney += 1
            }
            else {
                println("Costumer (acidic) \(numberOfCostumers) NO paid!")
            }
        } else if costumberPreference > 0.4 && costumberPreference <= 0.6 { //equal
            if mixRatio == 1 {
                println("Costumer (equal) \(numberOfCostumers) Paid!")
                statusMoney += 1
            }
            else {
                println("Costumer (equal) \(numberOfCostumers) NO paid!")
            }
        } else { //dilute
            if mixRatio < 1 {
                println("Costumer (dilute) \(numberOfCostumers) Paid!")
                statusMoney += 1
            }
            else {
                println("Costumer (dilute) \(numberOfCostumers) NO paid!")
            }
        }
    }
    
    func evaluateEnd() {
        if (statusMoney <= 2 && numLemmons == 0 && numIcesCubes == 0)
            || (statusMoney < 2 && numLemmons == 0) {
            //showAlertWithText(header: "END!", message: "End of supplies and money, you loose!!")
            alive = false
            startDayButton.setTitle("Restart", forState: UIControlState.Normal)
            startDayButton.enabled = true
        }
    }
    
    func showAlertWithText(header: String = "Warning", message: String) {
        var alert = UIAlertController(title: header, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }


}

