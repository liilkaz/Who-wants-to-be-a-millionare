//
//  QuestionListBrain.swift
//  who is wants to be a millionare
//
//  Created by Нахид Гаджалиев on 07.02.2023.
//

import Foundation

struct QuestionListBrain {
    
    var moneyList: [Int]
    var questionNumberArray: [Int]
    
    init() {
        moneyList = [1000000, 500000, 250000, 125000, 64000, 32000, 16000, 8000, 4000, 2000, 1000, 500, 300, 200, 100]
        questionNumberArray = [Int]()
        for num in 1...moneyList.count {
            questionNumberArray.append(num)
        }
        
        questionNumberArray.reverse()
    }
    
    func getQuestionsCount() -> Int {
        return moneyList.count
    }
    
    func checkQuestionNumber(index: Int) -> String {
        
        if index == 5 || index == 10 {
            return BackgroundColors.blue.rawValue
        } else if index == 15 {
            return BackgroundColors.yellow.rawValue
        } else {
            return BackgroundColors.purple.rawValue
        }
        
    }
    
    func checkingAnswer(currentNumber: Bool, trueFalse: Bool, indexForCheck: Int) -> String {
        if currentNumber && trueFalse {
            return BackgroundColors.green.rawValue
        } else if currentNumber && trueFalse == false {
            return BackgroundColors.red.rawValue
        } else {
            return checkQuestionNumber(index: indexForCheck)
        }
    }
    
}
