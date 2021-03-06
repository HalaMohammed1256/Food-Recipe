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
        
        
        
        window?.rootViewController = UINavigationController(rootViewController: EntryPointViewController())
        
        window?.makeKeyAndVisible()
        
        
        
        return true
    }


}

