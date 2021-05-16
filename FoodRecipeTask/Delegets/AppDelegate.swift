//
//  AppDelegate.swift
//  FoodRecipeTask
//
//  Created by Hala on 10/05/2021.
//

import UIKit
import CoreData
import Firebase
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
        IQKeyboardManager.shared.enableAutoToolbar = false
        
        window = UIWindow()
        
        FirebaseApp.configure()
        

        isUserLogin()
        
        window?.makeKeyAndVisible()
        
        
        
        return true
    }


}


extension AppDelegate{
    
    func isUserLogin(){
        if Auth.auth().currentUser == nil{
            window?.rootViewController = UINavigationController(rootViewController: LoginViewController())
        }else{
            window?.rootViewController = UINavigationController(rootViewController: FoodSearchViewController())
        }

    }
    
}

