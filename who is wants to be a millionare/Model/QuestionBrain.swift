//
//  QuestionBrain.swift
//  who is wants to be a millionare
//
//  Created by Нахид Гаджалиев on 07.02.2023.
//

import Foundation

struct QuestionBrain {
    
    private let easyQuestions = [
        Question(question: "Кого рыбак всегда видит издалека?", answers: ["Червяка", "Рыбовода", "Рыбнадзор", "Рыбака"].shuffled(), correctAnswer: "Рыбака"),
        Question(question: "Как называется острая мексиканская приправа?", answers: ["Сациви", "Пицца", "Чили", "Лечо"].shuffled(), correctAnswer: "Чили"),
        Question(question: "Какой вид транспорта, еще не имеет службы предварительного заказа билетов?", answers: ["Троллейбусный", "Морской", "Авиационный", "Железнодорожный"].shuffled(), correctAnswer: "Троллейбусный"),
        Question(question: "Какой вопрос, по определению, не требует ответа?", answers: ["Каверзный", "Философский", "Риторический", "Экзаменационный"].shuffled(), correctAnswer: "Риторический"),
        Question(question: "Сколько стран входит в состав Великобритании?", answers: ["4", "3", "1", "6"].shuffled(), correctAnswer: "4")
    ].shuffled()
    
    private let mediumQuestions = [
        Question(question: "Что означает имя Максим?", answers: ["Знания", "Умный", "Великий", "Величайший"].shuffled(), correctAnswer: "Величайший"),
        
        Question(question: "Сколько процентов из жизни ленивцы проводят во сне?", answers: ["70%", "80%", "75%", "85%"].shuffled(), correctAnswer: "75%"),
        
        Question(question: "Как называются новорождённые особи собаки?", answers: ["Котята", "Щенки", "Агнцы", "Кутята"].shuffled(), correctAnswer: "Кутята"),
        
        Question(question: "Из чего, согласно поговорке не выкинешь слов?", answers: ["Конституции", "Песни", "Газет", "Молитвы"].shuffled(), correctAnswer: "Песни"),
        
        Question(question: "Так называются дополнения к основному сюжету игры.", answers: ["Сториап", "Апгрейд", "Скилл", "Аддон"].shuffled(), correctAnswer: "Аддон"),
    ].shuffled()
    
    private let hardQuestions = [
        Question(question: "Какой период времени в жизни молодоженов начинается сразу после свадьбы?", answers: ["Мёртвый сезон", "Тихий час", "Медовый месяц", "Санитарный день"].shuffled(), correctAnswer: "Медовый месяц"),
        
        Question(question: "В честь чего был назван компьютер компании - Макинтош?", answers: ["Сорт яблок", "Населённый пункт", "Зонт", " Вид плаща"].shuffled(), correctAnswer: "Сорт яблок"),
        
        Question(question: "В каком году родился Владимир Набоков?", answers: ["1903", "1899","1889", "1900"].shuffled(), correctAnswer: "1899"),
        
        Question(question: "Когда прошел год дельфина?", answers: ["2002", "2011", "1994", "2007"].shuffled(), correctAnswer: "2007"),
        
        Question(question: "Кличка основателя группы Коррозия металла", answers: ["Скелет", "Горшок", "Ручейник", "Паук"].shuffled(), correctAnswer: "Паук"),
    ].shuffled()
    
    var questions: [Question]
    var moneyList = [100, 200, 300, 500, 1000, 2000, 4000, 8000, 16000, 32000, 64000, 125000, 250000, 500000, 1000000]
    var questionNumber = 0
    
    init() {
        questions = easyQuestions + mediumQuestions + hardQuestions
    }
    
    func saveMoneyButtonInteraction() -> Bool {
        if questionNumber == 0 {
            return false
        } else {
            return true
        }
    }
    
    func checkAnswer(answer userAnswer: String) -> Bool {
        if userAnswer == questions[questionNumber].correctAnswer {
            return true
        } else {
            return false
        }
    }
    
    func getMoney() -> Int {
        let money = moneyList[questionNumber]
        return money
    }
    
    func savedMoneyCheck() -> Int {
        if questionNumber == 0 {
            return 0
        } else {
            return moneyList[questionNumber - 1]
        }
    }
    
    func getQuestionText() -> String {
        let text = questions[questionNumber].question
        return text
    }
    
    func getQuestion() -> Question {
        return questions[questionNumber]
    }
    
    func getQuestionTextButton() -> [String] {
        let text = questions[questionNumber].answers
        return text
    }
    
    func getFiftyFiftyArray() -> [String] {
        
        let currentQuestion = questions[questionNumber]
        var uncorrectAnswers = [String]()
        var array = [String]()
        
        for item in currentQuestion.answers where item != currentQuestion.correctAnswer {
            uncorrectAnswers.append(item)
        }
        
        guard let randomUncorrectAnswer = uncorrectAnswers.randomElement() else { fatalError() }
        
        for item in currentQuestion.answers {
            if item == currentQuestion.correctAnswer || item == randomUncorrectAnswer {
                array.append(item)
            } else {
                array.append(" ")
            }
        }
        
        return array
    }
    
    mutating func nextQuestion() {
        if questionNumber < questions.count - 1 {
            questionNumber += 1
        } else {
            questionNumber = 0
        }
    }
    
}

