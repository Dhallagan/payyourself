//
//  File.swift
//  Digit
//
//  Created by Dylan on 4/28/17.
//  Copyright © 2017 Dylan. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    var loggedInUser = [String:Any]()
    @IBOutlet var nickName: UILabel!
    @IBOutlet var accessToken: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()
        print(loggedInUser)
        nickName.text = loggedInUser["name"] as! String
//        accessToken.text = loggedInUser.plaidAccessKey as
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
}
