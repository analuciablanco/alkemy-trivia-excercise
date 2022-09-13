//
//  initialViewController.swift
//  Trivia
//
//  Created by Ana Lucia Blanco Cervantes on 02/09/22.
//

import UIKit

final class initialViewController: UIViewController {
    
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var userTextField: UITextField!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        print("1 viewDidLoad invocado")
        
        propertiesSetup()
        self.hideKeyboardWhenTappedAround()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("2 viewWillAppear invocado")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("3 viewDidAppear invocado")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("4 viewWillDisappear invocado")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("5 viewDidDisappear invocado")
    }
    
    // MARK: - actions
    @IBAction func hideKeyboardOnButtonPressed(_ sender: Any) {
        self.view.endEditing(true)
    }
    @IBAction func goToInfoView(_ sender: Any) {
        let vc = InfoViewController(nibName: "InfoViewController", bundle: nil)
        self.navigationController?.present(vc, animated: true)
    }
    
    @IBAction func startTriviaTapped(_ sender: Any) {
        if userTextField.hasText {
            let vc = QuestionViewController(
                nibName: "QuestionViewController",
                bundle: nil)
            self.navigationController?.pushViewController(vc, animated: true)
        }
        else {
            print("Por favor ingrese un nombre de usuario primero.")
        }
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
