//
//  ViewController.swift
//  d06-2
//
//  Created by Jegathas Sivanesan on 04/04/2018.
//  Copyright © 2018 Jegathas Sivanesan. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    var dynamicAnimator: UIDynamicAnimator!
    var gravityBehavior: UIGravityBehavior!
    var collisionBehavior: UICollisionBehavior!
    var itemBehavior: UIDynamicItemBehavior!
    var initialCenter: CGPoint!
    var motion: CMMotionManager!
    var timer: Timer?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        initialCenter = CGPoint()
        
        // Animator
        dynamicAnimator = UIDynamicAnimator(referenceView: self.view)
        // Gravity
        gravityBehavior = UIGravityBehavior()
        // gravityBehavior.magnitude = 5
        // Collision
        collisionBehavior = UICollisionBehavior()
        collisionBehavior.translatesReferenceBoundsIntoBoundary = true
        // Elasticity
        itemBehavior = UIDynamicItemBehavior()
        itemBehavior.elasticity = 0.5
        // Add Behavior on Animator
        dynamicAnimator.addBehavior(gravityBehavior)
        dynamicAnimator.addBehavior(collisionBehavior)
        dynamicAnimator.addBehavior(itemBehavior)
        
        // Core Motion
        motion = CMMotionManager()
        if motion.isAccelerometerAvailable {
            motion.accelerometerUpdateInterval = 1.0 / 60 // 60Hz
            let queue = OperationQueue.main
            motion.startAccelerometerUpdates(to: queue, withHandler: startAccelerometer2)
        }
        // accelerometer without threat
//        self.startAccelerometers()
//
//        if motion.isAccelerometerAvailable {
//            motion.accelerometerUpdateInterval = 0.2
//            let queue = OperationQueue.main
//            motion.startAccelerometerUpdates(to: queue, withHandler: acceleroMeterHandler as! CMAccelerometerHandler)
//        }
        // tapGesture
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGestureHandler(_:)))
        view.addGestureRecognizer(tapGesture)
        
    }

    @objc func tapGestureHandler(_ gesture: UITapGestureRecognizer) {
        print("tapGesture on \(gesture.location(in: view))")
        if gesture.state == .ended {
            let position = gesture.location(in: view)
            let form = FormView(x: position.x, y: position.y)
            view.addSubview(form)
            
            form.isUserInteractionEnabled = true
            let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGestureHandler(_:)))
            let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(pinchGestureHandler(_:)))
            let rotateGesture = UIRotationGestureRecognizer(target: self, action: #selector(rotateGestureHandler(_:)))
            
            let gestures: [UIGestureRecognizer] = [
                panGesture,
                pinchGesture,
                rotateGesture
            ]
            
            for gesture in gestures {
                form.addGestureRecognizer(gesture)
            }
            // add behavior to Form
            gravityBehavior.addItem(form)
            collisionBehavior.addItem(form)
            itemBehavior.addItem(form)
        
        }
    }
    
    @objc func panGestureHandler(_ gesture: UIPanGestureRecognizer) {
        guard gesture.view != nil else {return}
        let form = gesture.view!
        switch gesture.state {
        case .began:
            print("panGesture Began")
            gravityBehavior.removeItem(form)
            initialCenter = form.center
        case .changed:
            form.center = gesture.location(in: self.view)
            dynamicAnimator.updateItem(usingCurrentState: form)
        case .ended:
            print("panGesture Ended")
            gravityBehavior.addItem(form)
        default:
            print("panGesture Cancelled")
            form.center = initialCenter
            gravityBehavior.addItem(form)
        }
    }
    
    @objc func pinchGestureHandler(_ gesture: UIPinchGestureRecognizer) {
        guard gesture.view != nil else { return }
        let form = gesture.view as! FormView
        if gesture.state == .began {
            gravityBehavior.removeItem(form)
            collisionBehavior.removeItem(form)
            itemBehavior.removeItem(form)
            print("pinch began")
        } else if gesture.state == .changed {
            // Create new frame
//            let width = form.frame.width * gesture.scale
//            let height = form.frame.height * gesture.scale
//            let x = gesture.location(in: view).x - width/2
//            let y = gesture.location(in: view).y - height/2
//            form.frame = CGRect(x: x, y: y, width: width, height: height)
            form.layer.bounds.size.width *= gesture.scale
            form.layer.bounds.size.height *= gesture.scale
            if form.form == "circle" {
                form.layer.cornerRadius = form.frame.width/2
            }
            gesture.scale = 1.0
        } else {
            print("pinch end")
            gravityBehavior.addItem(form)
            collisionBehavior.addItem(form)
            itemBehavior.addItem(form)
        }
    }

    @objc func rotateGestureHandler(_ gesture: UIRotationGestureRecognizer) {
        guard gesture.view != nil else { return }
        let form = gesture.view as! FormView
        switch gesture.state {
        case .began:
            print("rotate Gesture began")
            gravityBehavior.removeItem(form)
            itemBehavior.removeItem(form)
            collisionBehavior.removeItem(form)
        case .changed:
            form.transform = form.transform.rotated(by: gesture.rotation)
            dynamicAnimator.updateItem(usingCurrentState: form)
            gesture.rotation = 0
        case .ended:
            print("rotate gesture ended")
            collisionBehavior.addItem(form)
            itemBehavior.addItem(form)
            gravityBehavior.addItem(form)
        default:
            collisionBehavior.addItem(form)
            itemBehavior.addItem(form)
            gravityBehavior.addItem(form)
        }
    }
    
    func startAccelerometer2(data: CMAccelerometerData?, error: Error?) {
        if error != nil {
            print(error.debugDescription)
        }
        if let acceleration = data?.acceleration {
            self.gravityBehavior.gravityDirection = CGVector(dx: acceleration.x, dy: -acceleration.y)
        }
    }
    
    func startAccelerometers() {
        // Make sure the accelerometer hardware is available.
        if self.motion.isAccelerometerAvailable {
            self.motion.accelerometerUpdateInterval = 1.0 / 60.0  // 60 Hz
            self.motion.startAccelerometerUpdates()
            
            // Configure a timer to fetch the data.
            self.timer = Timer(fire: Date(), interval: (1.0/60.0),
                               repeats: true, block: { (timer) in
                                // Get the accelerometer data.
                                if let data = self.motion.accelerometerData {
                                    let x = data.acceleration.x
                                    let y = data.acceleration.y
                                    
                                    self.gravityBehavior.gravityDirection = CGVector(dx: x, dy: -y)
                                    // Use the accelerometer data in your app.
                                }
            })
            
            // Add the timer to the current run loop.
            RunLoop.current.add(self.timer!, forMode: .defaultRunLoopMode)
        }
    }
    
    func acceleroMeterHandler(data: CMAccelerometerData?, error: NSError?) {
        guard error == nil else {
            NSLog((error?.description)!)
            return
        }
        guard data != nil else { return }
        print(data!)
    }

}

