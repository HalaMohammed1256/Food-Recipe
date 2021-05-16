//
//  TextLabelAnimation.swift
//  FoodRecipeTask
//
//  Created by Hala on 10/05/2021.
//

import UIKit


extension UILabel{
    
    func setTextWithAnimation(text: String){
        
        var characterIndex = 0.0
        for letter in text{
            Timer.scheduledTimer(withTimeInterval: 0.25 * characterIndex, repeats: false) { (timer) in
                self.text?.append(letter)
            }
            
            characterIndex += 1
        }
        
    }
    
}
