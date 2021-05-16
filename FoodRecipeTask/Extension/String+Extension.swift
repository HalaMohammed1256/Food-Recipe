//
//  String+Extension.swift
//  FoodRecipeTask
//
//  Created by Hala on 11/05/2021.
//

import Foundation


extension String{
    
    // to ignore space at the begin and the end of string
    
    func trimWhiteSpace() -> String{
        let newString = self.trimmingCharacters(in: .whitespacesAndNewlines)
        return newString
    }
    
    
    func isValidateEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"

        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPredicate.evaluate(with: self)
    }
    

    
    func isValidatePassword(mini: Int = 8, max: Int = 8) -> Bool{
        
        //Minimum 8 characters at least 1 Alphabet and 1 Number:
        var passRegEx = ""
        if mini >= max{
            passRegEx = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{\(mini),}$"
        }else{
            passRegEx = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{\(mini),\(max)}$"
        }
        
        let passwordPredicate = NSPredicate(format:"SELF MATCHES %@", passRegEx)
        return passwordPredicate.evaluate(with: self)
    }
    
}
