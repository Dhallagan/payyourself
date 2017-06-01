//
//  TransactionsViewController.swift
//  Digit
//
//  Created by Dylan on 4/18/17.
//  Copyright © 2017 Dylan. All rights reserved.
//

import UIKit

class TransactionsViewController: UITableViewController {
    var transactionStore: TransactionStore!
    var loggedInUser = User()
    
    
    override func viewDidLoad() {
        
        //tableView.rowHeight = UITableViewAutomaticDimension
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 65
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
      return transactionStore.allTransactions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Create instance of UITableViewCell, with default appearance
        let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionCell", for: indexPath) as! TransactionCell
        
        //Set the cell with the name of the store
        let transaction = transactionStore.allTransactions[indexPath.row]
        
        
        cell.nameLabel.text = transaction.name
        cell.categoryLabel.text = transaction.category
        cell.amountLabel.text = "$\(transaction.amount)"
        
        return cell
    }
}
