//
//  NewsViewController.swift
//  HuaterFinal
//
//  Created by Michael Rukavina on 12/2/17.
//  Copyright © 2017 cs329E. All rights reserved.
//

import UIKit


class NewsViewController: UIViewController {

    
    var currentUser: appUser!
    
    @IBOutlet weak var ButtonA: UIButton!
    @IBOutlet weak var ButtonB: UIButton!
    @IBOutlet weak var ButtonC: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = UserDefaults.standard
        let idNO = defaults.integer(forKey: "idNO")
        currentUser = PersistenceService.shared.getUser(index: idNO-1)
        
        if currentUser.theme == "Night" {
            self.view.backgroundColor = UIColor.lightGray
           
        }
        else {
            self.view.backgroundColor = UIColor.white
            
        }
        
        if currentUser.news == "Medical News Today" {
            ButtonA.setTitle("Eating cheese every day may help to protect heart health", for: .normal)
            ButtonB.setTitle("BMI: A double-edged sword in your risk of dementia", for: .normal)
            ButtonC.setTitle("What you should know about biotin-rich foods", for: .normal)

        }
        else {
            ButtonA.setTitle("How to Actually Stay Healthy This Month—Without Depriving Yourself", for: .normal)
            ButtonB.setTitle("How Long Should I Wait After a Cold to Hang Out with People Again?", for: .normal)
            ButtonC.setTitle("Treadmills Were Invented to Punish Prisoners (and We Totally Get Why)", for: .normal)

        

        // Do any additional setup after loading the view.
    }
    
    func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let defaults = UserDefaults.standard
        let idNO = defaults.integer(forKey: "idNO")
        currentUser = PersistenceService.shared.getUser(index: idNO-1)
        
        if currentUser.theme == "Night" {
            self.view.backgroundColor = UIColor.lightGray
            
        }
        else {
            self.view.backgroundColor = UIColor.white
            
        }
        
        if currentUser.news == "Medical News Today" {
            ButtonA.setTitle("Eating cheese every day may help to protect heart health", for: .normal)
            ButtonB.setTitle("BMI: A double-edged sword in your risk of dementia", for: .normal)
            ButtonC.setTitle("What you should know about biotin-rich foods", for: .normal)
            
        }
        else {
            ButtonA.setTitle("How to Actually Stay Healthy This Month—Without Depriving Yourself", for: .normal)
            ButtonB.setTitle("How Long Should I Wait After a Cold to Hang Out with People Again?", for: .normal)
            ButtonC.setTitle("Treadmills Were Invented to Punish Prisoners (and We Totally Get Why)", for: .normal)
        }

        
    }

    func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
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
