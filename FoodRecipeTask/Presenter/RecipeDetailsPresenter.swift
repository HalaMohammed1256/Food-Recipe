//
//  RecipeDetailsPresenter.swift
//  FoodRecipeTask
//
//  Created by Hala on 14/05/2021.
//

import Foundation


protocol RecipeDetailsView: class{
    func startAnimating()
    func stopAnimating()
    func reloadData()
    func showDescriptionAlert(description: String)
    
}


protocol RecipeDetailsViewPresenter{
    
    init(view: RecipeDetailsView)
    var recipeDetailsData: RecipeData? {get set}
    func getRecipeData(recipeID: String)
    
    
}

class RecipeDetailsPresenter: RecipeDetailsViewPresenter{
    
    var recipeDetailsData: RecipeData?
    
    
    weak var view: RecipeDetailsView?
    

    required init(view: RecipeDetailsView) {
        self.view = view
    }
    
    
    func getRecipeData(recipeID: String) {
        
        print(recipeID)
        
        view?.startAnimating()
        
        ApiServices.instance.getResponses(url: ApiURLs.baseURL.rawValue + ApiURLs.recipeDetails.rawValue, parameters: ["rId": recipeID]) { [self] (data: RecipeDetails?, error) in
            
            
            if let error = error{
                view?.showDescriptionAlert(description: error.localizedDescription)
                print(error.localizedDescription)
            }else if let data = data{
                recipeDetailsData = data.recipe
                view?.reloadData()
                view?.stopAnimating()
                
            }
            
        }
        
        
        
    }
    
}
