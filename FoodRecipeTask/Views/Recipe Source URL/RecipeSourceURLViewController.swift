//
//  RecipeSourceURLViewController.swift
//  FoodRecipeTask
//
//  Created by Hala on 14/05/2021.
//

import UIKit
import WebKit

class RecipeSourceURLViewController: UIViewController {
    
    
    // variables
    var recipeSourceURL: String?
    
    
    // outlets
    @IBOutlet weak var recipeSourceWKWebView: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadRecipeSourcePage()
        
    }


    func loadRecipeSourcePage(){
        
        guard let urlString = recipeSourceURL else {
            return
        }
        
        
        guard let url = URL(string: urlString) else {
            return
        }
                
            
        recipeSourceWKWebView.load(URLRequest(url: url))
    }

}
