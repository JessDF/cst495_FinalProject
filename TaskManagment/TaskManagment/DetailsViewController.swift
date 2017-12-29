//
//  DetailsViewController.swift
//  TaskManagment
//
//  Created by Meya Gorbea on 12/13/17.
//  Copyright © 2017 Cristian Meya Jessie. All rights reserved.
//
//  This details page will show all details of a certain to do item 

import UIKit
import QuartzCore

class DetailsViewController: UIViewController {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descripLbl: UILabel!
    @IBOutlet weak var startLbl: UILabel!
    @IBOutlet weak var endLbl: UILabel!
    
    
    var titleName:String = ""
    var descripName:String = ""
    var startString:String = ""
    var endString:String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.titleLbl.text = titleName
        self.descripLbl.text = descripName
        self.startLbl.text = startString
        self.endLbl.text = endString

        self.titleLbl.layer.borderWidth = 0.5
        self.descripLbl.layer.borderWidth = 0.5
        self.startLbl.layer.borderWidth = 0.5
        self.endLbl.layer.borderWidth = 0.5
       
        
        self.titleLbl.layer.cornerRadius = 10
        self.descripLbl.layer.cornerRadius = 5
        self.startLbl.layer.cornerRadius = 5
        self.endLbl.layer.cornerRadius = 5
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
