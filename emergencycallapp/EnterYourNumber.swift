//
//  EnterYourNumber.swift
//  
//
//  Created by Hasan on 6/11/18.
//

import UIKit
import CountryPickerView
import FirebaseAuth

class EnterYourNumber: UIViewController   {
    @IBOutlet weak var phoneNumberField: UITextField!
    let appdelegate = UIApplication.shared.delegate as! AppDelegate
    let cpv = CountryPickerView(frame: CGRect(x: 0, y: 0, width: 120, height: 20))
    override func viewDidLoad() {
        super.viewDidLoad()
         self.hideKeyboardWhenTappedAround() 
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
  
        phoneNumberField.leftView = cpv
        phoneNumberField.leftViewMode = .always

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func ContinueWithNumber(_ sender: Any) {
        if (phoneNumberField.text == "")   {
            
            print("Error")
            let alert = UIAlertController(title: "Error ", message: "Required Phone Number", preferredStyle: UIAlertControllerStyle.alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            
            self.present(alert, animated: true,completion: nil)
        }
        else if (self.phoneNumberField.text?.count)! > 10 {
            let alert = UIAlertController(title: "Number is Too Big ", message: "Please correct your number ", preferredStyle: .alert)
            let okay = UIAlertAction(title: "Okay", style: .cancel, handler: nil)
            alert.addAction(okay)
            self.present(alert, animated: true, completion: nil)
            
        }
        else if (self.phoneNumberField.text?.count)! < 10 {
            let alert = UIAlertController(title: "Number is Too Short ", message: "Please correct your number ", preferredStyle: .alert)
            let okay = UIAlertAction(title: "Okay", style: .cancel, handler: nil)
            alert.addAction(okay)
            self.present(alert, animated: true, completion: nil)
            
        }
            
            
        else {
        let alert = UIAlertController(title: "Is this your correct mobile number?", message: "\(self.cpv.selectedCountry.phoneCode)\(phoneNumberField.text!)", preferredStyle: .alert)
        self.present(alert, animated: true, completion: nil)
        
        alert.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.default, handler:{ (action) in
            alert.dismiss(animated: true, completion: nil)
            self.appdelegate.number = "\(self.cpv.selectedCountry.phoneCode)\(self.phoneNumberField.text!)"
             self.performSegue(withIdentifier: "NumberConfirmed", sender: nil)
            sendverificationcode()
        }))
        
        alert.addAction( UIAlertAction(title: "Edit", style: .default, handler: {
                (action) in alert.dismiss(animated: true, completion: nil)
                
            }
            ))
            
          
            
            
            
            
            
            
        
            
       
              
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
    
}
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
