//
//  Object.swift
//  D06
//
//  Created by Jegathas Sivanesan on 04/04/2018.
//  Copyright © 2018 Jegathas Sivanesan. All rights reserved.
//

import UIKit

class ObjectView: UIView {
    var form: [String] = ["circle", "square"]
    var view: UIView
    
    init(x: CGFloat, y: CGFloat, height: CGFloat, width: CGFloat, color: UIColor?) {
        // center the tapped position to the midl on the square
        let newX = x - width / 2
        let newY = y - height / 2
        let frame = CGRect(x: newX, y: newY, width: width, height: height)
        view = UIView(frame: frame)
        super.init(frame: frame)
        
        if getRandomForm() == "circle" {
            view.layer.cornerRadius = CGFloat(height / 2)
        }
        if let color = color {
            view.backgroundColor = color
        } else {
            view.backgroundColor = getRandomColor()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getRandomForm() -> String {
        let i = Int(arc4random_uniform(UInt32(form.count)))
        return form[i]
    }
    
    func getRandomColor() -> UIColor{
        let randomRed:CGFloat = CGFloat(drand48())
        let randomGreen:CGFloat = CGFloat(drand48())
        let randomBlue:CGFloat = CGFloat(drand48())
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
    }
}
