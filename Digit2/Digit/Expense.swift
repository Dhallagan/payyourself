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
    
//    convenience init(random: Bool = false) {
//        let standardExpenses = [["Rent", 0],
//                                ["Phone", 0],
//                                ["Car Insurance", 0],
//                                ["Student Loans",0],
//                                ["Food", 0],
//                                ["Gas",0]]
//        
//        self.init(name: randomName, serialNumber: randomSerialNumber, valueInDollars: randomValue)
//        } else {
//        self.init(name: "", serialNumber: nil, valueInDollars: 0)
//        }
}
