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

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Settings"

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        let managedContext = appDelegate?.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "User")
        // let deleteRequest = NSBatchDeleteRequest( fetchRequest: fetchRequest as! NSFetchRequest<NSFetchRequestResult>)
        
        do {
            user = (try managedContext?.fetch(fetchRequest))!
        }
        catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }

}
