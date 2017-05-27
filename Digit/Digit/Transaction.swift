//
//  Transaction.swift
//  Digit
//
//  Created by Dylan on 4/18/17.
//  Copyright © 2017 Dylan. All rights reserved.
//

import UIKit

class Transaction: NSObject {
    var name: String
    var amount: Int
    var category: String
    var date: Date
    
    init(name: String, category: String, amount: Int){
        self.name = name
        self.amount = amount
        self.category = category
        self.date = Date()
        
        super.init()
    }
    
    convenience init(random: Bool = false) {
        if random{
            
            let stores = ["Apple", "Sweetgreen","Umami Burger", "Chipotle", "Wegmans", "Sunoco", "Getty Mart", "Starbucks"]
            let categories = ["Electronics", "Resturaunts", "Restaurant", "Restaurant", "Groceries", "Gas", "Gas", "Restaurant"]
            
            let idx = arc4random_uniform(UInt32(stores.count))
            let store = stores[Int(idx)]
            let category = categories[Int(idx)]
            
            let randomValue = Int(arc4random_uniform(100))
            
            self.init(name:store,
                      category: category,
                      amount: randomValue)
        } else {
            self.init(name: "", category: "", amount: 0)
        }
    }


}
