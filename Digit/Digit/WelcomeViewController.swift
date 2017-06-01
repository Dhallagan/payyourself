//
//  WelcomeViewController.swift
//  Digit
//
//  Created by Dylan on 5/28/17.
//  Copyright © 2017 Dylan. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    var loggedInUser = User()
    
    @IBAction func showSetExpenses(_ sender: UIButton?){
        self.performSegue(withIdentifier: "showSetExpenses", sender: self)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                if segue.identifier == "showSetExpenses" {
                    let expenseStore = ExpenseStore()
                    let setExpensesViewController = segue.destination as! SetExpensesViewController
                    setExpensesViewController.loggedInUser = loggedInUser
                    setExpensesViewController.expenseStore = expenseStore
                    
                }
    }
}
