//
//  CategoriesService.swift
//  Trivia
//
//  Created by Ana Lucia Blanco Cervantes on 15/09/22.
//

import Foundation
import Alamofire

class CategoriesService {
    struct Categories: Codable {
        let trivia_categories: [Category]
    }
    
    let apiClient = AlamofireAPIClient()
    
    func getCategories(completion: @escaping ([Category]) -> Void) {
        let categoriesURL = "https://opentdb.com/api_category.php"
        
        apiClient.get(url: categoriesURL, forModel: Categories.self) { response in
            switch response {
            case .success(let data):
                completion(data.trivia_categories)
            case .failure(_):
                completion([])
            }
        }
    }
}
