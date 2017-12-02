//
//  UserInfoViewController.swift
//  HuaterFinal
//
//  Created by Sergio Cardenas on 10/25/17.
//  Copyright © 2017 cs329E. All rights reserved.
//

import UIKit
import CoreData

class UserInfoViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var age: UIPickerView!
    @IBOutlet weak var gender: UISegmentedControl!
    @IBOutlet weak var weight: UITextField!
    @IBOutlet weak var metric: UISegmentedControl!    
    @IBOutlet weak var pswdLabel: UITextField!
    
    var ageData: [String] = [String]()
    var ageTmp: Int = 0
    
    @IBAction func createAccount(_ sender: Any) {
   
        if firstName.text!.characters.count == 0 || lastName.text!.characters.count == 0 || email.text!.characters.count == 0 || pswdLabel.text!.characters.count == 0 {
            let alert = UIAlertController(title: "Message",
                                          message: "You must enter a value for all fields" ,
                                          preferredStyle: UIAlertControllerStyle.alert)
            
            alert.addAction(UIAlertAction(title: "OK",
                                          style: UIAlertActionStyle.default,
                                          handler: nil))
            
            //UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
            present(alert, animated: true, completion: nil)
        }
            
        else {
            
            var m = ""
            if metric.selectedSegmentIndex == 0 {
                m = "Lbs"
            }
            else {
                m = "Kg"
            }
            
            var g = ""
            if gender.selectedSegmentIndex == 0 {
                g = "Male"
            }
            else {
                g = "Female"
            }
            
            let idNO = PersistenceService.shared.count() + 1
            let defaults = UserDefaults.standard
            defaults.set(idNO, forKey: "idNO")
            
            let stringInfo = [firstName.text!, lastName.text!,email.text!, pswdLabel.text!, g, m, "Day" ]
            let numInfo = [ageTmp, Int( weight.text!)!, 0]
            
            PersistenceService.shared.saveUser(idNO: idNO, stringInfo: stringInfo, numInfo: numInfo)
            
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PersistenceService.shared.fetchUsers()
        
        
        self.age.delegate = self
        self.age.dataSource = self
        
        for i in 1...100 {
            ageData.append("\(i)")
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ageData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ageData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        ageTmp = Int( ageData[row] )!
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
