//
//  File.swift
//  Digit
//
//  Created by Dylan on 4/28/17.
//  Copyright © 2017 Dylan. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    var loggedInUser = User()
    
    @IBOutlet var nickName: UILabel!
    @IBOutlet var accessToken: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()
        loggedInUser.printUser()
        nickName.text = loggedInUser.firstName
        //        accessToken.text = loggedInUser.plaidAccessKey as
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
}
