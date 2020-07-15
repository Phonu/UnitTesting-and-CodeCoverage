//
//  ViewController.swift
//  UnitTestingDemo
//
//  Created by mac admin on 14/07/20.
//  Copyright © 2020 Kunal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var userName:UITextField!
    @IBOutlet weak var password : UITextField!
    
    private let dummyDataBase = [User(username: "kunal", password: "Quest")]
    
    private let validation:ValidationService
    
    init(validation:ValidationService) {
        self.validation = validation
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        self.validation = ValidationService()
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func loginAction(_ sender: UIButton) {
        do {
            let username = try validation.validateUserName(userName.text)
            
            //Login to database....
            if let user = dummyDataBase.first(where:{ user in
                user.username == username
            }) {
                print("successfully login \(user.username!)")
            } else {
                throw LoginError.invalidCredentials
            }
        } catch {
            print(error)
         }
     
        
    }


}

extension ViewController {
    enum LoginError: LocalizedError {
        case invalidCredentials
        
        var errorDescription: String? {
            switch self {
            case .invalidCredentials:
                return "credential is invalid"
            }
        }
    }
}

struct User {
    var username:String?
    var password:String?
}

