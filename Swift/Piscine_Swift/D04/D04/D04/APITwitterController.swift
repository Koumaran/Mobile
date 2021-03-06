//
//  APITwitterController.swift
//  D04
//
//  Created by Jegathas Sivanesan on 23/03/2018.
//  Copyright © 2018 Jegathas Sivanesan. All rights reserved.
//

import Foundation

class APIController {
    
    weak var delegate: APITwitterDelegate?
    let token: String
    
    init(delegate: APITwitterDelegate?, token: String) {
        self.delegate = delegate
        self.token = token
    }
    
    func getTweets(search: String, nbr: Int) {
        var tweets: [Tweet] = []
        
        let q = (search as NSString).addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!
        
        if let url = NSURL(string: "https://api.twitter.com/1.1/search/tweets.json?q=\(q)&count=\(nbr)&lang=fr&result_type=recent") {
            
            let request = NSMutableURLRequest(url: url as URL)
            request.httpMethod = "GET"
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            URLSession.shared.dataTask(with: request as URLRequest) {
                (data, response, error) in
                if let err = error {
                    DispatchQueue.main.async() {
                        self.delegate?.handleError(error: err as NSError)
                    }
                } else if let d = data {
                    do {
                        let res = try JSONSerialization.jsonObject(with: d) as? NSDictionary
                        if let statuses: [NSDictionary] = res!["statuses"] as? [NSDictionary] {
                            for tweet in statuses {
                                let user = tweet["user"] as? NSDictionary
                                let name = user!["name"] as? String
                                let text = tweet["text"] as? String
                                if let dateString = tweet["created_at"] as? String {
                                    let dateFormatter = DateFormatter()
                                    dateFormatter.dateFormat = "E MMM dd HH:mm:ss Z yyyy"
                                    if let date = dateFormatter.date(from: dateString) {
                                        DispatchQueue.main.async() {
                                            tweets.append(Tweet(name: name!, date: date, text: text!))
                                        }
                                    }
                                }
                            }
                            DispatchQueue.main.async() {
                                self.delegate?.handleTweets(tweets: tweets)
                            }
                        } else {
                            print("err==", res!)
                        }
                    } catch let err as NSError {
                        print("err : \(err)")
                        DispatchQueue.main.async() {.
                            self.delegate?.handleError(error: err)
                        }
                    }
                }
                }.resume()
        } else {
            self.delegate?.handleError(error: NSError(domain: "Error with request", code: 400, userInfo: nil))
        }
    }
}
