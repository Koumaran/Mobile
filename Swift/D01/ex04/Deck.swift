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
    
    var cards : [Card] = allCards
    var discards: [Card] = []
    var outs : [Card] = []
    
    init(shuffle: Bool) {
        if shuffle {
            cards.shuffle()
        }
    }
    
    override var description: String {
        let str : [String] = cards.map({"\($0)"})
        return str.joined(separator: "\n")
    }
    
    func draw() -> Card? {
        let card : Card? = cards.removeFirst()
        if card != nil {
            outs.append(card!)
        }
        return card
    }
    
    func fold(c: Card) {
        if let i = outs.index(of: c) {
            let card = outs.remove(at: i)
            discards.append(card)
        }
    }
}

extension Array {
    mutating func shuffle() {
        for (n, _) in self.enumerated() {
            swapAt(n, Int(arc4random_uniform(UInt32(self.count))))
        }
    }
}
