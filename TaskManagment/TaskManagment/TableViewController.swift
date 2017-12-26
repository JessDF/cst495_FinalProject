//
//  TableViewController.swift
//  TaskManagment
//
//  Created by Jessie Dowding on 11/29/17.
//  Copyright © 2017 Cristian Meya Jessie. All rights reserved.
//
//  This is the table view page where all the todo list items will be displayed. 
//

import UIKit
import CoreData

class TableViewController: UITableViewController{
    

    var people: [NSManagedObject] = []
    var refresher: UIRefreshControl!
    
    @IBAction func `switch`(_ sender: UISwitch) {
        
        if (sender.isOn == true){
            self.tableView.isEditing = true // if editing then show delete circle nect to item
                                            // and have ability to reorder items
        }
        else{
            self.tableView.isEditing = false
        }
        
    }
    
    
    
    func save(name: String) {
        
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Person",
                                                in: managedContext)!
        
        let person = NSManagedObject(entity: entity, insertInto: managedContext)
        
        person.setValue(name, forKeyPath: "name")
        
        do {
            try managedContext.save()
            people.append(person)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    func edit(name: String, index: IndexPath) {
        
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let peoples = people[index.row]
        managedContext.delete(peoples)
        people.remove(at: index.row)
        tableView.deleteRows(at: [index], with: .top)
        
        let entity = NSEntityDescription.entity(forEntityName: "Person",
                                                in: managedContext)!
        
        let person = NSManagedObject(entity: entity, insertInto: managedContext)
        
        person.setValue(name, forKeyPath: "name")
        
        do {
            try managedContext.save()
            people.append(person)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "The List"
        //self.tableView.isEditing = false // if editing then show delete circle nect to item

        refresher = UIRefreshControl()
        tableView.addSubview(refresher)
        refresher.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refresher.tintColor = UIColor(red: 1.00, green: 0.21, blue: 0.55, alpha: 1.0) //pink
        refresher.addTarget(self, action: #selector(loadData), for: .valueChanged)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func loadData() {
        tableView.reloadData()
        refresher.endRefreshing()
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedObject = people[sourceIndexPath.row]
        
        //Delete
        people.remove(at: sourceIndexPath.row)
        
        //Move
        people.insert(movedObject, at: destinationIndexPath.row)
        NSLog("%@", "\(sourceIndexPath.row) => \(destinationIndexPath.row)")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Person")
        
        do {
            people = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle:UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        let peoples = people[indexPath.row]
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        managedContext.delete(peoples)
        people.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .top)
        
        do {
            try managedContext.save()
        } catch {
            fatalError("Failure to save context: \(error)")
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return people.count
    }
    
    func detailAction() {
        print ("button")
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let person = people[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        
        cell.textLabel?.text = person.value(forKeyPath: "name") as? String
        
        cell.DetailsBtn.tag = indexPath.row
               cell.DetailsBtn.addTarget(self, action: #selector(TableViewController.detailAction), for: .touchUpInside)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
        let alert = UIAlertController(title: "Edit Name",
                                      message: "edit the name",
                                      preferredStyle: .alert)
        
        
        let saveAction = UIAlertAction(title: "Save", style: .default) {
            [unowned self] action in
            
            guard let textField = alert.textFields?.first,
                let nameToSave = textField.text else {
                    return
            }
            
            self.edit(name: nameToSave, index: (indexPath as NSIndexPath) as IndexPath)
            self.tableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default)
        
        alert.addTextField()
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
        self.tableView.reloadData()
    }
    

}

