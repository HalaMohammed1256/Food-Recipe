//
//  FoodTypeViewController.swift
//  FoodRecipeTask
//
//  Created by Hala on 11/05/2021.
//

import UIKit
import Firebase

class FoodSearchViewController: UIViewController {
    
    
    // variables
    lazy var searchBar = UISearchBar(frame: CGRect.zero)
    lazy var logout = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logoutTapped))
    
    
    
    var isFilled: Bool = false
    var filteredFoodTypes = [String]()
    var recipeSearchHistory = [String]()
    var presenter: FoodSearchPresenter?
    
    
    // outlets
    @IBOutlet weak var foodTypeTableView: UITableView!{
        didSet{
            foodTypeTableView.delegate = self
            foodTypeTableView.dataSource = self
            foodTypeTableView.tableFooterView = UIView(frame: CGRect.zero)
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        presenter = FoodSearchPresenter.init(view: self)
        presenter?.getRecipeSearchQueriesFromFile()
        
        configureUI()
    }
    
    
    
    init() {
        super.init(nibName: "FoodSearchViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func configureUI(){
        
        searchBar.delegate = self
        
        searchBar.placeholder = "search by recipe name"
        
        isFilled = false
        
        self.navigationItem.titleView = searchBar
        self.navigationItem.rightBarButtonItem = logout
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        foodTypeTableView.registerCell(cellClass: TextNameTableViewCell.self)
        
    }
    
    
    @objc func logoutTapped(){
        
        let loginViewController = LoginViewController()
        
        do{
            try Auth.auth().signOut()
            navigationController?.popToViewController(loginViewController, animated: true)
        }catch let error as NSError{
            print(error)
        }
    }
    

    
}


extension FoodSearchViewController: FoodSearchView{
    func startAnimating() {
        //
    }
    
    func stopAnimating() {
        //
    }
    
    func showDescriptionAlert(description: String) {
        ShowAlert.instance.showAlert(title: nil, message: description, style: .alert, view: self, okHandler: nil)
    }
    
    
}
