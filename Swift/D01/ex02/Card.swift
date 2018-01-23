//
//  Card.swift
//  
//
//  Created by Sivanesan jegathas on 22/01/2018.
//

import Foundation

class Card: NSObject {
    var color : Color
    var value : Value
    
    init (c : Color, v : Value) {
        color = c
        value = v
    }
    
    override var description : String {
        return "\(value.rawValue), \(color)"
    }
 
    override func isEqual(_ object: Any?) -> Bool {
        if let object = object as? Card {
            if (color == object.color && value == object.value) {
                return true
            }
        }
        return false
    }
    
    static func ==(c1 : Card, c2 : Card) -> Bool {
        return c1.isEqual(c2)
    }
}
