//: Playground - noun: a place where people can play

import UIKit

enum Color: String {
    case Club = "Club"
    case Diamond = "Diamond"
    case Heart = "Heart"
    case Spade = "Spade"
    static let allColors: [Color] = [Club, Diamond, Heart, Spade]
}

enum Value: Int {
    case Ace = 1
    case Two = 2
    case Tree = 3
    case Four = 4
    case Five = 5
    case Six = 6
    case Seven = 7
    case Eight = 8
    case Nine = 9
    case Ten = 10
    case Jack = 11
    case Queen = 12
    case King = 13
    static let allValues: [Value] = [Ace, Two, Tree, Four, Five, Six, Seven, Eight, Nine, Ten, Jack, Queen, King
    ]
}

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

var shuffledDeck = Deck(shuffle: true)
var shortedDeck = Deck(shuffle: false)

print("Shuffled Deck:\n", shuffledDeck, "\n")
print("Shorted Deck:\n", shortedDeck, "\n")

print("1 Shuffled Deck Draw: ", shuffledDeck.draw()!)
print("1 Shorted Deck Draw: ", shortedDeck.draw()!, "\n")

print("2 Shuffled Deck Draw : ", shuffledDeck.draw()!)
print("2 Shorted Deck Draw: ", shortedDeck.draw()!, "\n")

let aceSpade = Card(c: Color.Spade, v: Value.Ace)

shuffledDeck.fold(c: aceSpade)
shortedDeck.fold(c: aceSpade)

print("Shuffled Deck Folded Card :", shuffledDeck.discards)
print("Shorted Deck Folded Card :", shortedDeck.discards)
