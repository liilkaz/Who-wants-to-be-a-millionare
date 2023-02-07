//
//  QuestionCellBrain.swift
//  who is wants to be a millionare
//
//  Created by Нахид Гаджалиев on 07.02.2023.
//

import Foundation

struct QuestionCellBrain {
    
    func checkQuestionNumber(questionNumber: Int) -> BackgroundColors {
        if questionNumber == 5 || questionNumber == 10 {
            return .blue
        } else if questionNumber == 15 {
            return .yellow
        } else {
            return .purple
        }
    }
    
}

enum BackgroundColors: String {
    case yellow
    case blue
    case purple
    case green
    case red
}
