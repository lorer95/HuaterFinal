//
//  UserInfoViewController.swift
//  HuaterFinal
//
//  Created by Sergio Cardenas on 10/25/17.
//  Copyright © 2017 cs329E. All rights reserved.
//

import UIKit
import CoreData

class UserInfoViewController: UIViewController {
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var age: UIPickerView!
    @IBOutlet weak var gender: UIPickerView!
    @IBOutlet weak var weight: UITextField!
    @IBOutlet weak var metric: UISegmentedControl!
    
    @IBAction func createAccount(_ sender: Any) {
        if firstName.text!.characters.count == 0 || lastName.text!.characters.count == 0 || email.text!.characters.count == 0 {
            let alert = UIAlertController(title: "Message", message: "You must enter a value for all fields" , preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
        }
        else {
            
            var m = ""
            if metric.selectedSegmentIndex == 0 {
                m = "Lbs"
            }
            else {
                m = "Kgs"
            }
            
            let appDelegate = UIApplication.shared.delegate as? AppDelegate
            
            let managedContext = appDelegate?.persistentContainer.viewContext
            
            let entity = NSEntityDescription.entity(forEntityName: "User", in: managedContext!)!
            
            let _user = NSManagedObject(entity: entity, insertInto: managedContext)
            
            _user.setValue(email.text!, forKeyPath: "email")
            _user.setValue(firstName.text!, forKeyPath: "firstName")
            _user.setValue(lastName.text!, forKeyPath: "lastName")
            _user.setValue(m, forKeyPath: "metric")


            
            do {
                try managedContext?.save()
            }
            catch let error as NSError {
                print("Could not save. \(error), \(error.userInfo)")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
