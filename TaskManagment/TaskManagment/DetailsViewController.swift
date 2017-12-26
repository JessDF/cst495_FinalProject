//
//  DetailsViewController.swift
//  TaskManagment
//
//  Created by Meya Gorbea on 12/13/17.
//  Copyright © 2017 Cristian Meya Jessie. All rights reserved.
//
//  This details page will show all details of a certain to do item 

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var titleLbl: UILabel!
    var titleName:String = ""
    @IBOutlet weak var descripLbl: UILabel!
    var descripName:String = ""
    
    @IBOutlet weak var startLbl: UILabel!
    var startString:String = ""
    @IBOutlet weak var endLbl: UILabel!
    var endString:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.titleLbl.text = titleName
        self.descripLbl.text = descripName
        self.startLbl.text = startString
        self.endLbl.text = endString

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
