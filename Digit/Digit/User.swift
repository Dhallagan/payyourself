//
//  User.swift
//  Digit
//
//  Created by Dylan on 5/7/17.
//  Copyright © 2017 Dylan. All rights reserved.
//

import Foundation

class User {
    var firstName: String
    var lastName: String
    var email: String
    var userID: String   //A unique ID that is used to persist data about the user to the database (Firebase).
    var accessToken: String
    var expenses = [Expense]()
    var goals = [Goal]()
    
    init(firstName: String, lastName: String, email:String, userID: String, accessToken:String){
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.userID = userID
        self.accessToken = accessToken
    }
    
    func addGoal(goal: String, amount: Int){
        
    }
}
