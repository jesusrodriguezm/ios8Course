//
//  ViewController.swift
//  ShoeConverter
//
//  Created by Jesús on 12/10/14.
//  Copyright (c) 2014 Jesús. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var mensShoeSizeTextField: UITextField!
    @IBOutlet weak var mensConvertedShoeSizeLabel: UILabel!
	
	
	@IBOutlet weak var womenShoeSizeTextField: UITextField!
	@IBOutlet weak var womenConvertedSizeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func convertButtonPress(sender: UIButton) {
		let sizeFromTextField = mensShoeSizeTextField.text.toInt()!
        let convertionConstant = 30
		mensConvertedShoeSizeLabel.hidden = false
		mensConvertedShoeSizeLabel.text = "\(sizeFromTextField + convertionConstant)" + " in European Shoe size"	
    }
	
	
	@IBAction func convertWomenButtonPress(sender: UIButton) {
		let sizeFromTextField = Double((womenShoeSizeTextField.text as NSString).doubleValue)
		let convertionConstant = 30.5
		womenConvertedSizeLabel.hidden = false
		womenConvertedSizeLabel.text = "\(sizeFromTextField + convertionConstant)" + " in European Shoe size"
	}
	
}

