//
//  VerifyNumber.swift
//  emergencycallapp
//
//  Created by Hasan on 6/11/18.
//  Copyright © 2018 Axiom HK 13. All rights reserved.
//

import UIKit
import FirebaseAuth
let appdelegate = UIApplication.shared.delegate as! AppDelegate
class VerifyNumber: UIViewController ,UITextFieldDelegate{
var timer = Timer()
    var seconds=60
    
    @IBOutlet weak var numberlabel: UILabel!
    //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
    //tap.cancelsTouchesInView = false
    
    
    @IBOutlet weak var resendcodebutton: UIButton!
    
    @IBOutlet weak var NumberLabel: UILabel!
    @IBOutlet weak var requestcallbutton: UIButton!
    
    @IBOutlet weak var timelabel2: UILabel!
    @IBOutlet weak var timelabel1: UILabel!
    @IBOutlet weak var tf1: TextFieldDesign!
    @IBOutlet weak var tf2: TextFieldDesign!
    
    @IBOutlet weak var tf4: TextFieldDesign!
    @IBOutlet weak var tf3: TextFieldDesign!
    
    @IBOutlet weak var tf6: TextFieldDesign!
    @IBOutlet weak var tf5: TextFieldDesign!
    override func viewDidLoad() {
       
        NumberLabel.text=appdelegate.number
        
        timer=Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timelabelupdate), userInfo: nil, repeats: true)
        super.viewDidLoad()
        tf1.delegate=self
        tf2.delegate=self
        tf3.delegate=self
        tf4.delegate=self
        tf5.delegate=self
        tf6.delegate=self
        
        tf1.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
        tf2.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
        tf3.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
        tf4.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
        tf5.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
        tf6.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
     
        
        // Do any additional setup after loading the view.
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true;
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func userVerification(){
        let verificationID = UserDefaults.standard.string(forKey: "authVerificationID")!
        let verificationCode = "\(tf1.text!)\(tf2.text!)\(tf3.text!)\(tf4.text!)\(tf5.text!)\(tf6.text!)"
        
        let credential = PhoneAuthProvider.provider().credential(
            withVerificationID: verificationID,
            verificationCode: verificationCode)
        Auth.auth().signIn(with: credential) { (user, error) in
            if  error == nil {
                
                self.performSegue(withIdentifier: "numberverified", sender: nil)
       // return
            }
            else{
              let alert=UIAlertController(title: "Incorrect verification code", message: nil, preferredStyle: .alert)
                 alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            // User is signed in
            // ...
        }
        
        
        
    }
    var timestr = ""
    
    @objc func timelabelupdate(){
      
        seconds-=1
        if seconds == 0{
            timer.invalidate()
            resendcodebutton.isEnabled=true
            requestcallbutton.isEnabled=true
            
        }
        if seconds<10{
            timestr="00:0\(seconds)"
            
        }
        else{
              timestr="00:\(seconds)"
         
        }
        
        timelabel1.text=timestr
        timelabel2.text=timestr
      
        
        
        
    }
    
    @objc func textFieldDidChange (textField:UITextField)
    {
        let text = textField.text
        
        
        
        if text?.count == 1{
            switch textField {
            case tf1:
                //  textField1.borderRect(forBounds: <#T##CGRect#>) = .red
                
                
                tf2.becomeFirstResponder()
            case tf2:
                tf3.becomeFirstResponder()
            case tf3:
                tf4.becomeFirstResponder()
            case tf4:
                tf5.becomeFirstResponder()
            case tf5:
                tf6.becomeFirstResponder()
            case tf6:
                tf6.resignFirstResponder()
                userVerification()
                
                
                
            default:
                break
            }
        }
    }
    

    
    @IBAction func resendcode(_ sender: UIButton) {
        sender.isEnabled=false
        sendverificationcode()
        seconds=60
         timer=Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timelabelupdate), userInfo: nil, repeats: true)
        timer.fire()
    }
    func sendverificationcode(){
        PhoneAuthProvider.provider().verifyPhoneNumber(appdelegate.number, uiDelegate: nil) { (verificationID, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            // Sign in using the verificationID and the code sent to the user
            // ...
            UserDefaults.standard.set(verificationID, forKey: "authVerificationID")
            UserDefaults.standard.synchronize()            }
        
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


