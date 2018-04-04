//
//  test.swift
//  
//
//  Created by Sivanesan jegathas on 21/01/2018.
//


print("Test of Enum : Color And Value")

let colors = Color.allColors
let values = Value.allValues

print("Enum Color :")
for color in colors {
    print(color)
}

print("Enum Value :")
for value in values {
    print("\(value)")
}
