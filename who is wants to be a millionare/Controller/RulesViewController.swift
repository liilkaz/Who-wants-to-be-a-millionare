//
//  RulesViewController.swift
//  who is wants to be a millionare
//
//  Created by Magomadov on 09.02.2023.
//

import UIKit

class RulesViewController: UIViewController {
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "background")
        imageView.frame = self.view.bounds
        return imageView
    }()
    
    private lazy var textView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        textView.backgroundColor = .clear
        textView.text = """
    Вы должны правильно ответить на ряд вопросов с несколькими вариантами ответов, чтобы перейти на следующий уровень. Всего 15 вопросов, каждый вопрос стоит определенной суммы денег, нет никаких временных ограничений для предоставления ответа (для ответа на каждый вопрос дается 30 секунд). Также Вы получаете три вида подсказок, если Вы застряли на конкретном вопросе.
    Вопросы “Кто хочет стать миллионером?” структурированы в соответствии с пятью различными уровнями, причем уровень сложности постепенно увеличивается. Каждый уровень содержит пять вопросов. Вопросы, сгруппированные на одном уровне, будут иметь одинаковую сложность.
    Важно помнить, что вопросы, составляющие каждый уровень, не обязательно будут относиться к одним и тем же или даже сходным темам, но их общий уровень сложности будет одинаковым. Немаловажно, что уровни вопросов не следует путать с «несгораемыми суммами» или структурой ценностей вопросов, что они собой являют объясняется ниже.
   - Вопрос 1 - 100 руб.
   - Вопрос 2 - 200 руб.
   - Вопрос 3 - 300 руб.
   - Вопрос 4 - 500 руб.
   - Вопрос 5 - 1000 руб. Первая несгораемая сумма.
    Если участники неправильно отвечают на последний (5-й) вопрос, то они уходят ни с чем. Если на этот вопрос дан правильный ответ, участникам гарантируется 1000 рублей, даже если дадут неверный ответ до достижения следующей несгораемой суммы в десятом вопросе.
   - Вопрос 6 - 2000 руб.
   - Вопрос 7 - 4000 руб.
   - Вопрос 8 - 8000 руб.
   - Вопрос 9 - 16 000 руб.
   - Вопрос 10 - 32 000 руб. Вторая несгораемая сумма.
   - Если участники неправильно ответят на этот (10-й) вопрос, они уйдут с 1000 рублей. Если на этот вопрос ответили верно, игрокам гарантируется 32 000 рублей, даже если дадут неверный ответ до достижения вопроса 15.
   - Вопрос 11 - 64 000 руб.
   - Вопрос 12 - 125 000 руб.
   - Вопрос 13 - 250 000 руб.
   - Вопрос 14 - 500 000 руб.
   - Вопрос 15 - 1 000 000 руб.

        Подсказки

        Вам разрешается применить три подсказки, которые Вы можете использовать в любой момент викторины. Каждая из подсказок может быть использована только один раз.
    1. 50/50 - исключает два неправильных ответа, оставляя участнику только один правильный и один неправильный вариант. Это означает, что у него есть шанс 50/50.
    2. Задать вопрос аудитории - залу задают тот же вопрос, что и участнику, и проводится быстрый опрос. На диаграмме показывается явное преимущество определенного варианта, эта подсказка может быть чрезвычайно полезной.
    3. Звонок другу - Вам разрешается сделать 30-секундный звонок другу или члену семьи и спросить, знают ли они ответ на вопрос.
"""
        return textView
    }()
    
    // Добавляю тайтл и бар айтем. Также метод рулесДисмисс
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Правила игры"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Назад",
                                                           style: .plain,
                                                           target: self, action:
                                                            #selector(rulesDismiss))
        
        view.addSubview(imageView)
        view.addSubview(textView)
        
        setupViewsConstraints()
    }
    
    @objc private func rulesDismiss() {
        dismiss(animated: true)
    }
    // конец редакции
}


//MARK: - Setup Views
extension RulesViewController {
    private func setupViewsConstraints() {
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        textView.translatesAutoresizingMaskIntoConstraints = false


        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.rightAnchor.constraint(equalTo: view.rightAnchor),
            imageView.leftAnchor.constraint(equalTo: view.leftAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            textView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            textView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            textView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor)
        ])
        
    }
    
}
