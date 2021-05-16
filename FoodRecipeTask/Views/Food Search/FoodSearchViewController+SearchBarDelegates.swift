//
//  FoodTypeViewController+SearchBarDelegates.swift
//  FoodRecipeTask
//
//  Created by Hala on 11/05/2021.
//

import UIKit


extension FoodSearchViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        let searchString = searchText.trimWhiteSpace()
        if searchString.count > 0{
            isFilled = true
            
            guard let foodTypes = presenter?.foodTypes else{
                return
            }
            
            filteredFoodTypes = foodTypes.filter{
                return $0.range(of: searchString, options: .caseInsensitive) != nil
            }
            
        }else{
            isFilled = false
        }
        
        foodTypeTableView.reloadData()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        
        isShowSearchHistory = true
        
        if let searchHistories = defaults.stringArray(forKey: K.UserDefaultsData.recipeSearchHistory){
            recipeSearchHistory = searchHistories
        }
                
        foodTypeTableView.reloadData()
    }
    
    
    
}
