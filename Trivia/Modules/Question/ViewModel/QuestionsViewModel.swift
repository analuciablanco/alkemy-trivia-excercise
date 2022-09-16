//
//  QuestionsViewModel.swift
//  Trivia
//
//  Created by Ana Lucia Blanco Cervantes on 16/09/22.
//

import Foundation

class QuestionsViewModel {
    private let questionsService: QuestionsService
    var questions = [Question]()
    var currentQuestionIndex = 0
    
    init(_ questionsService: QuestionsService) {
        self.questionsService = questionsService
        self.questions = questionsService.getQuestions()
        print(questions)
    }
    
    func updateQuestion() {
        currentQuestionIndex += 1
    }
    
    func setCurrentQuestion() -> String {
        if currentQuestionIndex < questions.count {
            return questions[currentQuestionIndex].question
        } else {
            currentQuestionIndex = 0
            return questions[currentQuestionIndex].question
        }
    }
    
    func validateCurrentQuestion(answer: Bool) -> Bool {
        questions[currentQuestionIndex].answer == answer
    }
}
