//
//  FoodCategoryPresenter.swift
//  FoodRecipeTask
//
//  Created by Hala on 14/05/2021.
//

import Foundation


protocol FoodRecipesView: class{
    func startAnimating()
    func stopAnimating()
    func reloadData()
    func showDescriptionAlert(description: String)
    
}


protocol FoodRecipesViewPresenter{
    
    init(view: FoodRecipesView)
    func getSelectedCategoryData(foodCategoryName: String)
    
}

class FoodRecipesPresenter: FoodRecipesViewPresenter{
    
    
    weak var view: FoodRecipesView?
    var selectedFoodData = [Recipe]()
    
    required init(view: FoodRecipesView) {
        self.view = view
    }
    
    
    func getSelectedCategoryData(foodCategoryName: String) {
        
        view?.startAnimating()
        
        ApiServices.instance.getResponses(url: ApiURLs.baseURL.rawValue + ApiURLs.recipeCategory.rawValue, parameters: ["q": foodCategoryName]) { [self] (data: RecipiesResponse?, error) in
            
            
            if let error = error{
                view?.showDescriptionAlert(description: error.localizedDescription)
                print(error.localizedDescription)
            }else if let data = data{
                selectedFoodData = (data.recipes)!
                view?.stopAnimating()
                self.view?.reloadData()
                
            }
            
        }
        
        
        
    }
    
    
    
}
