//
//  Expense.swift
//  Digit
//
//  Created by Dylan on 5/25/17.
//  Copyright © 2017 Dylan. All rights reserved.
//

import Foundation

class Expense: NSObject {
        var expense: String
        var valueInDollars: Int
        var dateCreated: Date

    init(expense: String, valueInDollars: Int) {
        self.expense = expense
        self.valueInDollars = valueInDollars
        self.dateCreated = Date()
        super.init()
    }
    
    convenience init(testdata: Bool = false, expense: String, price: Int) {
        if testdata {
           self.init(expense: expense, valueInDollars: price);
        } else {
            self.init(expense: "", valueInDollars: 0);
        }
    }
}
