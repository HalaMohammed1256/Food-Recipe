//
//  HomeViewController.swift
//  FoodRecipeTask
//
//  Created by Hala on 11/05/2021.
//

import UIKit
import Kingfisher
import JGProgressHUD

class FoodRecipesViewController: UIViewController {
    
    // variables
    var recipeCategoryName: String?
    var presenter: FoodRecipesPresenter?
    private let spinner = JGProgressHUD(style: .dark)
    
    // outlets
    
    @IBOutlet weak var recipeCategoryLabel: UILabel!
    
    
    @IBOutlet weak var recipeCollectionView: UICollectionView!{
        didSet{
            recipeCollectionView.delegate = self
            recipeCollectionView.dataSource = self
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let recipeName = recipeCategoryName else {
            return
        }
        
        presenter = FoodRecipesPresenter.init(view: self)
        presenter?.getSelectedCategoryData(foodCategoryName: recipeName)

        configureUI()
        

    }
    
    init() {
        super.init(nibName: "FoodRecipesViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    

    func configureUI(){
        
        title = "Recipe Category"
        recipeCollectionView.registerCell(cellClass: RecipeCollectionViewCell.self)
        
    }
    
    
    

}


extension FoodRecipesViewController: FoodRecipesView{
    func reloadData() {
        DispatchQueue.main.async {
            self.recipeCollectionView.reloadData()
        }
    }
    
    func startAnimating() {
        DispatchQueue.main.async {
            self.spinner.show(in: self.view)
        }
    }
    
    func stopAnimating() {
        DispatchQueue.main.async {
            self.spinner.dismiss()
        }
    }
    
    func showDescriptionAlert(description: String) {
        ShowAlert.instance.showAlert(title: nil, message: description, style: .alert, view: self, okHandler: nil)
    }
    
    
}
