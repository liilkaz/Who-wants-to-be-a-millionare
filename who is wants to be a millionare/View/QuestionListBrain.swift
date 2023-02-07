//
//  QuestionListBrain.swift
//  who is wants to be a millionare
//
//  Created by Нахид Гаджалиев on 07.02.2023.
//

import Foundation

struct QuestionListBrain {
    
    var questionsList: [Int]
    var number: [Int]
    
    init() {
        questionsList = [1000000, 500000, 250000, 125000, 64000, 32000, 16000, 8000, 4000, 2000, 1000, 500, 300, 200, 100]
        number = [Int]()
        for num in 1...questionsList.count {
            number.append(num)
        }
        
        number.reverse()
    }
    
    func getQuestionsCount() -> Int {
        return questionsList.count
    }
    
}
