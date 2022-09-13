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
    private let questions = Contenido.shared.obtenerPreguntas()
    private var currentQuestionIndex = 0
    
    // MARK: - Lifecyle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setCurrentQuestion(for: currentQuestionIndex)
    }
    
    // MARK: - Actions
    @IBAction func correctAnswerTapped(_ sender: Any) {
        let result = validateCurrentQuestion(answer: true)
        sendResultMessage(for: result)
    }
    
    @IBAction func wrongAnswerTapped(_ sender: Any) {
        let result = validateCurrentQuestion(answer: false)
        sendResultMessage(for: result)
    }
    
    // MARK: - Methods
    private func updateQuestion() {
        currentQuestionIndex += 1
        setCurrentQuestion(for: currentQuestionIndex)
    }
    
    private func setCurrentQuestion(for index: Int) {
        if index < questions.count {
            questionLabel.text = questions[index].question
        } else {
            currentQuestionIndex = 0
            questionLabel.text = questions[currentQuestionIndex].question
        }
    }
    
    private func validateCurrentQuestion(answer: Bool) -> Bool {
        questions[currentQuestionIndex].answer == answer
    }
    
    private func sendResultMessage(for result: Bool) {
        let message = result ? "La respuesta es correcta! 🥳" : "La respuesta es incorrecta 😔"
        
        let alert = UIAlertController(title: "Respuesta", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Siguiente", style: .default, handler: { action in
            self.updateQuestion()
        }))
        
        self.present(alert, animated: true)
    }
}
