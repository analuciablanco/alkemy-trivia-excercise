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
    
    func post(url: String, parameters: [String: String]) {
        AF.request(url,
                   method: .post,
                   parameters: parameters,
                   encoding: JSONEncoding.default)
        .response { response in
            switch response.result {
            case .success(_):
                print("Se dio de alta correctamente una categoria")
            case .failure(let error):
                print("Error en post", error)
            }
        }
    }
}
