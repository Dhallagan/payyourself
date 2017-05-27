//
//  TransactionsStore.swift
//  Digit
//
//  Created by Dylan on 4/18/17.
//  Copyright © 2017 Dylan. All rights reserved.
//

import UIKit

class TransactionStore {
    var allTransactions = [Transaction]()
    
    init(){
        for _ in 0..<25{
            createTransaction()
        }
    }
    
    @discardableResult func createTransaction() -> Transaction {
        let newTransaction = Transaction(random: true)
        
        allTransactions.append(newTransaction)
        
        return newTransaction
    }
}
