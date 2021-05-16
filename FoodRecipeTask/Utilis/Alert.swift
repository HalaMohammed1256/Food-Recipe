//
//  Alert.swift
//  FoodRecipeTask
//
//  Created by Hala on 12/05/2021.
//

import UIKit

  
class ShowAlert{
    
    static let instance = ShowAlert()
    
    func showAlert(title: String?, message: String?, style: UIAlertController.Style, view: UIViewController, okHandler: ((UIAlertAction) -> Void)?){
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        
        
        let okButton = UIAlertAction(title: "OK", style: .default, handler: okHandler)
        
                
        alert.addAction(okButton)
        
        view.present(alert, animated: true)
    }

    
    func showForgetPasswordAlert(title: String?, message: String?, style: UIAlertController.Style, view: UIViewController, resetHandler: ((Bool, String) -> Void)?){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        
        alert.addTextField { (textField) in
            textField.placeholder = "Please, enter your email address"
            textField.keyboardType = .emailAddress
        }
        
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let resetButton = UIAlertAction(title: "OK", style: .default) { (action) in
            
            guard let email = alert.textFields?[0].text else{
                return
            }
            
            resetHandler?(true, email)
        }
        
        
        alert.addAction(resetButton)
        alert.addAction(cancelButton)
        
        view.present(alert, animated: true)
    }
    
    
    
}
