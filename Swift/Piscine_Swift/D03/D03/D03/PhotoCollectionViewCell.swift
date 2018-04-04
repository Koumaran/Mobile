//
//  PhotoCollectionViewCell.swift
//  D03
//
//  Created by Jegathas Sivanesan on 22/03/2018.
//  Copyright © 2018 Jegathas Sivanesan. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var photoCellImageView: UIImageView!
    @IBOutlet weak var photoCellSpin: UIActivityIndicatorView!
    
    var photo: UIImage? {
        didSet {
            self.photoCellImageView.image = self.photo
        }
    }
}
