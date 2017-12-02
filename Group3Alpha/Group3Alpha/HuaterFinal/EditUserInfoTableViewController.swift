//
//  EditUserInfoTableViewController.swift
//  HuaterFinal
//
//  Created by Michael Rukavina on 11/9/17.
//  Copyright © 2017 cs329E. All rights reserved.
//

import UIKit

class EditUserInfoTableViewController: UITableViewController {

    var currentUser: appUser!
    var infoEditStr: [String]!
    var infoEditNum: [Int]!
    var infoTitles: [String]!
    var infoEdit: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        PersistenceService.shared.fetchUsers()
        let defaults = UserDefaults.standard
        let idNO = defaults.integer(forKey: "idNO")
        
        currentUser = PersistenceService.shared.getUser(index: idNO-1)
        
        if currentUser.theme == "Night" {
            self.view.backgroundColor = UIColor.lightGray
        }
        else {
            self.view.backgroundColor = UIColor.white
        }
        
        self.title = currentUser.fName + " " + currentUser.lName
        
        infoEdit = [currentUser.fName, currentUser.lName, currentUser.pswd, currentUser.gender, String(currentUser.age), String(currentUser.weight) ]
        infoTitles = ["First Name", "Last Name", "Password", "Gender", "Age", "Weight"]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return infoEdit.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell_id", for: indexPath)
        
        cell.textLabel?.text = infoTitles[indexPath.row]
        cell.detailTextLabel?.text = infoEdit[indexPath.row]
        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let alert = UIAlertController(title: "Edit Information",
                                      message: infoEdit[indexPath.row] ,
                                      preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addTextField(configurationHandler: {(textField : UITextField!) -> Void in
        })
        
        alert.addAction(UIAlertAction(title: "Save", style: UIAlertActionStyle.default) { action -> Void in
            let txt = (alert.textFields?.first?.text)!
     
            if (txt == "") {
                // Do Nothing
            }
            else if( indexPath.row >= self.infoEdit.count-2 ){
                if( Int( txt ) != nil) {
                    self.infoEdit[indexPath.row] = txt
                }
                else {
                    self.infoEdit[indexPath.row] = "0"
                }
            }
            else{
                self.infoEdit[indexPath.row] = txt
                if( indexPath.row == 3 ) {
                    if( txt == "Male" || txt == "male" || txt == "m" || txt == "M"){
                        self.infoEdit[indexPath.row] = "Male"
                    }
                    else if(txt == "Female" || txt == "female" || txt == "f" || txt == "F"){
                        self.infoEdit[indexPath.row] = "Female"
                    }
                    else {
                        self.infoEdit[indexPath.row] = self.currentUser.gender
                    }
                }
            }
            
            let stringInfo = [self.infoEdit[0], self.infoEdit[1], self.currentUser.email, self.infoEdit[2], self.infoEdit[3], self.currentUser.metric, self.currentUser.theme]
            
            let numInfo = [ Int(self.infoEdit[4]) , Int(self.infoEdit[5]), self.currentUser.water,]
            
            PersistenceService.shared.editUser(idNO: self.currentUser.idNO, stringInfo: stringInfo, numInfo: numInfo as! [Int])
            
            self.currentUser = PersistenceService.shared.getUser(index: self.currentUser.idNO)
            self.tableView.reloadData()
        
        })
        
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: nil))
        
        present(alert, animated: true, completion: nil)
        
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
