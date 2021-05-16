//
//  UITextField+Extension.swift
//  FoodRecipeTask
//
//  Created by Hala on 10/05/2021.
//

import UIKit

extension UITextField{
    
    func insertPadding(){
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: self.frame.height))
        self.leftView = paddingView
        
                
        self.leftViewMode = .always
        
    }

    
}


