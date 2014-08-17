//
//  NSString+Validation.swift
//  PSTextFieldDemo
//
//  Created by Pawan Kumar Singh on 16/08/14.
//  Copyright (c) 2014 Pawan Kumar Singh. All rights reserved.
//

import Foundation

extension String{
    
    enum PSDataValidationErrorCode: Int {
        
        case PSEmailLengthZeroErrorCode = 1000              //Blank Email field
        case PSEmailInvalidFormatErrorCode                  //Email format invalid
        
        case PSUserNameLengthZeroErrorCode                  //Blank Username field
        case PSUserNameLengthMinimumErrorCode               //Username can't be less than minimum 7 character
        case PSUserNameInvalidFormatErrorCode               //Username format invalid
        
        case PSFirstNameLengthZeroErrorCode                 //Blank first name
        case PSFirstNameInvalidFormatErrorCode              //Any other character than A-Z or a-z or blankspace
        case PSFirstNameMaxAllowedCharsErrorCode            //Maximum allowed charcters (44 is considered for demo).
        
        case PSLastNameLengthZeroErrorCode                  //Blank last name
        case PSLastNameInvalidFormatErrorCode               //Any other character than A-Z or a-z or blankspace
        case PSLastNameMaxAllowedCharsErrorCode             //Maximum allowed charcters (44 is considered for demo).
        
        case PSPasswordLengthZeroErrorCode                  //Blank password
        case PSPasswordLengthMinimumErrorCode               //minimum length, (7 is considered for demo).
        case PSPasswordInvalidFormatErrorCode               //invalid characters
        
        case PSCountryISDCodeLengthZeroErrorCode
        case PSInvalidCountryISDCodeErrorCode
        case PSPhoneNumberLengthZeroErrorCode
        case PSInvalidPhoneNumberErrorCode
        
        case PSCountryNameLengthZeroErrorCode
        case PSCountryNameInvalidFormatErrorCode
        
        case PSStateNameLengthZeroErrorCode
        case PSStateNameInvalidFormatErrorCode
        
        case PSCityNameLengthZeroErrorCode
        case PSCityNameInvalidFormatErrorCode
        
        case PSPlaceNameLengthZeroErrorCode
        case PSPlaceNameInvalidFormatErrorCode
        
        case PSDateLengthZeroErrorCode
        case PSTimeLengthZeroErrorCode
        
        case PSEmptyDataValidationErrorCode
        
    }
    
    var PSDataValidationErrorDomain: NSString { return "com.pserror.inputvalidation"}
    
    var PSEmailLengthZeroErrorDesc: NSString { return "Email field empty."}
    var PSEmailInvalidFormatErrorDesc: NSString { return "Email address is not valid."}
    var PSUserNameLengthZeroErrorDesc: NSString { return"Username field empty."}
    var PSUserNameInvalidFormatErrorDesc: NSString { return"User name can not contain special characters."}
    var PSUserNameLengthMinimumErrorDesc: NSString { return "User name can not be less than 7 characters."}
    var PSPersonNameValidationErrorDesc: NSString { return "Invalid Name."}
    
    var PSFirstNameEmptyErrorDesc: NSString { return "First name can't be empty."}
    var PSFirstNameMaxAllowedCharsErrorDesc: NSString { return "First name can't be more than 44 characters."}
    var PSFirstNameInvalidFormatErrorDesc: NSString { return "First name can't contain special characters."}
    
    var PSLastNameEmptyErrorDesc: NSString { return "Last name can't be empty"}
    var PSLastNameMaxAllowedCharsErrorDesc: NSString { return "Last name can't be more than 44 characters."}
    var PSLastNameInvalidFormatErrorDesc: NSString { return "Last name can't contain special characters"}
    
