//
//  File.swift
//  d06-2
//
//  Created by Jegathas Sivanesan on 04/04/2018.
//  Copyright © 2018 Jegathas Sivanesan. All rights reserved.
//

import UIKit

class FormView: UIView {
    let size: CGFloat = 100
    var form: String?
    var color: UIColor?
    
    init(x: CGFloat, y: CGFloat) {
        let rdm = Int(arc4random_uniform(2))
        self.form = (rdm == 1) ? "circle" : "sqaure"
        let rdmRed: CGFloat = CGFloat(drand48())
        let rdmBlue: CGFloat = CGFloat(drand48())
        let rdmGreen: CGFloat = CGFloat(drand48())
        self.color = UIColor(red: rdmRed, green: rdmGreen, blue: rdmBlue, alpha: 1.0)
        super.init(frame: CGRect(x: x - self.size / 2, y: y - self.size / 2, width: size, height: size))
        self.backgroundColor = self.color
        if self.form == "circle" {
            self.layer.cornerRadius = self.frame.size.width / 2
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
