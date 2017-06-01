//
//  LoginViewController.swift
//  Digit
//
//  Created by Dylan on 5/1/17.
//  Copyright © 2017 Dylan. All rights reserved.
//


import UIKit
import Alamofire

class LoginViewController: UIViewController {
    
    @IBOutlet var email: UITextField!
    @IBOutlet var password: UITextField!
    @IBOutlet var msg: UILabel!
    
    var loggedInUser = [String:Any]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func login(_ sender: UIButton){
        login()
    }
    
    func login() {
        
        PayYourselfAPI.shared.loginPost(email: email.text!, password: password.text! ) { (userInfo, error) in
            
            if(userInfo != nil){
                debugPrint(userInfo)
                self.loggedInUser = userInfo as! [String: Any]
                
                self.performSegue(withIdentifier: "showDashboard", sender: self)
            } else {
                print("Here: \(error)")
                
                //               var errorMessages = String()
                //                for i in 0...error!.count-1 {
                //
                //
                //                    var messages = error![i]["msg"]
                //                        errorMessages.append("\(messages)\n")
                //
                //                }
                let alertController = UIAlertController(title: "Login", message:
                    "Invalid username or password", preferredStyle: UIAlertControllerStyle.alert)
                
                alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
                self.present(alertController, animated: true, completion: nil)
                
            }
        }
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        email.resignFirstResponder()
        password.resignFirstResponder()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "showDashboard" {
//            
//            let dashboardViewController = segue.destination as! DashboardViewController
//            dashboardViewController.loggedInUser = loggedInUser
//        }
    }
    
    
}

