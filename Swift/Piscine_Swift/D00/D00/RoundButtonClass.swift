//
//  RoundButtonClass.swift
//  D00
//
//  Created by Sivanesan jegathas on 11/01/2018.
//  Copyright © 2018 Sivanesan jegathas. All rights reserved.
//

import UIKit

@IBDesignable // --> permet de rendre cette class modiifiale dans l'interface
class RoundButtonClass: UIButton {
    
    // @IBInspectable permet d'avoir un attribut dans l'interface d'Xcode pour tout élément utilisant cette class
    @IBInspectable var roundButton: Bool = false {
        didSet {
            if roundButton {
                layer.cornerRadius = frame.height / 2
            }
        }
    }
    
    override func prepareForInterfaceBuilder() {
        if roundButton {
            layer.cornerRadius = frame.height / 2
        }
    }
 
}
