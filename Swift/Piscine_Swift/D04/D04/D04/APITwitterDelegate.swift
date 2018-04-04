//
//  APITwitterDelegate.swift
//  D04
//
//  Created by Jegathas Sivanesan on 23/03/2018.
//  Copyright © 2018 Jegathas Sivanesan. All rights reserved.
//

import Foundation

protocol APITwitterDelegate: class {
    func handleTweets(tweets: [Tweet])
    func handleError(error: NSError)
}
