//
//  ExpenseStore.swift
//  Digit
//
//  Created by Dylan on 5/28/17.
//  Copyright © 2017 Dylan. All rights reserved.
//

import Foundation

class ExpenseStore {
    var allExpenses = [Expense]()
    
    
    init(){
        for i in 0..<7{
            createDefaultExpenses(i: i)
        }
    }
    
    @discardableResult func createDefaultExpenses(i: Int) -> Expense {
        let expenses = ["Housing", "Cell Phone", "Utilities", "Auto Insurance","Food", "Netflix","Internet"];
        let prices = [600,90,50,106,240,9,60];
        
        
        let newExpense = Expense(testdata: true, expense: expenses[i], price: prices[i])
        
        allExpenses.append(newExpense)
        print(newExpense.expense)
        
        return newExpense
    }
}
