//
//  ProfileModel.swift
//  swifty companon
//
//  Created by Jegathas Sivanesan on 28/08/2018.
//  Copyright © 2018 Jegathas Sivanesan. All rights reserved.
//

import Foundation
import UIKit

struct Profile: Decodable {
    let id: Int
    let email: String
    let login: String
    let firstName: String
    let lastName: String
    let url: String
    let phone: String?
    let displayname: String
    let imageUrl: String
    let staff: Bool
    let correctionPoint: Int
    let poolMonth: String
    let poolYear: String
    let location: String?
    let wallet: Int
    
    private enum CodingKeys: String, CodingKey {
        case id, email,login, url, phone, displayname, location, wallet
        case firstName = "first_name"
        case lastName = "last_name"
        case imageUrl = "image_url"
        case staff = "staff?"
        case correctionPoint = "correction_point"
        case poolMonth = "pool_month"
        case poolYear = "pool_year"
        
    }
    
    var imageConverted : UIImage? {
        get {
            if let url = URL(string: imageUrl),
                let data = try? Data(contentsOf: url) {
                return UIImage(data: data)
            }
            return nil
        }
    }
}
