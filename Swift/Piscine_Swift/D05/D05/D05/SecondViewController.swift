//
//  SecondViewController.swift
//  D05
//
//  Created by Jegathas Sivanesan on 03/04/2018.
//  Copyright © 2018 Jegathas Sivanesan. All rights reserved.
//

import UIKit
import MapKit

protocol ListLocationDelegate: class {
    func updateRegionFromList(region: MKCoordinateRegion)
}

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var repereTab : [Repere] = Repere.allRepere
    weak var delegate : FirstViewController?
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self.tabBarController?.viewControllers?.first as? FirstViewController
        
        tableView.rowHeight = UITableViewAutomaticDimension
        // Do any additional setup after loading the view, typically from a nib.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repereTab.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "repereCell", for: indexPath) as! ListTableViewCell
        cell.repere = repereTab[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let repere = repereTab[indexPath.row]
        var region : MKCoordinateRegion {
            let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
            return MKCoordinateRegion(center: repere.coordinate, span: span)
        }
        self.tabBarController?.selectedViewController = delegate
        delegate?.updateRegionFromList(region: region)
    }

}