    var PSPasswordInvalidFormatErrorDesc: NSString { return "Invalid Password."}
    var PSPasswordLengthZeroErrorDesc: NSString { return "Password field empty."}
    var PSPasswordLengthMinimumErrorDesc: NSString { return "Password should be minimum 7 characters."}
    var PSPersonNameLengthZeroErrorDesc: NSString { return "Username field can't be empty."}
    var PSCountryISDCodeLengthZeroErrorDesc: NSString { return "Enter country code."}
    var PSInvalidCountryISDCodeErrorDesc: NSString { return "Enter valid country code."}
    var PSPhoneNumberLengthZeroErrorDesc: NSString { return "Enter phone number."}
    var PSInvalidPhoneNumberErrorDesc: NSString { return "Enter valid phone number."}
    var PSEmptyStringErrorDesc: NSString { return "This field can't be empty."}
    
    var PSDateEmptyErrorDesc: NSString { return "Date can't be empty."}
    var PSTimeEmptyErrorDesc: NSString { return"Time can't be empty."}
    
    var PSPlaceNameEmptyErrorDesc: NSString { return"Place can't be empty."}
    var PSPlaceNameInvalidFormatErrorDesc: NSString { return"Place name is invalid."}
    
    var PSCityNameEmptyErrorDesc: NSString { return"City can't be empty."}
    var PSCityNameInvalidFormatErrorDesc: NSString { return"City name is invalid."}
    
    var PSStateNameEmptyErrorDesc: NSString { return"State can't be empty."}
    var PSStateNameInvalidFormatErrorDesc: NSString { return"State name is invalid."}
    
    var PSCountryNameEmptyErrorDesc: NSString { return"Country can't be empty."}
    var PSCountryNameInvalidFormatErrorDesc: NSString { return "Country name is invalid."}

    func validateUserName(error: NSErrorPointer) -> Bool {
        
        var success: Bool = false
        var errorCode: PSDataValidationErrorCode = .PSEmptyDataValidationErrorCode
        var errorDescStr: NSString! = PSEmptyStringErrorDesc
        var userNameRegex: NSString = "[A-Z0-9a-z._-]{7,32}"
        var userName: NSPredicate = NSPredicate(format: "SELF MATCHES %@",userNameRegex)
        
        if(self == nil || isEmpty){
            
            errorCode = .PSUserNameLengthZeroErrorCode
            errorDescStr = PSUserNameLengthZeroErrorDesc
            
        }else if(countElements(self) < 7){
            
            errorCode = .PSUserNameLengthMinimumErrorCode
            errorDescStr = PSUserNameLengthMinimumErrorDesc
            
        }else if (userName.evaluateWithObject(self) == nil) {
            
            errorCode = .PSUserNameInvalidFormatErrorCode
            errorDescStr = PSUserNameInvalidFormatErrorDesc
            
        }else{
            error.memory = nil
            success = true
        }
        
        if(success == false){
            error.memory = NSError(domain: PSDataValidationErrorDomain, code: errorCode.toRaw(), userInfo: [NSLocalizedDescriptionKey:errorDescStr])
        }
        return success
    }
    
    func validateFirstName(error: NSErrorPointer) -> Bool{
        
        var success: Bool = false
        var errorCode: PSDataValidationErrorCode = .PSEmptyDataValidationErrorCode
        var errorDescStr: NSString! = PSEmptyStringErrorDesc
        var firstNameRegex: String = "[A-Za-z. ]{1,44}"
        var firstName: NSPredicate = NSPredicate(format: "SELF MATCHES %@",firstNameRegex)
        
        if(self == nil || isEmpty){
            
            errorCode = .PSFirstNameLengthZeroErrorCode
            errorDescStr = PSFirstNameEmptyErrorDesc
            
        }else if(countElements(self) > 44){
            
            errorCode = .PSFirstNameMaxAllowedCharsErrorCode
            errorDescStr = PSFirstNameMaxAllowedCharsErrorDesc
            
        }else if (firstName.evaluateWithObject(self) == nil) {
            
            errorCode = .PSFirstNameInvalidFormatErrorCode
            errorDescStr = PSFirstNameInvalidFormatErrorDesc
            
        }else{
            error.memory = nil
            success = true
        }
        
        if(success == false){
            error.memory = NSError(domain: PSDataValidationErrorDomain, code: errorCode.toRaw(), userInfo: [NSLocalizedDescriptionKey:errorDescStr])
        }
        return success
    }

