//
//  Goal.swift
//  Digit
//
//  Created by Dylan on 5/25/17.
//  Copyright © 2017 Dylan. All rights reserved.
//

import UIKit

class Goal: NSObject {
    var goal: String
    var valueInDollars: Int
    var dateCreated: Date
    
    
    init(goal: String, valueInDollars: Int) {
        self.goal = goal
        self.valueInDollars = valueInDollars
        self.dateCreated = Date()
        super.init()
    }
}
