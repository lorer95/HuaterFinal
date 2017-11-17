//
//  PreferencesTableViewController.swift
//  HuaterFinal
//
//  Created by Lore on 10/22/17.
//  Copyright © 2017 cs329E. All rights reserved.
//

import UIKit
import CoreData

class PreferencesTableViewController: UITableViewController {

    var user = [NSManagedObject]()
    var currentUser: appUser!
 

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Settings"
        PersistenceService.shared.fetchUsers()
        let defaults = UserDefaults.standard
        let idNO = defaults.integer(forKey: "idNO")
        
        currentUser = PersistenceService.shared.getUser(index: idNO-1)
        if currentUser.theme == "Night" {
            self.view.backgroundColor = UIColor.lightGray
        }
        else {
            self.view.backgroundColor = UIColor.white
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        PersistenceService.shared.fetchUsers()
        let defaults = UserDefaults.standard
        let idNO = defaults.integer(forKey: "idNO")
        
        currentUser = PersistenceService.shared.getUser(index: idNO-1)
        if currentUser.theme == "Night" {
            self.view.backgroundColor = UIColor.lightGray
        }
        else {
            self.view.backgroundColor = UIColor.white
        }
        
        
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        let managedContext = appDelegate?.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "AppUser")
        // let deleteRequest = NSBatchDeleteRequest( fetchRequest: fetchRequest as! NSFetchRequest<NSFetchRequestResult>)
        
        do {
            user = (try managedContext?.fetch(fetchRequest))!
        }
        catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
  

}
