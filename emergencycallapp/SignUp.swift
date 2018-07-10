//
//  SignUp.swift
//  emergencycallapp
//
//  Created by Hasan on 6/12/18.
//  Copyright © 2018 Axiom HK 13. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class SignUp: UIViewController {
var gender=""
    
    let datePicker = UIDatePicker()
    
    @IBOutlet var check: [UIButton]!
    
    
    @IBOutlet weak var FirstNametf: TextFieldDesign2!
    
    @IBOutlet weak var datetf: TextFieldDesign2!
    
    @IBOutlet weak var LastNametf: TextFieldDesign2!
    
    
    @IBOutlet weak var Emailtf: TextFieldDesign2!
    
    @IBOutlet weak var DOBtf: TextFieldDesign2!
    override func viewDidLoad() {
        super.viewDidLoad()
showDatePicker()
        // Do any additional setup after loading the view.
    }

    
    func uncheckAllButtons(){
        for btn in check{
            btn.isSelected = false
        }
    }

    @IBAction func BTnCheck(_ sender: UIButton) {
        self.uncheckAllButtons()
        
        sender.isSelected = true
        
        if sender.tag == 0 {
            self.gender = "Male"
            print("Male")
        }
        
        if sender.tag == 1 {
            self.gender = "Female"
            print("Female")
        }
        
        
    }
    func showDatePicker(){
        //Formate Date
        datePicker.datePickerMode = .date
        
        //ToolBar
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));
        
        toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
        
        datetf.inputAccessoryView = toolbar
        datetf.inputView = datePicker
        
    }
    
    @objc func donedatePicker(){
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        datetf.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    @objc func cancelDatePicker(){
        self.view.endEditing(true)
    }

    
    
    @IBAction func SignUp(_ sender: Any) {
        
        if (FirstNametf.text == "")   {
            
            print("Error")
            let alert = UIAlertController(title: "Error ", message: "First Name Required", preferredStyle: UIAlertControllerStyle.alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            
            self.present(alert, animated: true,completion: nil)
        }
            
        else if (LastNametf.text == "")   {
            let alert = UIAlertController(title: "Error", message: "Last Name Required", preferredStyle: UIAlertControllerStyle.alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            
            self.present(alert, animated: true,completion: nil)
        }
            
            
        else if (Emailtf.text == "")   {
            let alert = UIAlertController(title: "Error", message: "Email Required", preferredStyle: UIAlertControllerStyle.alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            
            self.present(alert, animated: true,completion: nil)
        }
            
        else if (DOBtf.text == "")   {
            let alert = UIAlertController(title: "Error", message: "Date Of Birth Required", preferredStyle: UIAlertControllerStyle.alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            
            self.present(alert, animated: true,completion: nil)
        }
            
        else if (gender == "")   {
            let alert = UIAlertController(title: "Error", message: "Select your gender", preferredStyle: UIAlertControllerStyle.alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            
            self.present(alert, animated: true,completion: nil)
        }
        else{

            let tempuser=User(FirstName: FirstNametf.text!, LastName: LastNametf.text!, DateOfBirth: DOBtf.text!, Email: Emailtf.text!, Gender: gender )
            var ref = Database.database().reference()
            ref.child("Users").childByAutoId().setValue(["FirstName":FirstNametf.text!,"LastName":LastNametf.text!,"Email":Emailtf.text!,"Gender":gender,"Date Of Birth":DOBtf.text!])
            UserDefaults.standard.set(FirstNametf.text!, forKey: "username")
            UserDefaults.standard.set(appdelegate.number, forKey: "contact")
           
            self.performSegue(withIdentifier: "SignUp", sender: nil)
            
            
        }
        
        
        
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
