//
//  ProfileViewController.swift
//  swifty companon
//
//  Created by Jegathas Sivanesan on 28/08/2018.
//  Copyright © 2018 Jegathas Sivanesan. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    var profile: Profile!
    
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupProfileView()
    }
    
    private func setupProfileView() {
        self.navigationItem.title = profile.login
        if profile.imageConverted != nil {
            photoView.image = profile.imageConverted!
        }
        firstNameLabel.text = profile.firstName
        lastNameLabel.text = profile.lastName
        emailLabel.text = profile.email
        phoneLabel.text = profile.phone ?? ""
    }
}