    func validateLastName(error: NSErrorPointer) -> Bool{
        
        var success: Bool = false
        var errorCode: PSDataValidationErrorCode = .PSEmptyDataValidationErrorCode
        var errorDescStr: NSString! = PSEmptyStringErrorDesc
        var lastNameRegex: NSString = "[A-Za-z. ]{1,44}"
        var lastName: NSPredicate = NSPredicate(format: "SELF MATCHES %@",lastNameRegex)
        
        if(self == nil || isEmpty){
            
            errorCode = .PSLastNameLengthZeroErrorCode
            errorDescStr = PSLastNameEmptyErrorDesc
            
        }else if(countElements(self) > 44){
            
            errorCode = .PSLastNameMaxAllowedCharsErrorCode
            errorDescStr = PSLastNameMaxAllowedCharsErrorDesc
            
        }else if (lastName.evaluateWithObject(self) == nil) {
            
            errorCode = .PSLastNameInvalidFormatErrorCode
            errorDescStr = PSLastNameInvalidFormatErrorDesc
            
        }else{
            error.memory = nil
            success = true
        }
        
        if(success == false){
            error.memory = NSError(domain: PSDataValidationErrorDomain, code: errorCode.toRaw(), userInfo: [NSLocalizedDescriptionKey:errorDescStr])
        }
        return success
    }
    
    
    func validateEmail(error: NSErrorPointer) -> Bool {
        
        var success: Bool = false
        var errorCode: PSDataValidationErrorCode = .PSEmptyDataValidationErrorCode
        var errorDescStr: NSString! = PSEmptyStringErrorDesc
        var emailRegex: NSString = "[A-Z0-9a-z._-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        var emailPredicate: NSPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        
        if(isEmpty == 0){
            
            errorCode = .PSEmailLengthZeroErrorCode
            errorDescStr = PSEmailLengthZeroErrorDesc
            
        }else if(emailPredicate.evaluateWithObject(self) == nil) {
            
            errorCode = .PSEmailInvalidFormatErrorCode
            errorDescStr = PSEmailInvalidFormatErrorDesc
            
        }else{
            error.memory = nil
            success = true
        }
        
        if(success == false){
            error.memory = NSError(domain: PSDataValidationErrorDomain, code: errorCode.toRaw(), userInfo: [NSLocalizedDescriptionKey: errorDescStr])
        }
        return success;
    }
    
    func validatePassword(error: NSErrorPointer) -> Bool{

        var success: Bool = false
        var errorCode: PSDataValidationErrorCode = .PSEmptyDataValidationErrorCode
        var errorDescStr: NSString! = PSEmptyStringErrorDesc

        var passwordRegex: NSString = "[A-Z0-9a-z]{7,32}"
        var password: NSPredicate = NSPredicate(format:"SELF MATCHES %@", passwordRegex)
    
        if(isEmpty){
            
            errorCode = .PSPasswordLengthZeroErrorCode
            errorDescStr = PSPasswordLengthZeroErrorDesc
            
        }else if(countElements(self) < 7){
            
            errorCode = .PSPasswordLengthMinimumErrorCode
            errorDescStr = PSPasswordLengthMinimumErrorDesc

        }else if (password.evaluateWithObject(self) == nil) {
            
            errorCode = .PSPasswordInvalidFormatErrorCode
            errorDescStr = PSPasswordInvalidFormatErrorDesc
            
        }else{
            error.memory = nil
            success = true
        }
        
        if(success == false){
            error.memory = NSError(domain: PSDataValidationErrorDomain, code: errorCode.toRaw(), userInfo: [NSLocalizedDescriptionKey:errorDescStr])
        }
        return success;
    }
    
