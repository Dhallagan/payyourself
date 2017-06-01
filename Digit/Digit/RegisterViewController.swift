//
//  RegisterViewController.swift
//  Digit
//
//  Created by Dylan on 5/2/17.
//  Copyright © 2017 Dylan. All rights reserved.
//


import UIKit
import Alamofire

class RegisterViewController: UIViewController {
    
    @IBOutlet var name: UITextField!
    @IBOutlet var email: UITextField!
    @IBOutlet var password: UITextField!
    @IBOutlet var confirmPassword: UITextField!
    
//    var loggedInUser = [String:Any]()
    var loggedInUser = User()
    
    func exit() {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func register(_ sender: AnyObject) {
        // Code for registering the user
        print("\(password.text!)  \(confirmPassword.text!)")
        if(password.text! != confirmPassword.text!){
            let alertController = UIAlertController(title: "Registration", message:
                "Passwords do not match", preferredStyle: UIAlertControllerStyle.alert)
            
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
            self.present(alertController, animated: true, completion: nil)
        } else {
            
            var email2 = email.text!
            var password2 = password.text!
                PayYourselfAPI.shared.registerPost(name: name.text!, email: email.text!, password: password.text! ) { (userInfo, error)   in
            
                if(userInfo != nil){
                    PayYourselfAPI.shared.loginPost(email: email2, password: password2 ) { (userInfo, error) in
                        
                        if(userInfo != nil){
                            debugPrint(userInfo)
                            self.loggedInUser = userInfo as! User
                            
                            self.performSegue(withIdentifier: "showLinkAccounts", sender: self)
                        } else {
                            print("Here: \(error)")
                            
                            let alertController = UIAlertController(title: "Registration", message:
                                "Invalid username or password", preferredStyle: UIAlertControllerStyle.alert)
                            
                            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
                            self.present(alertController, animated: true, completion: nil)
                            
                        }
                    }
                } else {
                    print(error)
                
                }
            }
        }
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        email.resignFirstResponder()
        email.resignFirstResponder()
        password.resignFirstResponder()
        confirmPassword.resignFirstResponder()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showLinkAccounts" {
            
            let linkAccountsViewController = segue.destination as! LinkAccountsViewController
            linkAccountsViewController.loggedInUser = loggedInUser
        }
    }
}
