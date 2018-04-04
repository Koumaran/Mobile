//
//  ViewController.swift
//  D03
//
//  Created by Jegathas Sivanesan on 22/03/2018.
//  Copyright © 2018 Jegathas Sivanesan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var photos : [String] = DataModel.photo
    var image : UIImage?
    var imageView: UIImageView?
    var nbrOfLoad: Int = 0

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as? PhotoCollectionViewCell
        let qos = DispatchQoS.background.qosClass
        let queue = DispatchQueue.global(qos: qos)
        
        
        queue.async {
            self.nbrOfLoad += 1
            DispatchQueue.main.async {
                UIApplication.shared.isNetworkActivityIndicatorVisible = true
                cell?.photoCellSpin.startAnimating()
            }
            if let imgUrl = URL(string: self.photos[indexPath.row]) {
                if let data = try? Data(contentsOf: imgUrl) {
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        cell?.photo = image
                        cell?.photoCellSpin.stopAnimating()
                    }
                } else {
                    self.showAlert(str: "Cannot acces to \(self.photos[indexPath.row])")
                    let image = UIImage(named: "notfound")
                    DispatchQueue.main.async {
                        cell?.photo = image
                        cell?.photoCellSpin.stopAnimating()
                    }
                }
            } else {
                self.showAlert(str: "It's not an URL path \(self.photos[indexPath.row])")
                let image = UIImage(named: "notfound")
                DispatchQueue.main.async {
                    cell?.photo = image
                    cell?.photoCellSpin.stopAnimating()
                }
            }
            self.nbrOfLoad -= 1
            if self.nbrOfLoad == 0 {
                DispatchQueue.main.async {
                    UIApplication.shared.isNetworkActivityIndicatorVisible = false
                }
            }
        }
        return cell!
    }
    
    // Segue
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showSegue", sender: collectionView.cellForItem(at: indexPath) as? PhotoCollectionViewCell)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if segue.identifier == "showSegue" {
            print("Segue colled from main")
            if let dest = segue.destination as? ShowViewController {
                let cell = sender as? PhotoCollectionViewCell
                dest.image = cell?.photo
                print("image sended")
            }
        }
    }
    func showAlert(str: String) {
        let alertController = UIAlertController(title: "Error", message: str, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alertController, animated: true, completion: nil)
    }

}

