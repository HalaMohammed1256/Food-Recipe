//
//  RecipeDetailsViewController.swift
//  FoodRecipeTask
//
//  Created by Hala on 11/05/2021.
//

import UIKit
import JGProgressHUD

class RecipeDetailsViewController: UIViewController {
    
    // variables
    var presenter: RecipeDetailsPresenter?
    var recipeID: String?
    var recipeSourceURL: String?
    private let spinner = JGProgressHUD(style: .dark)
    
    // outlets
    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var recipeDetailsTableView: UITableView!{
        didSet{
            recipeDetailsTableView.delegate = self
            recipeDetailsTableView.dataSource = self
            recipeDetailsTableView.tableFooterView = UIView.init(frame: CGRect.zero)
            recipeDetailsTableView.allowsSelection = false
        }
    }
    

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        presenter = RecipeDetailsPresenter.init(view: self)
        
        guard let recipeID = recipeID else{
            return
        }
        
        presenter?.getRecipeData(recipeID: recipeID)

        setup()
    }
    
    
    init() {
        super.init(nibName: "RecipeDetailsViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setup(){
        recipeDetailsTableView.registerCell(cellClass: TextNameTableViewCell.self)
    }
    

    

}


extension RecipeDetailsViewController: RecipeDetailsView{
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
    
    func reloadData() {
        DispatchQueue.main.async {
            self.recipeDetailsTableView.reloadData()
        }
    }
    
    func showDescriptionAlert(description: String) {
        ShowAlert.instance.showAlert(title: nil, message: description, style: .alert, view: self, okHandler: nil)
    }
    
    
}
