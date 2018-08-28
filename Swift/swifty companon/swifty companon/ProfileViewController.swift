//
//  ProfileViewController.swift
//  swifty companon
//
//  Created by Jegathas Sivanesan on 28/08/2018.
//  Copyright © 2018 Jegathas Sivanesan. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Coco"
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Retour", style: .plain, target: #selector(goBack), action: nil)
    }
    
    @objc func goBack() {
        self.dismiss(animated: true, completion: nil)
    }


}
