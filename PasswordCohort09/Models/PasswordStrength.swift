//
//  PasswordStrength.swift
//  PasswordCohort09
//
//  Created by Lenin Baku Cortez Hernandez on 24/06/26.
//

import Foundation

//This is an enum
//This is a list of options
//It work just like a regular type
//In this case all the options meed to be strings

enum PasswordStrength:String{
    case invalid = "Invdalid"
    case weak = "Weak password, change..."
    case medium = "Medium"
    case strong = "Strong"
    
}

//This is a model
//This is not a list
//This is our own custom type to create data
//This data can be conformed by other custom types or enums

//let weakPassword = "weak"

//let enumWeakPassword = PasswordStrength.weak

//let enumWeakPasswordTwo:PasswordStrength = .weak


//struct MyPasswordModel {
  //  let password:String
   // let strength:PasswordStrength
    
    
//}


