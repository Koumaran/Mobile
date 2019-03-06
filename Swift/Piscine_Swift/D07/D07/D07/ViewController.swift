//
//  ViewController.swift
//  D07
//
//  Created by Jegathas Sivanesan on 05/04/2018.
//  Copyright © 2018 Jegathas Sivanesan. All rights reserved.
//

import UIKit
import RecastAI
import ForecastIO
import Speech

class ViewController: UIViewController {
    
    // For microphone and Speech reconizer
    let audioEngine = AVAudioEngine()
    let speechReconizer: SFSpeechRecognizer? = SFSpeechRecognizer(locale: Locale.init(identifier: "en-US"))
    var recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
    var recognionTask: SFSpeechRecognitionTask?
    
    let bot = RecastAIClient(token: "ed847e508c6f91cf073fec57a50c2b56", language: "en")
    let forecastClient = DarkSkyClient(apiKey: "9c430f4e4b382d67f81f273342cdcb23")


    @IBOutlet weak var responseLabel: UILabel!
    @IBOutlet weak var queryText: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var microphoneButton: UIButton!
    
    
    @IBAction func sendQueryBtn(_ sender: UIButton) {
        if queryText.text != "" {
            activityIndicator.startAnimating()
            //Call makeRequest with string parameter to make a text request
            self.bot.textRequest(queryText.text!, successHandler: recastSuccessHandler, failureHandle: recastFailureHandler)
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    func recastSuccessHandler(response: Response) {
        if let location = response.get(entity: "location") {
            let lat = location["lat"]
            let lng = location["lng"]
            forecastClient.getForecast(latitude: lat as! Double, longitude: lng as! Double, completion: { result in
                switch result {
                case .success(let currentForecast, _):
                    if let currently = currentForecast.currently {
                        let weather = currently.summary!
                        let temperature = currently.temperature!
                        DispatchQueue.main.async {
                            self.responseLabel.text = "now it's \(weather) and the temperature is about \(temperature) F"
                            self.activityIndicator.stopAnimating()
                        }
                    } else {
                        DispatchQueue.main.async {
                            self.logError(error: "Error")
                        }
                    }
                case .failure(let error):
                    DispatchQueue.main.async {
                        print(error)
                        self.logError(error: "Error")
                    }
                }
            })
        } else {
            DispatchQueue.main.async {
                self.logError(error: "Error")
            }
        }
        
    }
    
    func recastFailureHandler(error: Any) {
        logError(error: "Error")
    }
    
    func logError(error: String) {
        activityIndicator.stopAnimating()
        responseLabel.text = error
    }

    // Speech
    @IBAction func microphoneTapped(_ sender: AnyObject) {
        
    }
}

