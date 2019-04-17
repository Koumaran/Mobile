//
//  ProfileHeaderView.swift
//  swifty companon
//
//  Created by Jegathas Sivanesan on 12/03/2019.
//  Copyright © 2019 Jegathas Sivanesan. All rights reserved.
//

import UIKit

class ProfileHeaderView: UIView {
	@IBOutlet weak var portraitImage: UIImageView!
	@IBOutlet weak var backImage: UIImageView!
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var experienceBar: UIProgressView!
	@IBOutlet weak var walletValueLabel: UILabel!
	@IBOutlet weak var evaluationPointLabel: UILabel!
	@IBOutlet weak var cursusValueLabel: UILabel!
	@IBOutlet weak var gradeValueLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var mailLabel: UILabel!
    @IBOutlet weak var localisationLabel: UILabel!
    
	
	
	func setupHeaderView(_ profile: Profile) {
		portraitImage.image = profile.imageConverted
		nameLabel.text = profile.displayname
		walletValueLabel.text = "Wallet  \(profile.wallet) ₳"
		evaluationPointLabel.text = "Evaluation points  \(profile.correctionPoint)"
        phoneLabel.text = "Téléphone  0\(profile.phone ?? "xxxxxxxxx")"
        mailLabel.text = "E-Mail  \(profile.email)"
        localisationLabel.text = "Localisation  \(profile.location ?? "-")"
		
		if let currentCursus = profile.cursusUsers.first {
			cursusValueLabel.text = "Cursus  \(currentCursus.cursus.name ?? "-")"
            gradeValueLabel.text = "Grade  \(currentCursus.grade ?? "-")"
			experienceBar.progress = Float(currentCursus.level.truncatingRemainder(dividingBy: 1))
            let levelString = String(currentCursus.level)
            let spliterByComma = levelString.components(separatedBy: ".")
            let lvlNumber = Int(spliterByComma[0]) ?? 0
            let lvlPercent = Int(spliterByComma[1]) ?? 0
            let lvl = UILabel(frame: CGRect(x: 0, y: 0, width: experienceBar.frame.width, height: 15))
            lvl.text = "level \(lvlNumber) - \(lvlPercent)%"
            lvl.textColor = .white
            lvl.textAlignment = .center
            experienceBar.addSubview(lvl)
		}
	}

}
