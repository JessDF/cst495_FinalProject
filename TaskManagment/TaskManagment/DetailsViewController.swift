//
//  DetailsViewController.swift
//  TaskManagment
//
//  Created by Meya Gorbea on 12/13/17.
//  Copyright © 2017 Cristian Meya Jessie. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var titleLbl: UILabel!
    var titleName:String = ""
    
    //var titleString : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.titleLbl.text = titleName

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