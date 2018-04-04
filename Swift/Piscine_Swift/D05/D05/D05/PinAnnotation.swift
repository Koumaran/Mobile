//
//  PinAnnotation.swift
//  D05
//
//  Created by Jegathas Sivanesan on 03/04/2018.
//  Copyright © 2018 Jegathas Sivanesan. All rights reserved.
//

import MapKit

//extension MKPointAnnotation {
//    convenience init(coordinate: CLLocationCoordinate2D, title: String, subtitle: String) {
//        self.init()
//        self.coordinate = coordinate
//        self.title = title
//        self.subtitle = subtitle
//    }
//}
//
//class PinAnnotation: MKPointAnnotation {
//
//    var region : MKCoordinateRegion {
//        let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
//        return MKCoordinateRegion(center: coordinate, span: span)
//    }
//}

class PinAnnotation: NSObject, MKAnnotation {
    var identifier = "repere"
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    var color: UIColor?
    
    init(coordinate: CLLocationCoordinate2D, title: String, subtitle: String) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
        
        super.init()
        
        self.color = self.getRandomColor()
    }
    

    var region : MKCoordinateRegion {
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        return MKCoordinateRegion(center: coordinate, span: span)
    }
    
    // Random Color generator
    func getRandomColor() -> UIColor{
        
        let randomRed:CGFloat = CGFloat(drand48())
        
        let randomGreen:CGFloat = CGFloat(drand48())
        
        let randomBlue:CGFloat = CGFloat(drand48())
        
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
        
    }
}
