//  CalendarViewController.swift
//  TaskManagment
//  Created by Meya Gorbea on 12/15/17.
//  Copyright © 2017 Cristian Meya Jessie. All rights reserved.
//
//  This is the stat page of the app. Contains a "Get Started button"
//

import UIKit
import EventKit

class CalendarViewController: UIViewController {

    @IBOutlet weak var startBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        startBtn.layer.cornerRadius = 10

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
        
    @IBAction func startBtnTapped(_ sender: Any) {
        performSegue(withIdentifier: "mainSeg", sender: sender)
        
    }
        /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
