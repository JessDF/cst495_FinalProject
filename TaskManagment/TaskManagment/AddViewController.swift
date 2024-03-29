//
//  ViewController.swift
//  TaskManagment
//  Created by Jessie Dowding on 11/29/17.
//  Copyright © 2017 Cristian Meya Jessie. All rights reserved.
//
//  This page creates an event and saves it to the 'To-Do list' and also has the 
//  ability to add the item to the Apple calendar. 
//


import UIKit
import CoreData
import EventKit

class AddViewController: UIViewController, UITextViewDelegate{
    
    @IBOutlet weak var startDate: UIDatePicker!
    @IBOutlet weak var endDate: UIDatePicker!
    
    
        @IBOutlet weak var saveButton: UIBarButtonItem!
        var people: [NSManagedObject] = []
        @IBOutlet weak var textField: UITextField! // title
        @IBOutlet weak var DesTitle: UITextField! //description
    
        @IBAction func save(_ sender: Any) {//UIStoryboardSegue
            let text = textField.text ?? ""
            if(!text.isEmpty) {
                saveHandler()
                dismiss(animated: true, completion: nil)
            }
            
        }
        func saveHandler () {
            guard let appDelegate =
                UIApplication.shared.delegate as? AppDelegate else {
                    return
            }
            
            let managedContext = appDelegate.persistentContainer.viewContext
            
            let entity = NSEntityDescription.entity(forEntityName: "Person",
                                                    in: managedContext)!
            
            let person = NSManagedObject(entity: entity, insertInto: managedContext)
            
            person.setValue(textField.text, forKeyPath: "name")
            person.setValue(DesTitle.text, forKeyPath: "details")
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
            person.setValue(dateFormatter.string(from: startDate.date), forKeyPath: "start")
            person.setValue(dateFormatter.string(from: endDate.date), forKeyPath: "end")
            
            do {
                try managedContext.save()
                people.append(person)
            } catch let error as NSError {
                print("Could not save. \(error), \(error.userInfo)")
            }
        }
        @IBAction func cancel(_ sender: Any) {
            dismiss(animated: true, completion: nil)
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
        }
        
        @IBAction func AddToCalTapped(_ sender: Any) {
            
            print("Adding to calendar....")
            let eventStore: EKEventStore = EKEventStore()
            let eventTitle = textField.text ?? ""
            let description = DesTitle.text ?? ""
            
            
            eventStore.requestAccess(to: .event, completion: {(granted, error) in
                
                if (granted) && (error  == nil)
                {
                    print("granted\(granted)")
                    print("error\(String(describing: error))")
                    
                    let event:EKEvent = EKEvent(eventStore: eventStore)
                    event.title = eventTitle
                    event.startDate = self.startDate.date
                    event.endDate = self.endDate.date
                    event.notes = description
                    event.calendar = eventStore.defaultCalendarForNewEvents
                    do{
                        try eventStore.save(event, span: .thisEvent)
                    }
                    catch let error as NSError{
                        print("Error: \(error)")
                        
                    }
                    print("Save Event")
                    
                }else{
                    print("Error:\(String(describing: error))")
                }
                /*Check out the new logo that I created on <a href="http:logomakr.com" title="Logo Makr">LogoMakr.com</a> //https://logomakr.com/2ttQtn
                 */
                
            })
        
    }
}

