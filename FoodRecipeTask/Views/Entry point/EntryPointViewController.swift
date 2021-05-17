//
//  EntryPointViewController.swift
//  FoodRecipeTask
//
//  Created by Hala on 17/05/2021.
//

import UIKit
import Firebase

class EntryPointViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = MainColors.primaryColor
        isUserLogin()
        
//        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    

    func isUserLogin(){
        
        let loginViewController = LoginViewController()
        let foodSearchViewController = FoodSearchViewController()
        
        
        if Auth.auth().currentUser == nil{
            navigationController?.pushViewController(loginViewController, animated: true)
        }else{
            navigationController?.pushViewController(foodSearchViewController, animated: true)
        }

    }

}
