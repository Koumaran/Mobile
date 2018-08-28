//
//  ViewController.swift
//  swifty companon
//
//  Created by Jegathas Sivanesan on 03/08/2018.
//  Copyright © 2018 Jegathas Sivanesan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var numberLabel: UILabel!
    
    // MARK: Properties
    let webService: WebService = WebService()
    var users: [SearchResult] = []
    
    // MARK: Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.titleView = searchBar
        
    }


}

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count > 2 {
            webService.getUser(text: searchText) { tab, error in
                if let err = error {
                    print(err)
                } else {
                    self.users = tab
                    DispatchQueue.main.async {
                        self.numberLabel.text = String(self.users.count)
                        self.tableView.reloadData()
                    }
                }
            }
        } else {
            users.removeAll()
            numberLabel.text = "42"
            tableView.reloadData()
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "resultCell", for: indexPath) as! ResultCell
        cell.nameLabel.text = users[indexPath.row].login
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(users[indexPath.row].login) is selected : \(users[indexPath.row].url)")
        let profileView = self.storyboard?.instantiateViewController(withIdentifier: "profileViewController") as! ProfileViewController
        self.present(profileView, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

