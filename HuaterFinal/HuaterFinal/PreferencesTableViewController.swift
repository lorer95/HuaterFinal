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
    var idNO: Int!

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
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "AppUser")
        // let deleteRequest = NSBatchDeleteRequest( fetchRequest: fetchRequest as! NSFetchRequest<NSFetchRequestResult>)
        
        do {
            user = (try managedContext?.fetch(fetchRequest))!
        }
        catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let indexPath = tableView.indexPathForSelectedRow?.row
        if (indexPath == 0) {
            let vc = segue.destination as! ShowUserInfoViewController
            
            vc.idNO = idNO
            
            let backItem = UIBarButtonItem()
            backItem.title = "Back"
            navigationItem.backBarButtonItem = backItem
        }
    }

}
