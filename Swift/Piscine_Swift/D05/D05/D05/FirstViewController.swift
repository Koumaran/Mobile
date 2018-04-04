//
//  FirstViewController.swift
//  D05
//
//  Created by Jegathas Sivanesan on 03/04/2018.
//  Copyright © 2018 Jegathas Sivanesan. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class FirstViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate, ListLocationDelegate {
    
    let school : Repere = Repere.allRepere[0]
    var secondViewController : SecondViewController?
    var locationManager = CLLocationManager()
    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBAction func getMyLocation(_ sender: Any) {
        let userLocation = locationManager.location
        var region : MKCoordinateRegion {
            let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
            return MKCoordinateRegion(center: userLocation!.coordinate, span: span)
        }
        mapView.setRegion(region, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        startReceivingLocationChanges()
        
        displayAnnotation(reperes: Repere.allRepere)
        let schoolAnnotation = PinAnnotation(coordinate: school.coordinate, title: school.title, subtitle: school.subtitle)
        mapView.showsUserLocation = true
        mapView.setRegion(schoolAnnotation.region, animated: true)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("location updated !")
    }

    func startReceivingLocationChanges() {
        let authorizationStatus = CLLocationManager.authorizationStatus()
        if authorizationStatus != .authorizedWhenInUse && authorizationStatus != .authorizedAlways {
            // User has not authorized access to location information.
            locationManager.requestWhenInUseAuthorization()
            print("not autorized")
            return startReceivingLocationChanges()
        }
        // Do not start services that aren't available.
        if !CLLocationManager.locationServicesEnabled() {
            print("Location services is not available.")
            return
        }
        // Configure and start the service.
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.distanceFilter = 100.0  // In meters.
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        var annotationView: MKPinAnnotationView
        guard let annotation = annotation as? PinAnnotation else { return nil }
        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: annotation.identifier) as? MKPinAnnotationView {
            annotationView = dequeuedView
        } else {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: annotation.identifier)
        }
        annotationView.pinTintColor = annotation.color
        annotationView.isEnabled = true
        annotationView.canShowCallout = true
        return annotationView
    }
    
    func displayAnnotation(reperes: [Repere]) {
        var annotations : [MKAnnotation] = []
        for repere in reperes{
            annotations.append(PinAnnotation(coordinate: repere.coordinate, title: repere.title, subtitle: repere.subtitle))
        }
        mapView.addAnnotations(annotations)
    }
    
    @IBAction func mapTypeController(sender: UISegmentedControl!) {
        switch (sender.selectedSegmentIndex) {
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .satellite
        default:
            mapView.mapType = .hybrid
        }
    }
    
    func updateRegionFromList(region: MKCoordinateRegion) {
        print("\nupdateRegionFromList\n")
        mapView.setRegion(region, animated: true)
    }


}

