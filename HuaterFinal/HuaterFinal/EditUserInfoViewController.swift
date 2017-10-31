//
//  EditUserInfoViewController.swift
//  HuaterFinal
//
//  Created by Michael Rukavina on 10/29/17.
//  Copyright © 2017 cs329E. All rights reserved.
//

import UIKit

class EditUserInfoViewController: UIViewController,  UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var fNameText: UITextField!
    @IBOutlet weak var lNameText: UITextField!
    @IBOutlet weak var gender: UISegmentedControl!
    @IBOutlet weak var weight: UITextField!
    @IBOutlet weak var metric: UISegmentedControl!
    @IBOutlet weak var nameTitle: UILabel!
    
    @IBOutlet weak var agePicker: UIPickerView!
    
    var ageData: [String] = [String]()
    var ageTmp: Int = 0
    var currentUser: appUser!
    var idNO: Int!
    
    @IBAction func saveEdit(_ sender: Any) {
        if emailText.text?.characters.count == 0 || fNameText.text?.characters.count == 0 || lNameText.text?.characters.count == 0 {
            let alert3 = UIAlertController(title: "Message",
                                           message: "You must enter a value for all fields" ,
                                           preferredStyle: UIAlertControllerStyle.alert)
            
            alert3.addAction(UIAlertAction(title: "OK",
                                           style: UIAlertActionStyle.default,
                                           handler: nil))
            
            //UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
            present(alert3, animated: true, completion: nil)
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
        
            idNO = currentUser.idNO
            let stringInfo = [self.fNameText.text!, self.lNameText.text!, self.emailText.text!, currentUser.pswd, g, m, currentUser.theme]
            let numInfo = [ageTmp, Int(self.weight.text!)!]
        
            PersistenceService.shared.editUser(idNO: idNO, stringInfo: stringInfo, numInfo: numInfo)
            currentUser = PersistenceService.shared.getUser(index: idNO-1)
            self.nameTitle.text = currentUser.fName + " " + currentUser.lName
        }
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.agePicker.delegate = self
        self.agePicker.dataSource = self
        
        for i in 1...100 {
            ageData.append("\(i)")
        }
        self.nameTitle.text = currentUser.fName + " " + currentUser.lName

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
        ageTmp = Int( ageData[row] )! + 1
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
