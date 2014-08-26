//
//  PSTextField.swift
//  PSTextFieldDemo
//
//  Created by Pawan Kumar Singh on 15/08/14.
//  Copyright (c) 2014 Pawan Kumar Singh. All rights reserved.
//

import UIKit

class PSTextField: UITextField {

    enum PSDataValidationType{
        case PSDataValidationTypePassword           //alphanumeric password like hs939wd!
        case PSDataValidationTypeUserName           //alphanumeric username like john231
        case PSDataValidationTypeFirstName          //First name like Ramesh, Suresh, Gita etc
        case PSDataValidationTypeLastName           //Last name Yadav, Naidu etc
        case PSDataValidationTypeEmail              //Email id vishu@subdomain.domain
        case PSDataValidationTypeMobileNumber       //Mobile number - +911034567892
        case PSDataValidationTypeDate
        case PSDataValidationTypeTime
        case PSDataValidationTypePlace
        case PSDataValidationTypeCity
        case PSDataValidationTypeState
        case PSDataValidationTypeCountry
        case PSDataValidationTypeDefault         //Will check for empty string
    }
    
     var dataValidationType: PSDataValidationType = .PSDataValidationTypeDefault
    var popUpTriangleHorizontalRightMargin: CGFloat!
    lazy var error: NSError! = nil

    func validateInput(){
        
        var tempError: NSError?
        var isDataFoundValid = true                //By default, we assume user has keyed correct input.
        
        switch dataValidationType {
            
        case .PSDataValidationTypePassword:
            isDataFoundValid = self.text.validatePassword(&tempError)

            case .PSDataValidationTypeUserName:
                isDataFoundValid = self.text.validateUserName(&tempError)

            case .PSDataValidationTypeFirstName:
                isDataFoundValid = self.text.validateFirstName(&tempError)

            case .PSDataValidationTypeLastName:
                isDataFoundValid = self.text.validateLastName(&tempError)

            case .PSDataValidationTypeEmail:
                isDataFoundValid = self.text.validateEmail(&tempError)

            case .PSDataValidationTypeMobileNumber:
                isDataFoundValid = self.text.validatePhoneNumber(&tempError)

            case .PSDataValidationTypeDate:
                isDataFoundValid = self.text.validateDate(&tempError)

            case .PSDataValidationTypeTime:
                isDataFoundValid = self.text.validateTime(&tempError)

            case .PSDataValidationTypePlace:
                isDataFoundValid = self.text.validatePlace(&tempError)

            case .PSDataValidationTypeCity:
                isDataFoundValid = self.text.validateCity(&tempError)

            case .PSDataValidationTypeState:
                isDataFoundValid = self.text.validateState(&tempError)

            case .PSDataValidationTypeCountry:
                isDataFoundValid = self.text.validateCountry(&tempError)

            case .PSDataValidationTypeDefault:
                isDataFoundValid = self.text.validateEmpty(&tempError)
        }
        
        if(isDataFoundValid == false){
            
            self.error = tempError
             addErrorInfoDisclosure()
        }else{
             removeErrorInfoDisclosure()
        }
    }
    
    func addErrorInfoDisclosure(){
        
        let infoDisclosure = UIButton.buttonWithType(.InfoDark) as UIButton
        infoDisclosure.tintColor = UIColor.redColor()
        infoDisclosure.transform = CGAffineTransformMakeRotation(CGFloat(M_PI))
        infoDisclosure.addTarget(self, action: "displayErrorAlert", forControlEvents: .TouchUpInside)
 
        rightView = infoDisclosure
        rightViewMode = .Always
        popUpTriangleHorizontalRightMargin = infoDisclosure.center.x;
    }
    
    func removeErrorInfoDisclosure(){
        
        rightView = nil
    }
    
    func displayErrorAlert(){
        
        var errorMessage: String = error.localizedDescription
        var errorAlertView: PSErrorAlertView = PSErrorAlertView(errorMessage: errorMessage)
        var popupViewTriangleTopTipPoint: CGPoint = CGPointMake(self.frame.size.width-popUpTriangleHorizontalRightMargin,
        self.frame.size.height)
        errorAlertView.popUpTriangleTipPoint = self.convertPoint(popupViewTriangleTopTipPoint, toView: nil)
        errorAlertView.popUpTriangleHorizontalRightMargin = popUpTriangleHorizontalRightMargin;
        errorAlertView.displayAlert()
    }
    
    override func awakeFromNib(){
        
        //setting default validation to validate for empty text.
        self.dataValidationType = .PSDataValidationTypeDefault;
    }
}

