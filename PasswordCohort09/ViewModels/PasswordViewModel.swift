//
//  PasswordViewModel.swift
//  PasswordCohort09
//
//  Created by Lenin Baku Cortez Hernandez on 24/06/26.
//

// primitive types
import Foundation
// observable and published
import Combine



class PasswordViewModel: ObservableObject {
    
    @Published var password: String = ""
    @Published var strenght:PasswordStrength = .invalid
    
    // Tests
    //Password cant be empty
    //password is "weak" if it is less than 6 character
    // password is "medium" if its more than 6
    //password is "strong" if it cotains a number
    
    func checkPassword(){
        // Challenge #1
        //How do we check if our password is empty or not?
        //Hint check if string empty
        if password.isEmpty {
            //true
            strenght = .invalid
        }
        //Challenge #2
        // if password is less than 6 characters then set it to weak
        // hint: count numer of characters inside a string
        else if password.count < 6 {
            strenght = .weak
            
        }else if password.count >= 8 && containsNumber(password){
            strenght = .strong
        }else {
            strenght = .medium
        }
        
        //label arguments 
        //containsNumber (text: "hello")
        
        //positional arguments
        //containsnumber("", 1)
    }
    
    
        //func (){}
    //func () -> this means thi functions returns something
//positional arguments
    
    private func containsNumber(_ text:String) -> Bool {
        //abc1
        //abc
        for character in text {
            if character.isNumber {
                return true
            }
        }
        return false
    }
}
