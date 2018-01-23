//
//  Deck.swift
//  
//
//  Created by Sivanesan jegathas on 23/01/2018.
//

import Foundation

class Deck : NSObject {
    static let allSpades : [Card] = Value.allValues.map({Card(c : .Spade, v : $0)})
    static let allHearts : [Card] = Value.allValues.map({Card(c : .Heart, v : $0)})
    static let allDiamonds : [Card] = Value.allValues.map({Card(c : .Diamond, v : $0)})
    static let allClubs : [Card] = Value.allValues.map({Card(c : .Club, v : $0)})
    
    static let allCards : [Card] = allSpades + allHearts + allDiamonds + allClubs
}
