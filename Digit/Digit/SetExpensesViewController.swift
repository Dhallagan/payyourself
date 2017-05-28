//
//  File.swift
//  Digit
//
//  Created by Dylan on 5/25/17.
//  Copyright © 2017 Dylan. All rights reserved.
//

import UIKit

class SetExpensesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var loggedInUser = [String:Any]()
    @IBOutlet var expensesTableView: UITableView!
    var expenseStore: ExpenseStore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        expensesTableView.delegate = self
        expensesTableView.dataSource = self
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        expensesTableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return expenseStore.allExpenses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // cell coding
        let cell = expensesTableView.dequeueReusableCell(withIdentifier: "ExpenseCell", for: indexPath) as! ExpenseCell
        let expense = expenseStore.allExpenses[indexPath.row]
        
        cell.nameLabel.text = expense.expense
        cell.amountLabel.text = "$\(expense.valueInDollars)"
        
        return cell
    }
    
     func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // cell selected code here
    }
    
    @IBAction func showDashboard(_ sender: UIButton?){
        self.performSegue(withIdentifier: "showDashboard", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDashboard" {
            let expenseStore = ExpenseStore()
            let navigationViewController = segue.destination as? UINavigationController
            let setDashboardViewController = navigationViewController?.viewControllers.first as! DashboardViewController
            setDashboardViewController.loggedInUser = loggedInUser
//            setExpensesViewController.expenseStore = expenseStore
            
        }
    }
    
}
