//
//  PersonneTableViewCell.swift
//  D02
//
//  Created by Jegathas Sivanesan on 21/03/2018.
//  Copyright © 2018 Jegathas Sivanesan. All rights reserved.
//

import UIKit

class PersonneTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var detailLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    var personne: (String, String, Date)? {
        didSet {
            if let p = personne {
                nameLabel?.text = p.0
                detailLabel?.text = p.1
                dateLabel?.text = getDateString(format: "d  MMM YYYY HH:mm:ss", date: p.2, locale: "fr")
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
