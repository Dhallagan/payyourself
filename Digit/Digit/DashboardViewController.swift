//
//  ViewController.swift
//  Digit
//
//  Created by Dylan on 4/17/17.
//  Copyright © 2017 Dylan. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {
    var loggedInUser = User()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let image = UIImage(named: "test")
        navigationItem.titleView = UIImageView(image: image)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue:UIStoryboardSegue, sender: Any?) {
        //If the triggered segue is the "showTransactions" segue
        switch segue.identifier {
        case "showTransactions"?:
                //View Transaction Button was tapped
                //Get transactions and pass it along
            
            let transactionStore = TransactionStore()
            let transactionsController = segue.destination as! TransactionsViewController
            transactionsController.transactionStore = transactionStore
            
        case "showProfile"?:
            //View Transaction Button was tapped
            //Get transactions and pass it along
            
           
            let profileViewController = segue.destination as! ProfileViewController

            profileViewController.loggedInUser = loggedInUser
            
        default:
            preconditionFailure("Unexpected Segue Identifier")
        }
    }
}

