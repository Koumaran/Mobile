//: Playground - noun: a place where people can play

import UIKit

struct Person {             // déclaration de struct pour l'exemple
/****************************************************************************************************/
/*                                 Stored Properties                                                */
/****************************************************************************************************/

    var name: String

/****************************************************************************************************/
/*                                     Observers                                                    */
/****************************************************************************************************/

    var age: Int {
        willSet {           //willSet sera appeller avant de modifier age
            print("\(name) will change his age from \(age) to \(newValue)")
        }
        didSet {            //didSet sera appeller après avoir modifier age
            print("\(name) did change his age from \(oldValue) to \(age)")
        }
    }

/****************************************************************************************************/
/*                             Computed Properties                                                  */
/****************************************************************************************************/

    var description: String {
        return "name : \(name), age : \(age)"
    }

    var isMinor: Bool {
        get {
            return age < 18
        }
        set {
            if newValue {
                age = 17
            } else {
                age = 18
            }
        }
    }
}                               // fin de la struct

var joe = Person(name: "Joe", age: 12)
joe.description
//joe.description = "toto"   // je ne peut pas set description car il ne contient pas de set dans son code
joe.isMinor
joe.age = 32
joe.isMinor = true


