//
//  CategoriesViewModel.swift
//  Trivia
//
//  Created by Ana Lucia Blanco Cervantes on 16/09/22.
//

import Foundation

class CategoriesViewModel {
    private let categoriesService: CategoriesService
    var categories = [Category]()
    
    init(_ categoriesService: CategoriesService) {
        self.categoriesService = categoriesService
    }
    
    func getCategories(completion: @escaping () -> Void) {
        categoriesService.getCategories { [weak self] categories in
            self?.categories = categories
            completion()
        }
    }
}
