//
//  ViewController2.swift
//  emergencycallapp
//
//  Created by Axiom HK 13 on 01/05/2018.
//  Copyright © 2018 Axiom HK 13. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    var timer=Timer()
    @IBOutlet weak var imageview: UIImageView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url =  "http://icon-park.com/imagefiles/loading7_white.gif"
       let imageurl = UIImage.gifImageWithURL(url)
        print("gigigigigi")
        print(imageurl)
        imageview.image=imageurl!
        
        timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(timeToMoveOn), userInfo: nil, repeats: false)

       
        //view.addSubview(imageView3)
        // Do any additional setup  loading the view.
    }
    @objc func timeToMoveOn(){
        
        self.performSegue(withIdentifier: "go", sender: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

 
    @IBAction func CancelButtonPressed(_ sender: Any) {
self.dismiss(animated: true, completion: nil)
   
        
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
