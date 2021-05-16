//
//  UIView+Extension.swift
//  FoodRecipeTask
//
//  Created by Hala on 10/05/2021.
//

import UIKit


@IBDesignable extension UIView{
    
    @IBInspectable var cornerRadius: CGFloat{
        set{
            layer.cornerRadius = newValue
        }
        get{
            return layer.cornerRadius
        }
    }

    // round corners
    
    
}
    
    
