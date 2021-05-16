//
//  FoodTypeViewController+TableViewDelegates.swift
//  FoodRecipeTask
//
//  Created by Hala on 11/05/2021.
//

import UIKit



extension FoodSearchViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var numberOfRows = 0
        
        if isFilled{
            numberOfRows = filteredFoodTypes.count
        }else{
            numberOfRows = 1
        }
        
        return numberOfRows
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if isFilled{
            let foodNameCell = TextNameTableViewCell()
            return foodNameCell.frame.height + 10
        }else{
            return foodTypeTableView.frame.height
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
                
        let cell = foodTypeTableView.dequeueCell() as TextNameTableViewCell
        if isFilled{
            
            cell.textNameLabel.text = filteredFoodTypes[indexPath.row]
            cell.textNameLabel.textAlignment = .left
                        
            
        }else{
            
            cell.textNameLabel.text = "Search For Food Recipe"
            cell.textNameLabel.textAlignment = .center
            
        }
                
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let foodRecipesViewController = FoodRecipesViewController()
        if isFilled{
            navigationController?.pushViewController(foodRecipesViewController, animated: true)
            foodRecipesViewController.recipeCategoryName = filteredFoodTypes[indexPath.row]
        }
    }
    
}
