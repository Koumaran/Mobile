//
//  main.swift
//  
//
//  Created by Sivanesan jegathas on 23/01/2018.
//

import Foundation

print("Test Ex04 Day01")



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
