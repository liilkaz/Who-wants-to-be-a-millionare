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
    var money: Int
    
    init(question: String, answers: [String], correctAnswer: String, money: Int) {
        self.question = question
        self.answers = answers
        self.correctAnswer = correctAnswer
        self.money = money
    }
}
