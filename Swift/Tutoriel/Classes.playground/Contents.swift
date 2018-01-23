//: Playground - noun: a place where people can play

import UIKit

/****************************************************************************************************/
/*                                     Struct                                                       */
/****************************************************************************************************/

struct PointStruct {
    var x: Double           // les properties
    var y: Double
    
    mutating func makeOrigin() {        // mutating permet de modifier les properties déclarer dans la
                                        // structure a l'intérieur de la fonction
        x = 0
        y = 0
    }
}


/****************************************************************************************************/
/*                                     Class                                                        */
/****************************************************************************************************/

class PointClass {
    var x: Double             // properties
    var y: Double = 0          // ici ce variable peut etre utiliser par le constructeur par default
    
    init (x: Double, y: Double) {   // init permet de déclarer sont propre constructeur
        self.x = x
        self.y = y
    }
    
    func makeOrigin() {
        x = 0
        y = 0
    }
    
    func toString() -> String {
        return "\(x) \(y)"
    }
}


/****************************************************************************************************/
/*                                     Extension                                                    */
/****************************************************************************************************/

extension PointStruct {             // extension permet de rajouter du code dans tous (class, struct, type...)
    func toString() -> String {     //ici on ajoute la function toString à la struc PointStruct
        return "\(x) \(y)"
    }
}


/****************************************************************************************************/
/*                                     Class vs Struct                                              */
/****************************************************************************************************/

//var p1 = PointStruct(x: 31, y: 42)              // struct sont passé par valeur
var p1 = PointClass(x: 21, y:42)              // class sont passé par référence
var p2 = p1
print(p1.toString())
print(p2.toString())
p1.x = 0
print(p1.toString())
print(p2.toString())


/****************************************************************************************************/
/*                              Inheritence, Override, Overload                                     */
/****************************************************************************************************/

class Point: PointClass {
    override func toString() -> String {
        return "[x : \(x), y : \(y)]"
    }
    
    func toString(char: Character) -> String {    //overload: deux fonction avec mm nom mais des les paramètre change
        return "\(char)"
    }
}

let p = Point(x: 84, y: 168)
print(p.toString())
print(p.toString(char: "G"))

