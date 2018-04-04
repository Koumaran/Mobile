//
//  ShowViewController.swift
//  D03
//
//  Created by Jegathas Sivanesan on 22/03/2018.
//  Copyright © 2018 Jegathas Sivanesan. All rights reserved.
//

import UIKit

class ShowViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    var image: UIImage?
    var imgView: UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgView = UIImageView(image: image)
        scrollView.addSubview(imgView!)
        scrollView.contentSize = (imgView?.frame.size)!
        scrollView.maximumZoomScale = 100
        scrollView.minimumZoomScale = 0.2

        // Do any additional setup after loading the view.
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imgView
    }


}
