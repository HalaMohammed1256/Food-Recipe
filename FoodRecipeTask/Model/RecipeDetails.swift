//
//  RecipeDetails.swift
//  FoodRecipeTask
//
//  Created by Hala on 14/05/2021.
//

import Foundation


struct RecipeData : Codable {
    let publisher : String?
    let ingredients : [String]?
    let source_url : String?
    let recipe_id : String?
    let image_url : String?
    let social_rank : Double?
    let publisher_url : String?
    let title : String?

    enum CodingKeys: String, CodingKey {

        case publisher = "publisher"
        case ingredients = "ingredients"
        case source_url = "source_url"
        case recipe_id = "recipe_id"
        case image_url = "image_url"
        case social_rank = "social_rank"
        case publisher_url = "publisher_url"
        case title = "title"
    }

}



struct RecipeDetails : Codable {
    let recipe : RecipeData?

    enum CodingKeys: String, CodingKey {

        case recipe = "recipe"
    }

    

}

