//
//  ListTableViewCell.swift
//  D05
//
//  Created by Jegathas Sivanesan on 03/04/2018.
//  Copyright © 2018 Jegathas Sivanesan. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    @IBOutlet weak var repereLabel: UILabel!
    
    var repere : Repere? {
        didSet {
            if let r = repere {
                repereLabel.text = r.title
            }
        }
    }
}
