//
//  DailyTrackerViewController.swift
//  HuaterFinal
//
//  Created by Michael Rukavina on 11/20/17.
//  Copyright © 2017 cs329E. All rights reserved.
//

import UIKit

class DailyTrackerViewController: UIViewController {

    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var percentLbl: UILabel!
    @IBOutlet weak var msgLbl: UILabel!
    
    var currentUser: appUser!
    var units: String = ""

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
        
        let date = Date()
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US")
        formatter.dateFormat = "MMMM d, yyyy"
        
        dateLbl.text = formatter.string(from: date)
        msgLbl.text = "Keep Drinking Water!"
        percentLbl.text = "0.0%"
        
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
        
        let date = Date()
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US")
        formatter.dateFormat = "MMMM d, yyyy"
        
        dateLbl.text = formatter.string(from: date)
        
        msgLbl.text = "Keep Drinking Water!"
        percentLbl.text = "0.0%"
        
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
