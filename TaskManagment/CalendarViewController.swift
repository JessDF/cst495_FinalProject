//
//  CalendarViewController.swift
//  TaskManagment
//
//  Created by Meya Gorbea on 12/15/17.
//  Copyright © 2017 Cristian Meya Jessie. All rights reserved.
//

import UIKit
import EventKit

class CalendarViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func AddEventBtnTapped(_ sender: Any) {
        let eventStore: EKEventStore = EKEventStore()
        
        eventStore.requestAccess(to: .event, completion: {(granted, error) in
            
            if (granted) && (error  == nil)
            {
                print("granted\(granted)")
                print("error\(error)")
            
            let event:EKEvent = EKEvent(eventStore: eventStore)
                event.title = "Add Event testing Title"
                event.startDate = Date()
                event.endDate = Date()
                event.notes = "This is note"
                event.calendar = eventStore.defaultCalendarForNewEvents
                do{
                    try eventStore.save(event, span: .thisEvent)
                }
                catch let error as NSError{
                    print("Error: \(error)")
                    
                }
                    print("Save Event")
            
            }else{
                print("Error:\(error)")
            }
            /*Check out the new logo that I created on <a href="http:logomakr.com" title="Logo Makr">LogoMakr.com</a> //https://logomakr.com/2ttQtn
            */
            
        })
        
        
        
        
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
