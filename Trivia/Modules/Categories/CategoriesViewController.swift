//
//  CategoriesViewController.swift
//  Trivia
//
//  Created by Ana Lucia Blanco Cervantes on 13/09/22.
//

import UIKit

class CategoriesViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel: CategoriesViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = CategoriesViewModel(CategoriesService())
        
        viewModel?.getCategories(completion: { [weak self] in
            self?.tableView.reloadData()
        })

        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
}

// MARK: - TableView
extension CategoriesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.categories.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.accessoryType = .disclosureIndicator
        
        var contentConfig = cell.defaultContentConfiguration()
        contentConfig.textProperties.font = UIFont.systemFont(ofSize: 24)
        contentConfig.text = viewModel?.categories[indexPath.row].name

        cell.contentConfiguration = contentConfig
        
        return cell
    }
}

extension CategoriesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
}
