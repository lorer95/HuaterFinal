//
//  LogInViewController.swift
//  HuaterFinal
//
//  Created by Michael Rukavina on 10/29/17.
//  Copyright © 2017 cs329E. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {

    @IBOutlet weak var emailText: UITextField!
    
    @IBOutlet weak var pswrdText: UITextField!
    var idNO: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        PersistenceService.shared.fetchUsers()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tryLogin(_ sender: Any) {
        
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "loginSegue" {
            if( PersistenceService.shared.isUser(email: emailText.text!, pswd: pswrdText.text! )) {
                idNO = PersistenceService.shared.getSignedInUser(email: emailText.text!, pswdText: pswrdText.text!).idNO

                return true
            }
            let alert2 = UIAlertController(title: "Incorrect Login",
                                           message: "Please Enter Correct Information" ,
                                           preferredStyle: UIAlertControllerStyle.alert)
            
            alert2.addAction(UIAlertAction(title: "OK",
                                           style: UIAlertActionStyle.default,
                                           handler: nil))
            
            //UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
            present(alert2, animated: true, completion: nil)
            return false
        }
        return true
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "loginSegue" {
            let pt = segue.destination as! MyViewController
            pt.idNO = idNO
        }
    
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
