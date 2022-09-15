//
//  CategoriesViewController.swift
//  Trivia
//
//  Created by Ana Lucia Blanco Cervantes on 13/09/22.
//

import UIKit

class CategoriesViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var categories: [Category] = [
        Category(id: 0, name: "Primera"),
        Category(id: 1, name: "Segunda")
    ]
    
    override func viewWillAppear(_ animated: Bool) {
        reloadCategories()
        print("table reloaded")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    private func reloadCategories() {
        tableView.reloadData()
    }
    
    // MARK: - Methods
    
    private func showQuestions(for category: Category) {
        let questionVC = QuestionViewController(nibName: "QuestionViewController", bundle: nil)
        questionVC.title = category.name
//        questionVC.categoryId = category.id
        
        self.navigationController?.pushViewController(questionVC, animated: true)
    }
}

// MARK: - TableView dependencies
extension CategoriesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.accessoryType = .disclosureIndicator
        
        var contentConfig = cell.defaultContentConfiguration()
        contentConfig.textProperties.font = UIFont.systemFont(ofSize: 24)
        contentConfig.text = categories[indexPath.row].name

        cell.contentConfiguration = contentConfig
        
        return cell
    }
}

extension CategoriesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
}
