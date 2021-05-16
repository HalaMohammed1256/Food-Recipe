//
//  FoodTypePresenter.swift
//  FoodRecipeTask
//
//  Created by Hala on 14/05/2021.
//

import Foundation


protocol FoodSearchView: class{

    func showDescriptionAlert(description: String)
    
}


protocol FoodSearcViewPresenter{
    
    init(view: FoodSearchView)
    func getRecipeSearchQueriesFromFile()
    
}

class FoodSearchPresenter: FoodSearcViewPresenter{
    
    weak var view: FoodSearchView?
    var foodTypes = [String]()
    
    required init(view: FoodSearchView) {
        self.view = view
    }
    
    func getRecipeSearchQueriesFromFile(){
                
        // used when the file exist in xcode project
        guard let path = Bundle.main.path(forResource: K.recipeSearchFileName, ofType: "txt") else{
            return
        }
        
        do{
            
            let readFile = try String(contentsOfFile: path, encoding: String.Encoding.utf8)
            foodTypes = readFile.components(separatedBy: "\r")
                                    
        }catch let error as NSError {
            print(error)
        }
        
        // another way if file not exist in xcode but some time not working with emulator and also xcode cant find it
        
        /*
         // file name
         let fileName = "recipe"
         
         
         // FileManager => provide us with the document directory for the current user
         // FileManager.default => built in system type that let us work with a file system
         let documentDirectoryUrl = try! FileManager.default.url(
         for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true
         )
         
         // to get file path
         let fileUrl = documentDirectoryUrl.appendingPathComponent(fileName).appendingPathExtension("txt")
         print(fileUrl)
         
         do {
         
         let readFile = try String(contentsOf: fileUrl, encoding: .utf8)
         
         foodTypes = readFile.components(separatedBy: "\n")
         
         
         } catch let error as NSError {
         print(error)
         }
         */
        
        
    }
    
    
}
