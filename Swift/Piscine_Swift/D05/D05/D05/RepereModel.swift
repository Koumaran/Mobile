//
//  RepereModel.swift
//  D05
//
//  Created by Jegathas Sivanesan on 03/04/2018.
//  Copyright © 2018 Jegathas Sivanesan. All rights reserved.
//

import MapKit

struct Repere {
    var coordinate : CLLocationCoordinate2D
    var title : String
    var subtitle : String
    
    static let allRepere = [
        Repere(coordinate: CLLocationCoordinate2D(latitude: 48.896607, longitude: 2.318501), title: "42", subtitle: "Number 1 universitie for computer science in the World"),
        Repere(coordinate: CLLocationCoordinate2D(latitude: 48.8048649, longitude: 2.1203554), title: "Chateau de Versaille", subtitle: "This is my home !"),
        Repere(coordinate: CLLocationCoordinate2D(latitude: 27.1750151, longitude: 78.0421552), title: "Taj Mahal", subtitle: "My Guest House"),
        Repere(coordinate: CLLocationCoordinate2D(latitude: 40.4319077, longitude: 116.5703749), title: "Grande Muraille de Chine", subtitle: "Est Wall, i run there evry mornig"),
        Repere(coordinate: CLLocationCoordinate2D(latitude: 48.8606109, longitude: 2.3376437), title: "Musée du Louvre", subtitle: "My own arts collection"),
        Repere(coordinate: CLLocationCoordinate2D(latitude: 48.8737903, longitude: 2.2950268), title: "Arc de Triomphe", subtitle: "It's look like something important but i forgot about it!")
    ]
}
