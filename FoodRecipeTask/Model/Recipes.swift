//
//  Recipes.swift
//  FoodRecipeTask
//
//  Created by Hala on 14/05/2021.
//

import Foundation


struct RecipiesResponse: Codable {
    let count: Int?
    let recipes: [Recipe]?
}


// MARK: - Recipe
struct Recipe: Codable {
    let publisher, title: String?
    let sourceURL: String?
    let recipeID: String?
    let imageURL: String?
    let socialRank: Double?
    let publisherURL: String?

    enum CodingKeys: String, CodingKey {
        case publisher, title
        case sourceURL = "source_url"
        case recipeID = "recipe_id"
        case imageURL = "image_url"
        case socialRank = "social_rank"
        case publisherURL = "publisher_url"
    }
}