    func validateCountryCode(error: NSErrorPointer) -> Bool {
        
        var success: Bool = false
        var errorCode: PSDataValidationErrorCode = .PSEmptyDataValidationErrorCode
        var errorDesc: NSString = PSEmptyStringErrorDesc
        var phoneRegex: NSString = "[+][0-9]{1,4}"
        var countryCodeTest: NSPredicate = NSPredicate(format:"SELF MATCHES %@", phoneRegex)
        
        if(isEmpty){
            errorCode = .PSCountryISDCodeLengthZeroErrorCode
            errorDesc = PSCountryISDCodeLengthZeroErrorDesc
            
        }else if(countryCodeTest.evaluateWithObject(self) == nil)
        {
            errorCode = .PSInvalidCountryISDCodeErrorCode
            errorDesc = PSInvalidCountryISDCodeErrorDesc
            
        }else{
            error.memory = nil
            success = true
        }
        
        if (success == false){
            error.memory = NSError(domain:PSDataValidationErrorDomain, code:errorCode.toRaw(), userInfo:[NSLocalizedDescriptionKey:errorDesc])
        }
        return success;
    }
    
    func validatePhoneNumber(error: NSErrorPointer!) -> Bool {
        
        var success: Bool = false
        var errorCode: PSDataValidationErrorCode = .PSEmptyDataValidationErrorCode
        var errorDesc: NSString = PSEmptyStringErrorDesc
        var phoneRegex: NSString = "[0-9]{7,12}"
        var countryCodeTest: NSPredicate = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
    
        if(isEmpty){
            
            errorCode = .PSCountryISDCodeLengthZeroErrorCode
            errorDesc = PSPhoneNumberLengthZeroErrorDesc
            
        }else if(countryCodeTest.evaluateWithObject(self) == nil){
            errorCode = .PSInvalidCountryISDCodeErrorCode
            errorDesc = PSInvalidPhoneNumberErrorDesc
        }else{
            error.memory = nil
            success = true
        }
        
        if(success == false)
        {
            error.memory = NSError(domain: PSDataValidationErrorDomain, code: errorCode.toRaw(), userInfo: [NSLocalizedDescriptionKey:errorDesc])
        }
        return success;
    }

    func validateEmpty(error: NSErrorPointer) -> Bool {
        
        var success: Bool = false
        if(isEmpty){
            var errorCode: Int = PSDataValidationErrorCode.PSEmptyDataValidationErrorCode.toRaw()
            error.memory = NSError(domain: PSDataValidationErrorDomain, code: errorCode, userInfo:[NSLocalizedDescriptionKey:PSEmptyStringErrorDesc])
        }else{
            error.memory = nil
            success = true
        }
        return success;
    }

    
    func validateDate(error: NSErrorPointer) -> Bool{
        
        var success = false
        if(isEmpty){
            var errorCode: Int = PSDataValidationErrorCode.PSDateLengthZeroErrorCode.toRaw()
            error.memory = NSError(domain: PSDataValidationErrorDomain, code: errorCode, userInfo:[NSLocalizedDescriptionKey:PSDateEmptyErrorDesc])
        }else{
            success = true
        }
        return success;
    }
    
    func validateTime(error: NSErrorPointer!) -> Bool {
        
        var success: Bool = false
        if(isEmpty){

            var errorCode: Int = PSDataValidationErrorCode.PSTimeLengthZeroErrorCode.toRaw()
            error.memory = NSError(domain: PSDataValidationErrorDomain, code: errorCode, userInfo:[NSLocalizedDescriptionKey:PSTimeEmptyErrorDesc])
            
        }else{
            success = true
        }
        return success
    }
    
