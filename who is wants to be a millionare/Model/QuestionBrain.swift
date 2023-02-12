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
        Question(question: "Сколько стран входит в состав Великобритании?", answers: ["4", "3", "1", "6"].shuffled(), correctAnswer: "4"),
        Question(question: "Угадайте мультфильм или персонажа по фразам. ,,Феноменально,,", answers: ["Звёздочкин", "Лосяш", "Знайка", "Незнайка"].shuffled(), correctAnswer: "Лосяш"),
        Question(question: "Что никогда не вырастет на дереве?", answers: ["Груша", "Яблоко", "Арбуз", "Вишня"].shuffled(), correctAnswer: "Арбуз"),
        Question(question: "Чтобы приготовить Колобок, старуха намела...", answers: ["Снега", "Листьев", "Сена", "Муки"].shuffled(), correctAnswer: "Муки"),
        Question(question: "Какие колбаски существуют на самом деле?", answers: ["Коризо", "Моризо", "Форизо", "Чоризо"].shuffled(), correctAnswer: "Чоризо"),
        Question(question: "Как звучит самое распространённое телефонное приветствие?", answers: ["Чао", "Гамарджоба", "Пронто", "Алло"].shuffled(), correctAnswer: "Алло"),
        Question(question: "Какой европейский город прославился своими модными тенденциями?", answers: ["Манчестер", "Севилья", "Гамбург", "Милан"].shuffled(), correctAnswer: "Милан"),
        Question(question: "Что даёт дерево сорта антоновка?", answers: ["Мандарины", "Апельсины", "Груши", "Яблоки"].shuffled(), correctAnswer: "Яблоки"),
        Question(question: "Как называют человека, который очень много ест?", answers: ["Полиглот", "Дистрофик", "Кусочник", "Обжора"].shuffled(), correctAnswer: "Обжора"),
        Question(question: "Один из самых богатых людей мира?", answers: ["Пушкин", "Н. Михалков", "Пугачёва", "Б. Гейтс"].shuffled(), correctAnswer: "Б. Гейтс"),
        Question(question: "Какой общий ингредиент есть у эскимо и колбасы?", answers: ["Сахар", "Шоколад", "Молоко", "Все ответы верны"].shuffled(), correctAnswer: "Все ответы верны"),
    ].shuffled()
    
    private let mediumQuestions = [
        Question(question: "Что означает имя Максим?", answers: ["Знания", "Умный", "Великий", "Величайший"].shuffled(), correctAnswer: "Величайший"),
        
        Question(question: "Сколько процентов из жизни ленивцы проводят во сне?", answers: ["70%", "80%", "75%", "85%"].shuffled(), correctAnswer: "75%"),
        
        Question(question: "Как называются новорождённые особи собаки?", answers: ["Котята", "Щенки", "Агнцы", "Кутята"].shuffled(), correctAnswer: "Кутята"),
        
        Question(question: "Из чего, согласно поговорке не выкинешь слов?", answers: ["Конституции", "Песни", "Газет", "Молитвы"].shuffled(), correctAnswer: "Песни"),
        
        Question(question: "Так называются дополнения к основному сюжету игры.", answers: ["Сториап", "Апгрейд", "Скилл", "Аддон"].shuffled(), correctAnswer: "Аддон"),
        
        Question(question: "Кто живёт в Австралии?", answers: ["Злыдня", "Хитрюга", "Дюдюка Барбидокская", "Ехидна"].shuffled(), correctAnswer: "Ехидна"),
        Question(question: "Название какого города переводится как Белый холм?", answers: ["Астана", "Кызыл орда", "Караганда", "Актобе"].shuffled(), correctAnswer: "Актобе"),
        Question(question: "Как называлась деревня в которой жили дядя Фёдор, Матроскин и Шарик?", answers: ["Йогуртово", "Молочное", "Простофилино", "Простоквашино"].shuffled(), correctAnswer: "Простоквашино"),
        Question(question: "Какую из этих аббревиатур на всю жизнь запомнят миллионы обманутых вкладчиков?", answers: ["АКМ", "КЛМ", "ДДТ", "МММ"].shuffled(), correctAnswer: "МММ"),
        Question(question: "Как звали пушкинского Онегина?", answers: ["Александр", "Иван", "Михаил", "Евгений"].shuffled(), correctAnswer: "Евгений"),
        Question(question: "Какое из этих женских имен в переводе с латинского означает ,,Победа,,?", answers: ["Олимпиада", "Ноябрина", "Капитолина", "Виктория"].shuffled(), correctAnswer: "Виктория"),
        Question(question: "Какой витамин не содержится в дыне?", answers: ["P", "C", "A", "М"].shuffled(), correctAnswer: "М"),
        Question(question: "Какое определение человеческого характера приписывают ослу?", answers: ["Упорный", "Уступчивый", "Усердный", "Упрямый"].shuffled(), correctAnswer: "Упрямый"),
        Question(question: "Как часто называют молодого барашка?", answers: ["Кефирный", "Сливочный", "Шоколадный", "Молочный"].shuffled(), correctAnswer: "Молочный"),
        Question(question: "Как звали доброго дедушку, спасшего зайчиков?", answers: ["Мамай", "Макар", "Масай", "Мазай"].shuffled(), correctAnswer: "Мазай")
        
    ].shuffled()
    
    private let hardQuestions = [
        Question(question: "Какой период времени в жизни молодоженов начинается сразу после свадьбы?", answers: ["Мёртвый сезон", "Тихий час", "Медовый месяц", "Санитарный день"].shuffled(), correctAnswer: "Медовый месяц"),
        
        Question(question: "В честь чего был назван компьютер компании - Макинтош?", answers: ["Сорт яблок", "Населённый пункт", "Зонт", " Вид плаща"].shuffled(), correctAnswer: "Сорт яблок"),
        
        Question(question: "В каком году родился Владимир Набоков?", answers: ["1903", "1899","1889", "1900"].shuffled(), correctAnswer: "1899"),
        
        Question(question: "Когда прошел год дельфина?", answers: ["2002", "2011", "1994", "2007"].shuffled(), correctAnswer: "2007"),
        
        Question(question: "Кличка основателя группы Коррозия металла", answers: ["Скелет", "Горшок", "Ручейник", "Паук"].shuffled(), correctAnswer: "Паук"),
        Question(question: "Этот строительный материал НЕ входит в состав Пирамиды Хеопса.", answers: ["Базальт", "Гранит", "Известня", "Асбест"].shuffled(), correctAnswer: "Асбест"),
        Question(question: "В каком году появился Дзержинский район?", answers: ["1935", "1932", "1934", "1933"].shuffled(), correctAnswer: "1933"),
        Question(question: "Сколько весила самая маленькая собака?", answers: ["105 грамм", "113 грамм", "109 грамм", "102 грамма"].shuffled(), correctAnswer: "113 грамм"),
        Question(question: "Какой металл обязательно присутствует в амальгаме?", answers: ["Свинец", "Серебро", "Ртуть", "Молоко"].shuffled(), correctAnswer: "Ртуть"),
        Question(question: "Найдите название ягоды.", answers: ["Плмарикд", "Печаак", "Цичкао", "Уаибкклн"].shuffled(), correctAnswer: "Уаибкклн"),
        Question(question: "Какой британский монах больше всех пробыл на троне?", answers: ["Елизавета I", "Ричард I", "Генрих VIII", "Виктория"].shuffled(), correctAnswer: "Виктория"),
        Question(question: "Какую станцию украшают мозаичные панно художника А. Дайнеки?", answers: ["Таганскую", "Сокольники", "Китай-город", "Маяковскую"].shuffled(), correctAnswer: "Маяковскую"),
        Question(question: "Что лишнее?", answers: ["Пироп", "Хризолит", "Аметист", "Флюорит"].shuffled(), correctAnswer: "Флюорит"),
        Question(question: "Какая страна, использующая правостороннее движение на автомобильных дорогах, имеет левостороннее железнодорожное сообщение?", answers: ["США", "Китай", "Германия", "Франция"].shuffled(), correctAnswer: "Франция"),
        Question(question: "Представители трёх поколений этой политической династии стали объектами терактов. Какой?", answers: ["Кеннеди", "Бхутто", "Рабин", "Ганди"].shuffled(), correctAnswer: "Ганди"),
    ].shuffled()
    
    var questions = [Question]()
    var moneyList = [100, 200, 300, 500, 1000, 2000, 4000, 8000, 16000, 32000, 64000, 125000, 250000, 500000, 1000000]
    var questionNumber = 0
    
    init() {
        
        for index in 0...4 {
            questions.append(easyQuestions[index])
        }
        for index in 0...4 {
            questions.append(mediumQuestions[index])
        }
        for index in 0...4 {
            questions.append(hardQuestions[index])
        }

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
    
    func askTheAudienceResult() -> [Int] {
        
        let currentQuestion = questions[questionNumber]
        var indexCorrectAnswer = 0
        
        for i in 0...currentQuestion.answers.count - 1 {
            if currentQuestion.answers[i] == currentQuestion.correctAnswer {
                indexCorrectAnswer = i
            }
        }

        var rightAnswerPercent = 0
        var firstWrongAnswerPercent = 0
        var secondWrongAnswerPercent = 0
        var thirdWrongAnswerPercent = 0
        var firstCase: Double = 70
        var secondCase: Double = 80
        var thirdCase: Double = 90
        
        if questionNumber >= 10 {
            firstCase = 50
            secondCase = 66.7
            thirdCase = 83.4
        }
        
        for _ in 1...100 {
            
            func randomPercent() -> Double {
                return Double(arc4random() % 1000) / 10.0;
            }
            let randomNumber = randomPercent()
            
            switch(randomNumber) {
            case 0..<firstCase:
                rightAnswerPercent += 1
            case firstCase..<secondCase:
                firstWrongAnswerPercent += 1
            case secondCase..<thirdCase:
                secondWrongAnswerPercent += 1
            case thirdCase..<100:
                thirdWrongAnswerPercent += 1
            default:
                break
            }
            
        }
        
        var array = [firstWrongAnswerPercent, secondWrongAnswerPercent, thirdWrongAnswerPercent]
        array.insert(rightAnswerPercent, at: indexCorrectAnswer)
        
        return array
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

