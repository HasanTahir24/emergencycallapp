//
//  FirstScreen.swift
//  emergencycallapp
//
//  Created by Hasan on 6/25/18.
//  Copyright © 2018 Axiom HK 13. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase
import GoogleMaps
class FirstScreen: UIViewController {
let appdelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
appdelegate.status=1
        var ref=Database.database().reference()
        
        
       // ref.child("Calls").childByAutoId().setValue(["Patient Name":UserDefaults.standard.string(forKey: "username")!,"Contact":UserDefaults.standard.string(forKey: "contact")!,"Distance":100,"Time":"34 mins"])
        // Do any additional setup after loading the view.
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
