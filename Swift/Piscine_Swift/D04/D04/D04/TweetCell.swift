//
//  TweetCell.swift
//  D04
//
//  Created by Jegathas Sivanesan on 23/03/2018.
//  Copyright © 2018 Jegathas Sivanesan. All rights reserved.
//

import UIKit

class TweetCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tweetLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    
    var tweet : Tweet? {
        didSet {
            if let t = tweet {
                nameLabel.text = t.name
                tweetLabel.text = t.text
                dateLabel.text = getDateString(format: "DD/MM/YYYY HH:mm", date: t.date, locale: "fr")

            }
        }
    }
    
    func getDateString(format: String, date: Date, locale: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.locale = Locale(identifier: locale)
        return dateFormatter.string(from: date)
    }
}
