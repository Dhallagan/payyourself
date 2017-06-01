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
//    var userID: String   //A unique ID that is used to persist data about the user to the database (Firebase).
    var bearerToken: String
    var accessToken: String
    var expenses = [Expense]()
    var goals = [Goal]()
    
    init(){
        self.firstName = ""
        self.lastName = ""
        self.email = ""
        self.bearerToken = ""
        self.accessToken = ""
    }
    
    init(firstName: String, lastName: String, email:String, bearerToken: String, accessToken:String){
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.bearerToken = bearerToken
        self.accessToken = accessToken
    }
    
    func setUser(firstName: String, email:String, bearerToken: String, accessToken: String){
        self.firstName = firstName
        self.lastName = ""
        self.email = email
        self.bearerToken = bearerToken
        self.accessToken = accessToken
    }

    
    func setGoals(goal: String, amount: Int){
        
    }
    
    func getGoals(){
    
    }
    
    func printUser(){
        print("First Name: \(self.firstName)")
        print("Email: \(self.email)")
        print("Bearer Token: \(self.bearerToken)")
        print("Access Token: \(self.accessToken)")
    }
    
    
}

