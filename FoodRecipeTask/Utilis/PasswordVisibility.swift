//
//  PasswordVisibility.swift
//  FoodRecipeTask
//
//  Created by Hala on 11/05/2021.
//

import UIKit


struct PasswordVisibility {
    
    
    static func insertEyeIcon(textfield: UITextField, systemImage: String) -> (button: UIButton, image: String){ //() { //
        
        
        let button = UIButton(type: .custom)
        if #available(iOS 13.0, *) {
            button.setImage(UIImage(systemName: systemImage), for: .normal)
        } else {
            print("systemName: is only available in iOS 13.0 or newer")
        }
        
        if systemImage == "eye.slash"{
            textfield.isSecureTextEntry = true
        }else{
            textfield.isSecureTextEntry = false
        }
        
        
        button.tintColor = MainColors.primaryColor
        
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 0)
        
        textfield.rightView = button
        textfield.rightViewMode = .always
        
        return (button, systemImage)
    }
    
}
