import UIKit

// QOS: quality of service => recupere le thread besoin selon la priorité. ne pas utiliser unspecified


//let qos = DispatchQoS.unspecified.qosClass
let qos = DispatchQoS.background.qosClass
//let qos = DispatchQoS.utility.qosClass
//let qos = DispatchQoS.userInitiated.qosClass
//let qos = DispatchQoS.userInteractive.qosClass

let queue = DispatchQueue.global(qos: qos)

// existe aussi des fonctions sync
queue.async {
    // on ne doit pas faire des modification sur le display (ex modifier une image)
    // il faut revenir sur le MAIN thread pour faire les mdofication
//    DispatchQueue.main.async {
//        code de mofication du display
//    }
    print("This come from an OTHER queue!")
}

print("This come from MAIN queue")
