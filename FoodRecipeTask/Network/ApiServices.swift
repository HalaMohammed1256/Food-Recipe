//
//  ApiServices.swift
//  FoodRecipeTask
//
//  Created by Hala on 14/05/2021.
//

import Foundation
import Alamofire



class ApiServices{
    
    // singletone
    static let instance = ApiServices()
    

    
    func getResponses<T: Decodable>(url: String, parameters: Parameters, completion: @escaping(T?, Error?) ->Void){
//        let parameters: Parameters = ["q": id, "rId": id]

        Alamofire.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default).responseJSON { (response) in
            guard let responseData = response.data else{
                return
            }

            do{
                let decoder = JSONDecoder()
                let data = try decoder.decode(T.self, from: responseData)
                completion(data, nil)
            }catch{
                completion(nil, error)
            }            
        }
    }
}



