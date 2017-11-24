//
//  ViewController.swift
//  BullsEye
//
//  Created by Sivanesan jegathas on 23/11/2017.
//  Copyright © 2017 Sivanesan jegathas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    var targetValue = 0
    var currentValue = 0
    var currentScore = 0
    var currentRound = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentValue = Int(slider.value)
        startNewGame()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(currentScore)
        roundLabel.text = String(currentRound)
    }
    
    func startNewRound() {
        currentRound += 1
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
        
    }
    
    @IBAction func startNewGame() {
        currentRound = 0
        currentScore = 0
        startNewRound()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
        print(currentValue)
    }

    @IBAction func showAlert() {
        let difference = abs(currentValue - targetValue)
        var points = 100 - difference
        
        let title: String
        if difference == 0 {
            title = "Perfect!"
            points += 100
        } else if difference < 5 {
            title = "You almost had it!"
            points += difference <= 1 ? 50 : 0
        } else if difference < 10 {
            title = "Pretty good!"
        } else {
            title = "Not even close..."
        }
        currentScore += points
       
        let message = "You scored: \(points) points"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Awesome", style: .default, handler: {
            action in
                self.startNewRound()
        })
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
}

