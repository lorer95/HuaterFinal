//
//  ShowUserInfoViewController.swift
//  HuaterFinal
//
//  Created by Michael Rukavina on 10/29/17.
//  Copyright © 2017 cs329E. All rights reserved.
//

import UIKit

class ShowUserInfoViewController: UIViewController {

    
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var fNameLabel: UILabel!
    @IBOutlet weak var lNameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var nameTitleLabel: UILabel!
    
    var idNO: Int!
    var currentUser: appUser!
    
    @IBAction func editClicked(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PersistenceService.shared.fetchUsers()
        let defaults = UserDefaults.standard
        let idNO = defaults.integer(forKey: "idNO")

        currentUser = PersistenceService.shared.getUser(index:  idNO )
        
        self.emailLabel.text = currentUser.email
        self.fNameLabel.text = currentUser.fName
        self.lNameLabel.text = currentUser.lName
        self.ageLabel.text = String( currentUser.age)
        self.genderLabel.text = currentUser.gender
        self.weightLabel.text = String( currentUser.weight ) + " " + currentUser.metric
        self.nameTitleLabel.text = currentUser.fName + " " + currentUser.lName
        

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
        self.emailLabel.text = currentUser.email
        self.fNameLabel.text = currentUser.fName
        self.lNameLabel.text = currentUser.lName
        self.ageLabel.text = String( currentUser.age)
        self.genderLabel.text = currentUser.gender
        self.weightLabel.text = String( currentUser.weight ) + " " + currentUser.metric
        self.nameTitleLabel.text = currentUser.fName + " " + currentUser.lName
  
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
            let vc = segue.destination as! EditUserInfoViewController
            
            vc.currentUser = currentUser
            
            let backItem = UIBarButtonItem()
            backItem.title = "Back"
            navigationItem.backBarButtonItem = backItem
        
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
