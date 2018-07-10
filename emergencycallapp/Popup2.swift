//
//  Popup2.swift
//  emergencycallapp
//
//  Created by Hasan on 6/19/18.
//  Copyright © 2018 Axiom HK 13. All rights reserved.
//

import UIKit

class Popup2: UIViewController {
var timer = Timer()
    override func viewDidLoad() {
        super.viewDidLoad()
timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(timeToMoveOn), userInfo: nil, repeats: false)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func timeToMoveOn()  {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier :"home") as! ViewController
        self.present(viewController, animated: true)
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
