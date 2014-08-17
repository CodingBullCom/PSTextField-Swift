//
//  ViewController.swift
//  PSTextFieldDemo
//
//  Created by Pawan Kumar Singh on 14/08/14.
//  Copyright (c) 2014 Pawan Kumar Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

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
        usernameTxtFld.dataValidationType = .PSDataValidationTypeUserName
        passwordTxtFld.dataValidationType = .PSDataValidationTypePassword
        firstNameTxtFld.dataValidationType = .PSDataValidationTypeFirstName
        lastNameTxtFld.dataValidationType = .PSDataValidationTypeLastName
        emailTxtFld.dataValidationType = .PSDataValidationTypeEmail
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(textField: PSTextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }

    func textFieldDidEndEditing(textField: PSTextField) {
        textField.validateInput()
    }

}

