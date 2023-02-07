//
//  QuestionModel.swift
//  who is wants to be a millionare
//
//  Created by Нахид Гаджалиев on 07.02.2023.
//

import Foundation

struct Question {
    var question: String
    var answers: [String]
    var correctAnswer: String
    
    init(question: String, answers: [String], correctAnswer: String) {
        self.question = question
        self.answers = answers
        self.correctAnswer = correctAnswer
    }
}
