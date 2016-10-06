//
//  ViewController.swift
//  PSTextFieldDemo
//
//  Created by Pawan Kumar Singh on 14/08/14.
//  Copyright (c) 2014 Pawan Kumar Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, PSTextFieldDelegate {

    // MARK: Properties
    @IBOutlet weak var usernameTxtFld: PSTextField!
    @IBOutlet weak var passwordTxtFld: PSTextField!
    @IBOutlet weak var firstNameTxtFld: PSTextField!
    @IBOutlet weak var lastNameTxtFld: PSTextField!
    @IBOutlet weak var emailTxtFld: PSTextField!

    
    // Mark: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        usernameTxtFld.dataValidationType = .userName
        passwordTxtFld.dataValidationType = .password
        firstNameTxtFld.dataValidationType = .firstName
        lastNameTxtFld.dataValidationType = .lastName
        emailTxtFld.dataValidationType = .email
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: PSTextFieldDelegate
    
    func textFieldShouldReturn(_ textField: PSTextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }

    func textFieldDidEndEditing(_ textField: PSTextField){
        textField.validateInput()
    }

}

