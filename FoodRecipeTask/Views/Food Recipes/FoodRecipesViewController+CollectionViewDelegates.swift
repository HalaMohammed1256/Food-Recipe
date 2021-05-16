//
//  HomeViewController+CollectionViewDelegates.swift
//  FoodRecipeTask
//
//  Created by Hala on 11/05/2021.
//

import UIKit


extension FoodRecipesViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: recipeCollectionView.frame.width / 2.1, height: recipeCollectionView.frame.height / 3.2)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.selectedFoodData.count ?? 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = recipeCollectionView.dequeueCell(indexPath: indexPath) as RecipeCollectionViewCell
        
        if let recipeImage = presenter?.selectedFoodData[indexPath.row].imageURL{
            
            cell.recipeImageView.kf.indicatorType = .activity
            cell.recipeImageView.kf.setImage(with: URL(string: recipeImage))
                        
        }

        
        cell.recipeNameLabel.text = presenter?.selectedFoodData[indexPath.row].title
        cell.recipePublisherName.text = presenter?.selectedFoodData[indexPath.row].publisher
        
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let recipeDetailsViewController = RecipeDetailsViewController()
        navigationController?.pushViewController(recipeDetailsViewController, animated: true)
        recipeDetailsViewController.recipeID = presenter?.selectedFoodData[indexPath.row].recipeID
        
    }
    
    
}
