//
//  QuestionViewController.swift
//  Trivia
//
//  Created by Ana Lucia Blanco Cervantes on 07/09/22.
//

import UIKit

final class QuestionViewController: UIViewController {
    // MARK: - IB outlets
    @IBOutlet weak var questionLabel: UILabel!
    
    // MARK: - Properties
    private var viewModel = QuestionsViewModel(QuestionsService.shared)
    
    // MARK: - Lifecyle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.questionLabel.text = viewModel.setCurrentQuestion()
    }
    
    // MARK: - Actions
    @IBAction func correctAnswerTapped(_ sender: Any) {
        let result = viewModel.validateCurrentQuestion(answer: true)
        sendResultMessage(for: result)
    }
    
    @IBAction func wrongAnswerTapped(_ sender: Any) {
        let result = viewModel.validateCurrentQuestion(answer: false)
        sendResultMessage(for: result)
    }
    
    // MARK: - Methods
    private func sendResultMessage(for result: Bool) {
        let message = result ? "La respuesta es correcta! 🥳" : "La respuesta es incorrecta 😔"
        
        let alert = UIAlertController(title: "Respuesta", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Siguiente", style: .default, handler: { action in
            self.viewModel.updateQuestion()
            self.questionLabel.text = self.viewModel.setCurrentQuestion()
        }))
        
        self.present(alert, animated: true)
    }
}
