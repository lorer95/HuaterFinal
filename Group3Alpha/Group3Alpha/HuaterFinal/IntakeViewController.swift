//
//  IntakeViewController.swift
//  HuaterFinal
//
//  Created by Michael Rukavina on 11/20/17.
//  Copyright © 2017 cs329E. All rights reserved.
//

import UIKit

class IntakeViewController: UIViewController {
    @IBOutlet weak var stepperBtm: UIStepper!
    @IBOutlet weak var intakeLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var saveDataBtn: UIButton!
    
    var currentUser: appUser!
    var i: Double = 0
    var units: String = ""
    
    @IBAction func steppedBtn(_ sender: Any) {
        i = stepperBtm.value/2
        
        intakeLbl.text = String(i) + " " + units
    }
    
    
    @IBAction func saveBtnClicked(_ sender: Any) {
        
        
        let alert = UIAlertController(title: "Success!",
                                      message: "Your water intake have been saved" ,
                                      preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK",
                                      style: UIAlertActionStyle.default,
                                      handler: nil))
        
        present(alert, animated: true, completion: nil)
        
        stepperBtm.value = 0
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        PersistenceService.shared.fetchUsers()
        let defaults = UserDefaults.standard
        let idNO = defaults.integer(forKey: "idNO")
        
        currentUser = PersistenceService.shared.getUser(index:  idNO-1)
        if currentUser.theme == "Night" {
            self.view.backgroundColor = UIColor.lightGray
        }
        else {
            self.view.backgroundColor = UIColor.white
        }
        
        if currentUser.metric == "Kg" {
            units = "mL"
        }
        else {
            units = "oz"
        }
        
        stepperBtm.maximumValue = 1000*1000
        stepperBtm.minimumValue = 0
        
        let date = Date()
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US")
        formatter.dateFormat = "MMMM d, yyyy"
        
        dateLbl.text = formatter.string(from: date)
        
        
        // Do any additional setup after loading the view.
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        PersistenceService.shared.fetchUsers()
        let defaults = UserDefaults.standard
        let idNO = defaults.integer(forKey: "idNO")
        
        currentUser = PersistenceService.shared.getUser(index:  idNO-1)
        if currentUser.theme == "Night" {
            self.view.backgroundColor = UIColor.lightGray
        }
        else {
            self.view.backgroundColor = UIColor.white
        }
        
        if currentUser.metric == "Kg" {
            units = "mL"
        }
        else {
            units = "oz"
        }
        
        intakeLbl.text = "0 " + units
        stepperBtm.value = 0
        
        stepperBtm.maximumValue = 1000*1000
        stepperBtm.minimumValue = 0
        
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
