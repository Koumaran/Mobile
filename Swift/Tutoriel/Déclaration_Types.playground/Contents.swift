//: Playground - noun: a place where people can play

import UIKit

/****************************************************************************************************/
/*                                     Var, Let                                                     */
/****************************************************************************************************/

var str1 = "Bonjour !"
var str2: String = "Hello !"
str2 = str1

let pi = 3.14   // ici il a automatiquement inférer le type Double
let pi2 : Float = 3.14 // ici on infére le type Float
//pi = 2  ==> Error: impossible de réassigner un let (une constante)


/****************************************************************************************************/
/*                                      Tuple                                                       */
/****************************************************************************************************/

let tuple = (str1, pi)
print(tuple)

let anotherTuple: (String, String, Int) = ("One", "Un", 1)
print(anotherTuple)
print(anotherTuple.2)  //Ici on appel l'élément 3 du tuple


/****************************************************************************************************/
/*                                     Array, Dictionnary                                           */
/****************************************************************************************************/

var fruits: [String] = [String]()  //On appel son constructeur pour construire le tableau
fruits.append("Fraise")
fruits.append("Banane")
fruits.append("Pomme")
// var fruits2 = ["Fraise", "Banane", "Pomme"]
print(fruits.first!)
print(fruits[2])


var personnes = [String : Int]()   //clé de type string et des valeur en Int
personnes["toto"] = 12
personnes["martin"] = 64
print(personnes["toto"]!)
print(personnes["martin"]!)


/****************************************************************************************************/
/*                                   Optionnal                                                      */
/****************************************************************************************************/

var optInt: Int? = 3   // déclaration d'une variable option de type Int, qui peut etre null ou pas
//print(optInt)
print(optInt!)         // Unwrap : on oblige a récuperer la valeur de optInt donc forcement pas null

optInt = 0
//print(optInt)
print(optInt!)

optInt = nil
//print(optInt)
//print(optInt!)      ==> ICI CRASH CAR optInt est null donc rien a récupérer

var optString: String! = "foo"    //Ici déclaration d'une variable optionel toujour unwraper donc une varible qui ne sera jamais a null
print(optString)
print(optString!)

optString = "bar"
print(optString)
print(optString!)

optString = nil  // ICI CRASH car optString a était optionel UnWraped donc ne peut etre a null
//print(optString)
//print(optString!)


/****************************************************************************************************/
/*                                    Weak                                                          */
/****************************************************************************************************/

var button: UIButton? = UIButton()
CFGetRetainCount(button)


weak var buttonRef = button // weak permet de ne pas augmenter le nombre de réference a un élément, retirer le mot clé * weak * pour voir la différence
CFGetRetainCount(button)

button = nil
CFGetRetainCount(buttonRef)










