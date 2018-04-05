//
//  ViewController.swift
//  D06
//
//  Created by Jegathas Sivanesan on 04/04/2018.
//  Copyright © 2018 Jegathas Sivanesan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var forms : [ObjectView] = []
    
    var dynamicAnimator: UIDynamicAnimator!
    var gravityBehavior: UIGravityBehavior!
    var collisionBehavior: UICollisionBehavior!
    var itemBehavior: UIDynamicItemBehavior!

    
    
    // for scal pinch gesture
    var identity = CGAffineTransform.identity

    @IBAction func tappedOnView(_ sender: UITapGestureRecognizer) {
        let position = sender.location(in: view)
        
        print("Tapped on \(position)")
        
        let form = ObjectView(x: position.x, y: position.y, height: CGFloat(100), width: CGFloat(100), color: nil)
        // Add gesture
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGestureHandle(_:)))
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(pinchGestureHandler(_:)))
        let rotateGesture = UIRotationGestureRecognizer(target: self, action: #selector(rotateGestureHandler(_:)))
        form.view.addGestureRecognizer(panGesture)
        form.view.addGestureRecognizer(pinchGesture)
        form.view.addGestureRecognizer(rotateGesture)
        view.addSubview(form.view)
        gravityBehavior.addItem(form.view)
        collisionBehavior.addItem(form.view)
        itemBehavior.addItem(form.view)
        
        forms.append(form)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Animator
        dynamicAnimator = UIDynamicAnimator(referenceView: self.view)
        
        // Gravity
        gravityBehavior = UIGravityBehavior()
//        gravityBehavior.magnitude = 5 // comment it for auto set
        dynamicAnimator.addBehavior(gravityBehavior)
        
        // Collision
        collisionBehavior = UICollisionBehavior()
        collisionBehavior.translatesReferenceBoundsIntoBoundary = true
        dynamicAnimator.addBehavior(collisionBehavior)
        
        // Elasticity
        itemBehavior = UIDynamicItemBehavior()
        itemBehavior.elasticity = 0.5
        dynamicAnimator.addBehavior(itemBehavior)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func panGestureHandle(_ sender: UIPanGestureRecognizer) {
        if let view = sender.view {
            switch sender.state {
            case .possible:
                print("panGesture possible")
            case .began:
                print("panGesture Began")
                gravityBehavior.removeItem(view)
            case .changed:
                view.center = sender.location(in: self.view)
                dynamicAnimator.updateItem(usingCurrentState: view)
            case .ended:
                print("panGesture Ended")
                gravityBehavior.addItem(view)
            case .cancelled:
                print("panGesture Cancelled")
            case .failed:
                print("panGesture Failed")
            }
        }
    }

    
    @IBAction func pinchGestureHandler(_ sender: UIPinchGestureRecognizer) {
        if let view = sender.view {
            switch sender.state {
            case .possible:
                print("pinchGesture possible")
            case .began:
                print("pinchGesture Began")
                print(view.transform)
                gravityBehavior.removeItem(view)
                itemBehavior.removeItem(view)
                collisionBehavior.removeItem(view)
            case .changed:
                let transform = view.transform.scaledBy(x: sender.scale, y: sender.scale)
                sender.view?.transform = transform
                
            case .ended:
                print("pinchGesture Ended \(sender.scale)")
                print(view.transform)
                print("\n\n")
                gravityBehavior.addItem(sender.view!)
                itemBehavior.addItem(sender.view!)
                collisionBehavior.addItem(sender.view!)
            case .cancelled:
                print("pinchGesture Cancelled")
            case .failed:
                print("pinchGesture Failed")
            }
            sender.scale = 1.0
        }
    }
    
    @objc func rotateGestureHandler(_ sender: UIRotationGestureRecognizer) {
        if let view = sender.view {
            switch sender.state {
            case .began:
                print("rotation began")
                gravityBehavior.removeItem(view)
            case .changed:
                print("rotation changed")
                view.transform = view.transform.rotated(by: sender.rotation)
                dynamicAnimator.updateItem(usingCurrentState: view)
                sender.rotation = 0
            case .failed, .cancelled:
                print("rotation failed or cancelled")
            case .possible:
                print("rotation possible")
            case .ended:
                print("rotation ended")
                gravityBehavior.addItem(view)
            }
        }
    }
    
    
//    @IBAction func didRotate(sender: UIRotationGestureRecognizer) {
//        if let view = sender.view {
//            let rotation = sender.rotation
//            let imageView = sender.view as! UIImageView
//            let previousTransform = imageView.transform
//            imageView.transform = CGAffineTransform.rotated(rotation)
//            sender.rotation = 0
//        }

    
//    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
//        return true
//    }

}

