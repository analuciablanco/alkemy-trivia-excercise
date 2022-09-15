//
//  CategoriesService.swift
//  Trivia
//
//  Created by Ana Lucia Blanco Cervantes on 15/09/22.
//

import Foundation
import Alamofire

class CategoriesService {
    private let categoriesURL = "https://opentdb.com/api_category.php"
    
    struct Categories: Codable {
        let trivia_categories: [Category]
    }
    
    private let apiClient = AlamofireAPIClient()
    
    func getCategories(completion: @escaping ([Category]) -> Void) {
        apiClient.get(url: categoriesURL, forModel: Categories.self) { response in
            switch response {
            case .success(let data):
                completion(data.trivia_categories)
            case .failure(_):
                completion([])
            }
        }
    }
    
    func postNewCategory(_ item: [String: String]) {
        apiClient.post(url: categoriesURL, parameters: item)
    }
}
