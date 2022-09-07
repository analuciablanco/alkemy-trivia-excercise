//
//  initialViewController.swift
//  Trivia
//
//  Created by Ana Lucia Blanco Cervantes on 02/09/22.
//

import UIKit

class initialViewController: UIViewController {

    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var userTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        propertiesSetup()
        self.hideKeyboardWhenTappedAround()
    }
    
    // MARK: - actions
    @IBAction func hideKeyboardOnButtonPressed(_ sender: Any) {
        self.view.endEditing(true)
    }
    
    @IBAction func startTriviaTapped(_ sender: Any) {
        guard let name = userTextField.text else {
            return print("El campo usuario está vacío.")
        }
        return print("El nombre del usuario es \(name).")
    }
    
    // MARK: - setup
    func propertiesSetup() {
        logoImage.circleImage()
    }
    
    // MARK: - constraints
    func addLogoConstraints() {
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        logoImage.topAnchor.constraint(equalTo: view.topAnchor,constant: 100).isActive = true
        logoImage.widthAnchor.constraint(equalToConstant: 150).isActive = true
        logoImage.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        let centerHorizontal = logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        NSLayoutConstraint.activate([centerHorizontal])
    }
}
