//
//  ViewController.swift
//  companion
//
//  Created by Sivanesan jegathas on 20/11/2017.
//  Copyright © 2017 Sivanesan jegathas. All rights reserved.
//

import UIKit

struct Course: Decodable {
    let id: Int
    let name: String
    let link: String
    let imageUrl: String
}

class Home: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let jsonUrlString = "https://api.letsbuildthatapp.com/jsondecodable/course"
        guard let url = URL(string: jsonUrlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            
            
            guard let data = data else { return }
            
            
            do {
                let course = try
                    JSONDecoder().decode(Course.self, from: data)
                print(course)
            } catch let jsonErr {
                print("Error serializing json: ", jsonErr)
            }
        }.resume()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

