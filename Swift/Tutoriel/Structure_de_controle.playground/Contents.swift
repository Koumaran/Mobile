//: Playground - noun: a place where people can play

import UIKit

/****************************************************************************************************/
/*                                   If                                                             */
/****************************************************************************************************/

let age = 26

if age < 18 {
    print("Minor")
}
else if age < 100 {
    print("Major")
}
else {
    print("Centenary")
}



/****************************************************************************************************/
/*                                   Switch                                                         */
/****************************************************************************************************/

let gesture = UIPanGestureRecognizer()

switch gesture.state  {
case .possible :
    print("It's probably a PanGesture")
case .began :
    print("Began")
case .changed :
    print("Changed")
//case .ended :
//    print("Ended")
case .failed, .cancelled :
    print("Error")
default :
    print("An other state")
}


/****************************************************************************************************/
/*                                   While, For                                                     */
/****************************************************************************************************/

var i = 0

while i < 100 {
    print(i)
    i += 1
}

for i in 0 ..< 100 {
    print(i)
}

let fruits = ["Apple", "Pear", "Banana"]

for fruit in fruits {
    print(fruit)
}




/****************************************************************************************************/
/*                                   if let                                                         */
/****************************************************************************************************/

var optInt: Int? = 4
optInt = nil
if let number = optInt {   // très pratique pour contrer les type optionnel
    print(number)
}

