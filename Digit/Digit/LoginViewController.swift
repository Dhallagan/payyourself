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
    
    var loggedInUser = User()
    
    
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
                self.loggedInUser.setUser(firstName: userInfo.firstName as! String!,
                                          email: userInfo.email as! String!,
                                          bearerToken: userInfo.bearerToken as! String!,
                                          accessToken: "" as! String
                )
                self.performSegue(withIdentifier: "showDashboard", sender: self)
            } else {
                print("Here: \(error)")
                
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
        if segue.identifier == "showDashboard" {
            
            let navigationViewController = segue.destination as? UINavigationController
            let setDashboardViewController = navigationViewController?.viewControllers.first as! DashboardViewController
            setDashboardViewController.loggedInUser = loggedInUser
            print("Login View User:")
            print(loggedInUser)
            //            setExpensesViewController.expenseStore = expenseStore
            
        }
    }
    
    
}

