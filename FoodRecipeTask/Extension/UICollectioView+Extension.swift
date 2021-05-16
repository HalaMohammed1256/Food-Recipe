//
//  UICollectioViewCell+Extension.swift
//  FoodRecipeTask
//
//  Created by Hala on 11/05/2021.
//

import UIKit


extension UICollectionView{
    
    func registerCell<cell: UICollectionViewCell>(cellClass: cell.Type){
        self.register(UINib(nibName: String(describing: cell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: cell.self))
    }
    
    
    func dequeueCell<Cell: UICollectionViewCell>(indexPath: IndexPath) -> Cell{
                
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: String(describing: Cell.self), for: indexPath) as? Cell else{
            fatalError("cand dequeue cell")
        }

        return cell
    }
    
    
}
