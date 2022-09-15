//
//  AlamofireAPIClient.swift
//  Trivia
//
//  Created by Ana Lucia Blanco Cervantes on 15/09/22.
//

import Foundation
import Alamofire

class AlamofireAPIClient {
    func get<T: Codable>(url: String, forModel: T.Type, completion: @escaping(Result<T, AFError>) -> Void) {
        AF.request(url).responseDecodable(of: forModel) { response in
            completion(response.result)
        }
    }
}
