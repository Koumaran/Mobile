//: Playground - Récupérer le Token de Twitter

import Foundation
import UIKit
// doc playground
import PlaygroundSupport

let CUSTOMER_KEY = "wVgFkndMYlWNO6GTNILdTo4lR"
let CUSTOMER_SRCRET = "EVJhCFhky1IWIBqRkw3KEwiUQNEMb8iCwIykcwxMwBxPPZ76JV"
let BEARER = ((CUSTOMER_KEY + ":" + CUSTOMER_SRCRET).data(using: String.Encoding.utf8))!.base64EncodedString(options: NSData.Base64EncodingOptions(rawValue: 0))

// Creation de la requête HTTP en 3 étape
// creation de l'URL
let url = URL(string: "https://api.twitter.com/oauth2/token")
// Creation de la requête
var request = URLRequest(url: url! as URL)
// Customisation de la requête selon la demande de la doc de Twitter
request.httpMethod = "POST"
request.setValue("Basic " + BEARER, forHTTPHeaderField: "Authorization")
request.httpBody = "grant_type=client_credentials".data(using: String.Encoding.utf8)
let task = URLSession.shared.dataTask(with: request as URLRequest) {
    (data, response, error) in
    print(response!)
    if let err = error {
        print(err)
    }
    else if let d = data {
        do {
            if let dic : NSDictionary = try JSONSerialization.jsonObject(with: d) as? NSDictionary {
                print(dic)
            }
        } catch (let err) {
            print(err)
        }
    }
}
task.resume()

// affichage du playground dans la durée
PlaygroundPage.current.needsIndefiniteExecution = true

