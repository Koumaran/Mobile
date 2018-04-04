//
//  TweetModel.swift
//  D04
//
//  Created by Jegathas Sivanesan on 23/03/2018.
//  Copyright © 2018 Jegathas Sivanesan. All rights reserved.
//

import Foundation

struct Tweet: CustomStringConvertible {
    let name: String
    let date: Date
    let text: String
    
    var description: String {
        return "Tweet par \(name) : \(text)"
    }
}
