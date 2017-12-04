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
        var waterReq: Double = 0
        var percentLeft: Double = 0
        
        
        currentUser = PersistenceService.shared.getUser(index:  idNO-1)
        if currentUser.theme == "Night" {
            self.view.backgroundColor = UIColor.lightGray
        }
        else {
            self.view.backgroundColor = UIColor.white
        }
        
        if currentUser.metric == "Kg" {
            units = "mL"
            waterReq = Double(currentUser.weight)*45.5318 - 118.28
        }
        else {
            units = "oz"
            waterReq = 0.7*Double(currentUser.weight) - 4
        }
        
        let date = Date()
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US")
        formatter.dateFormat = "MMMM d, yyyy"
        
        dateLbl.text = formatter.string(from: date)
        
        percentLeft = Double(currentUser.water)/waterReq
        percentLbl.text = String(round(percentLeft*1000)/10) + "%"
        
        if(percentLeft < 1){
            msgLbl.text = "Keep Drinking Water!"
        }
        else{
            msgLbl.text = "You're Done for the Day!"
        }
    
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
      
        PersistenceService.shared.fetchUsers()
        let defaults = UserDefaults.standard
        let idNO = defaults.integer(forKey: "idNO")
        var waterReq: Double = 0
        var percentLeft: Double = 0
        
        
        currentUser = PersistenceService.shared.getUser(index:  idNO-1)
        if currentUser.theme == "Night" {
            self.view.backgroundColor = UIColor.lightGray
        }
        else {
            self.view.backgroundColor = UIColor.white
        }
        
        if currentUser.metric == "Kg" {
            units = "mL"
            waterReq = Double(currentUser.weight)*45.5318 - 118.28
        }
        else {
            units = "oz"
            waterReq = 0.7*Double(currentUser.weight) - 4
        }
        
        let date = Date()
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US")
        formatter.dateFormat = "MMMM d, yyyy"
        
        dateLbl.text = formatter.string(from: date)
        
        percentLeft = Double(currentUser.water)/waterReq
        percentLbl.text = String(round(percentLeft*1000)/10) + "%"
        
        if(percentLeft < 1){
            msgLbl.text = "Keep Drinking Water!"
        }
        else{
            msgLbl.text = "You're Done for the Day!"
        }
        
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
