//
//  RecipeCollectionViewCell.swift
//  FoodRecipeTask
//
//  Created by Hala on 11/05/2021.
//

import UIKit

class RecipeCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var recipeNameLabel: UILabel!
    @IBOutlet weak var recipePublisherName: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
