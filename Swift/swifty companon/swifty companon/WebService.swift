//
//  WebService.swift
//  swifty companon
//
//  Created by Jegathas Sivanesan on 03/08/2018.
//  Copyright © 2018 Jegathas Sivanesan. All rights reserved.
//

import Foundation

struct TokenBox: Decodable {
    let accessToken: String?
    let expiresIn: Int?
    let tokenType: String?
}

class WebService {
    let apiUId = "c049fca0270c61332ec27414a8d2f4962aec7b951fab6e80f9d5c689f946597e"
    let apiSecret = "fda04fe549906ec69b4cbd60f88c760d2122a8c5e7878ece66419e7819490137"
    var token: TokenBox?
    
    init() {
        getToken()
    }
    
    func getToken() {
        let api42: String = "https://api.intra.42.fr/oauth/token?"
        let params = "grant_type=client_credentials&client_id=\(apiUId)&client_secret=\(apiSecret)"
        
        guard let url = URL(string: "\(api42)\(params)") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        URLSession.shared.dataTask(with: request) { (data, response, err) in
            if let err = err {
                // modifier par une alert
                print(err)
            }

            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                self.token = try decoder.decode(TokenBox.self, from: data)
            } catch let jsonErr {
                // modifier par une alert
                print("Failed to decode: ", jsonErr)
            }
        }.resume()
    }
}
