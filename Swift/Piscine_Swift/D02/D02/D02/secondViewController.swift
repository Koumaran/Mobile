//
//  secondViewController.swift
//  D02
//
//  Created by Jegathas Sivanesan on 21/03/2018.
//  Copyright © 2018 Jegathas Sivanesan. All rights reserved.
//

import UIKit

class secondViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var detailTextField: UITextView!
    var person: (String, String, Date)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Add a person"

        let doneBtn = UIBarButtonItem(title: "Done",
                                      style: .plain,
                                      target: self,
                                      action: #selector(doneBtnCalled))
        
        navigationItem.rightBarButtonItem = doneBtn

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if segue.identifier == "backSegue" {
            print("Segue called: \(String(describing: segue.identifier))")
            let name = nameTextField.text ?? ""
            let detail = detailTextField.text ?? ""
            let date = datePicker.date
            if (name != "" && futureDate(date: date)) {
                person = (name, detail, date)
            }
        }
    }
    
    func futureDate(date: Date) -> Bool {
        let now = Date()
        if (date > now) {
            return true
        }
        return false
    }

    @objc private func doneBtnCalled() {
        performSegue(withIdentifier: "backSegue", sender: nil)
    }


}