    func validatePlace(error: NSErrorPointer!) -> Bool {

        var success = false
        var errorCode: PSDataValidationErrorCode = .PSEmptyDataValidationErrorCode
        var errorDescStr: NSString = PSEmptyStringErrorDesc
        var placeNameRegex: NSString = "[A-Za-z ]{1,44}"
        var placeName: NSPredicate = NSPredicate(format:"SELF MATCHES %@", placeNameRegex)
    
        if(isEmpty){
            
            errorCode = .PSPlaceNameLengthZeroErrorCode
            errorDescStr = PSPlaceNameEmptyErrorDesc
            
        }else if (placeName.evaluateWithObject(self)) {
            
            errorCode = .PSPlaceNameInvalidFormatErrorCode
            errorDescStr = PSPlaceNameInvalidFormatErrorDesc
            
        }else{
            error.memory = nil
            success = true
        }
        
        if(success == false){
            error.memory = NSError(domain: PSDataValidationErrorDomain, code:errorCode.toRaw(), userInfo:[NSLocalizedDescriptionKey: errorDescStr])
        }
        
        return success;
    }
    
    func validateCity(error: NSErrorPointer) -> Bool {
        var success: Bool = false
        var errorCode: PSDataValidationErrorCode = .PSEmptyDataValidationErrorCode
        var errorDescStr: NSString = PSEmptyStringErrorDesc
        var cityNameRegex: NSString = "[A-Za-z ]{1,44}"
        var cityName: NSPredicate = NSPredicate(format:"SELF MATCHES %@", cityNameRegex)
    
        if(isEmpty){
            
            errorCode = .PSCityNameLengthZeroErrorCode;
            errorDescStr = PSCityNameEmptyErrorDesc
            
        }else if (cityName.evaluateWithObject(self)) {
            
            errorCode = .PSCityNameInvalidFormatErrorCode;
            errorDescStr = PSCityNameInvalidFormatErrorDesc
            
        }else{
            error.memory = nil
            success = false
        }
        
        if(success == false){
            error.memory = NSError(domain:PSDataValidationErrorDomain, code:errorCode.toRaw(), userInfo:[NSLocalizedDescriptionKey: errorDescStr])
        }
        return success
    }
    
    func validateState(error: NSErrorPointer!) -> Bool {

        var success = false
        var errorCode: PSDataValidationErrorCode = .PSEmptyDataValidationErrorCode
        var errorDescStr: NSString = PSEmptyStringErrorDesc
        var stateNameRegex: NSString = "[A-Za-z ]{1,44}"
        var stateName: NSPredicate = NSPredicate(format:"SELF MATCHES %@", stateNameRegex)
    
        if(isEmpty){
            
            errorCode = .PSStateNameLengthZeroErrorCode
            errorDescStr = PSStateNameEmptyErrorDesc
            
        }else if (stateName.evaluateWithObject(self)) {
            
            errorCode = .PSStateNameInvalidFormatErrorCode
            errorDescStr = PSStateNameInvalidFormatErrorDesc
            
        }else{
            error.memory = nil
            success = true
        }
        
        if(success == false){
            error.memory = NSError(domain:PSDataValidationErrorDomain, code:errorCode.toRaw(), userInfo:[NSLocalizedDescriptionKey: errorDescStr])
        }
        return success
    }

    func validateCountry(error: NSErrorPointer) -> Bool {
        
        var success: Bool = false
        var errorCode: PSDataValidationErrorCode = .PSEmptyDataValidationErrorCode
        var errorDescStr: NSString = PSEmptyStringErrorDesc
        var countryNameRegex: NSString = "[A-Za-z ]{1,44}"
        var countryName: NSPredicate = NSPredicate(format: "SELF MATCHES %@", countryNameRegex)
        
        if(isEmpty){
            
            errorCode = .PSCountryNameLengthZeroErrorCode
            errorDescStr = PSCountryNameEmptyErrorDesc
            
        }else if (countryName.evaluateWithObject(self)) {
            
            errorCode = .PSCountryNameInvalidFormatErrorCode
            errorDescStr = PSCountryNameInvalidFormatErrorDesc
            
        }else{
            error.memory = nil
            success = true
        }
        
        if(success == false){
            error.memory = NSError(domain:PSDataValidationErrorDomain, code:errorCode.toRaw(), userInfo:[NSLocalizedDescriptionKey: errorDescStr])
        }
        return success;
    }
}