//
//  ViewController.swift
//  TaskManagment
//
//  Created by Jessie Dowding on 11/29/17.
//  Copyright © 2017 Cristian Meya Jessie. All rights reserved.
//

import UIKit

class AddViewController: UIViewController, UITextViewDelegate{
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var notesTextView: UITextView!
    private var todoItems = ToDoItem.getMockData()
    var delegate: todoDelegate?
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addButton(_ sender: Any) {
        print("Button tapped")
        
        todoItems.append(ToDoItem(title: titleTextField.text!, note: notesTextView.text!))
        
        delegate?.addToList(title: titleTextField.text!, note: notesTextView.text!)
        
        //self.navigationController?.popToRootViewController(animated: true)
        self.navigationController?.popViewController(animated: true)
    }
    

}

