//
//  RecipeDetailsViewController+TableViewDelegates.swift
//  FoodRecipeTask
//
//  Created by Hala on 12/05/2021.
//

import UIKit


extension RecipeDetailsViewController: UITableViewDelegate, UITableViewDataSource{
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        switch section{
        
        case 0:
                        
            return "Recipe Title"
            
        case 1:
                        
            return "Recipe Ingredients"
            
        case 2:
                        
            return "Recipe Source"
            
        default:
            return ""
        }
    }
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
                
        recipeImageView.kf.indicatorType = .activity
        recipeImageView.kf.setImage(with: URL(string: presenter?.recipeDetailsData?.image_url ?? ""))
        
        switch indexPath.section{
        case 0:
            
            let cell = recipeDetailsTableView.dequeueCell() as TextNameTableViewCell
            
            cell.textNameLabel.textAlignment = .center
            cell.textNameLabel.font = UIFont.boldSystemFont(ofSize: 18)
            cell.textNameLabel.text = presenter?.recipeDetailsData?.title
    
            return cell
            
        case 1:
            
            let cell = recipeDetailsTableView.dequeueCell() as TextNameTableViewCell
            
            cell.textNameLabel.textAlignment = .left
            cell.textNameLabel.font = UIFont.boldSystemFont(ofSize: 18)
            cell.textNameLabel.text = presenter?.recipeDetailsData?.ingredients?.joined(separator: "\n\n")

            return cell
            
            
        case 2:
            
            let cell = recipeDetailsTableView.dequeueCell() as TextNameTableViewCell
            
            cell.textNameLabel.font = UIFont.boldSystemFont(ofSize: 18)
            cell.textNameLabel.textAlignment = .left
            cell.textNameLabel.text = "Recipe Source"
            cell.accessoryButton.isHidden = false
            
            
            
            cell.accessoryButtonAction = { [self] in
                
                let recipeSourceURLViewController = RecipeSourceURLViewController()
                recipeSourceURL = presenter?.recipeDetailsData?.source_url
                navigationController?.pushViewController(recipeSourceURLViewController, animated: true)
                recipeSourceURLViewController.recipeSourceURL = recipeSourceURL
            }

            return cell
        default:
            return UITableViewCell()
        }
        
    }
    
    
}
