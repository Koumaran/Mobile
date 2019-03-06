//
//  ViewController.swift
//  D04
//
//  Created by Jegathas Sivanesan on 23/03/2018.
//  Copyright © 2018 Jegathas Sivanesan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, APITwitterDelegate {
    
    let CUSTOMER_KEY = "wVgFkndMYlWNO6GTNILdTo4lR"
    let CUSTOMER_SRCRET = "EVJhCFhky1IWIBqRkw3KEwiUQNEMb8iCwIykcwxMwBxPPZ76JV"

    @IBOutlet weak var tableView: UITableView!
    
    var token: String = ""
    var tweets: [Tweet] = []
    
    // From APITwitterDelegate
    func handleTweets(tweets: [Tweet]) {
        DispatchQueue.main.async {
            self.tweets = tweets
            self.tableView.reloadData()
        }
    }
    
    // From APITwitterDelegate
    func handleError(error: NSError) {
        print("handleError : \(error)")
    }
    
    @IBAction func handleSearch(_ sender: UITextField) {
        print("handleSearch called")
        let text = sender.text ?? ""
        if text != "" {
            let apiController = APIController(delegate: self, token: self.token)
            apiController.getTweets(search: text, nbr: 100)
            tableView.setContentOffset(CGPoint.zero, animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getToken()
        
        // dynamique size for tableView
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func getToken() {
        let BEARER = ((CUSTOMER_KEY + ":" + CUSTOMER_SRCRET).data(using: String.Encoding.utf8))!.base64EncodedString(options: NSData.Base64EncodingOptions(rawValue: 0))
        
        // Creation de la requête HTTP en 3 étape
        // creation de l'URL
        let url = URL(string: "https://api.twitter.com/oauth2/token")
        // Creation de la requête
        var request = URLRequest(url: url! as URL)
        // Customisation de la requête selon la demande de la doc de Twitter
        request.httpMethod = "POST"
        request.setValue("Basic " + BEARER, forHTTPHeaderField: "Authorization")
        request.httpBody = "grant_type=client_credentials".data(using: String.Encoding.utf8)
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            (data, response, error) in
            if let err = error {
                print(err)
                self.showAlert(str: "Error Token: \(err)")
            }
            else if let d = data {
                do {
                    if let dic : NSDictionary = try JSONSerialization.jsonObject(with: d) as? NSDictionary {
                        if (self.token = dic["access_token"] as! String) != nil  {
                        print("Token : \(self.token)")
                        let apiController = APIController(delegate: self, token: self.token)
                        apiController.getTweets(search: "ecole 42", nbr: 100)
                        } else {
                            print("Err : Can't found access_token")
                            self.showAlert(str: "Error on you Token")
                        }
                    }
                } catch (let err) {
                    print(err)
                    self.showAlert(str: "Error Token Catch : \(err)")
                }
            }
        }
        task.resume()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableCell(withIdentifier: "inputCell")
        return view
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tweets.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tweetCell", for: indexPath) as! TweetCell
        cell.tweet = tweets[indexPath.row]
        return cell
    }
    
    
    func showAlert(str: String) {
        let alertController = UIAlertController(title: "Error", message: str, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alertController, animated: true, completion: nil)
    }


}

