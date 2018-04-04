//
//  ViewController.swift
//  D02
//
//  Created by Jegathas Sivanesan on 20/03/2018.
//  Copyright © 2018 Jegathas Sivanesan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var personnage: [(String, String, Date)] = Data.personnage
    
    @IBOutlet weak var tableView: UITableView!
    let cellIdentifier = "personneCell"
    let CellSpaceHeight: CGFloat = 10
    
    override func viewDidLoad() {
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100
    }
    
    // get number on section
    func numberOfSections(in tableView: UITableView) -> Int {
        return personnage.count
    }
    // Only one row by section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! PersonneTableViewCell
        cell.personne = personnage[indexPath.section]
        return cell
    }
    // header of section height
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CellSpaceHeight
    }
    // set the color of header of section to clear
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let clearView = UIView()
        clearView.backgroundColor = UIColor.clear
        return clearView
    }
    
    // unWindSegue
    @IBAction func unWindSegue(segue: UIStoryboardSegue) {
        if let sourceViewController = segue.source as? secondViewController, let person = sourceViewController.person {
            personnage.append(person)
            tableView.reloadData()
        }
    
    }
}

