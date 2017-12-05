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
    
    @IBAction func website1(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://www.medicalnewstoday.com/articles/320249.php")! as URL, options: [:], completionHandler: nil)
    }
    
    @IBAction func website2(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://www.medicalnewstoday.com/articles/320242.php")! as URL, options: [:], completionHandler: nil)
    }
    
    @IBAction func website3(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://www.medicalnewstoday.com/articles/320242.php")! as URL, options: [:], completionHandler: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        
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
