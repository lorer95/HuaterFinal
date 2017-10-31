//
//  EditSettingsViewController.swift
//  HuaterFinal
//
//  Created by Michael Rukavina on 10/29/17.
//  Copyright © 2017 cs329E. All rights reserved.
//

import UIKit
import CoreData

class EditSettingsViewController: UIViewController {

    @IBOutlet weak var themeChange: UISegmentedControl!
    @IBOutlet weak var metricChange: UISegmentedControl!
    @IBOutlet weak var newsSource: UIPickerView!
    
    var currentUser: appUser!
    var idNO: Int!
    
    @IBAction func btnSaveClicked(_ sender: Any) {
        let alert = UIAlertController(title: "Success!",
                                      message: "Your preferences have been saved" ,
                                      preferredStyle: UIAlertControllerStyle.alert)

        present(alert, animated: true, completion: nil)

        var m: String
        var w: Int

        if metricChange.selectedSegmentIndex == 0 {
            m = "Lbs"
        }
        else {
            m = "Kg"
        }
        
        if currentUser.metric == m {
            w = currentUser.weight
        }
        else {
            if m == "Lbs" {
                w = Int(Double(currentUser.weight) * 2.2)
            }
            else {
                w = Int(Double(currentUser.weight) / 2.2)
        }
        
        var t: String
        
        if themeChange.selectedSegmentIndex == 0 {
            t = "Day"
        }
        else {
            t = "Night"
        }
            
        idNO = PersistenceService.shared.count() + 1
        print(idNO)
        let stringInfo = [currentUser.fName, currentUser.lName, currentUser.email, currentUser.pswd, currentUser.gender, m, t]
        let numInfo = [currentUser.age, w]
    
        PersistenceService.shared.saveUser(idNO: idNO, stringInfo: stringInfo, numInfo: numInfo)
            
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
