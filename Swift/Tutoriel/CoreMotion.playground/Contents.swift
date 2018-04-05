//: Playground - noun: a place where people can play

import UIKit
import CoreMotion

func accelerometerHandler(data : CMAccelerometerData?, error : NSError) {
    print("accelerometterHandler called")
}

let motionManager = CMMotionManager()

if motionManager.isAccelerometerAvailable {
    motionManager.accelerometerUpdateInterval = 0.2
    let queu = OperationQueue.main
    motionManager.startAccelerometerUpdates(to: queu, withHandler: (accelerometerHandler as? CMAccelerometerHandler)!)
}
