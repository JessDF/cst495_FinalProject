//
//  aboutPage.swift
//  TaskManagment
//
//  Created by Jessie Dowding on 12/13/17.
//  Copyright © 2017 Cristian Meya Jessie. All rights reserved.
//

import UIKit

class aboutPage: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tapGesture(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func backTapped(_ sender: Any) {
        performSegue(withIdentifier: "backToMain", sender: sender)
        
    }
    
}

