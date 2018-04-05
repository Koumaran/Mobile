//: Playground - noun: a place where people can play

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(panGesture(_:)))
        view.addGestureRecognizer(gesture)
    }
    
    func panGesture(gesture: UIPanGestureRecognizer) {
        switch gesture.state {
        case .began:
            print("began")
        case .changed:
            print("changed to \(gesture.location(in: view))")
        case .ended:
            print("ended")
        case .cancelled, .failed:
            print("cancelled, failled")
        case .possible:
            print("Possible")
        }
    }
}
