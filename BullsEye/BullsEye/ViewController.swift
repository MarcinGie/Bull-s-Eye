//
//  ViewController.swift
//  BullsEye
//
//  Created by Marcin on 19.12.2014.
//  Copyright (c) 2014 Marcin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!
    
    var currentValue: Int = 0
    var targetValue: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func startNewRound() {
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
    }
    
    @IBAction func showAlert() {
        let message = "The value of the slider is: \(currentValue)"+"\nThe target value is: \(targetValue)"
        
        let alert = UIAlertController(title: "Hello world", message: message, preferredStyle: .Alert)
        
        let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
        
        alert.addAction(action)
        
        presentViewController(alert, animated: true, completion: nil)
    
        startNewRound()
    }
    
    @IBAction func sliderMoved(slider: UISlider) {
        println("The value changed and is now at: \(slider.value)")
        currentValue = lroundf(slider.value)
    }
}

