//
//  RulesView.swift
//  who is wants to be a millionare
//
//  Created by Magomadov on 07.02.2023.
//

import UIKit 

class RulesController: UIViewController {
    
private lazy var scrollView: UIScrollView = {
    let scrollView = UIScrollView()
    scrollView.backgroundColor = .gray
    scrollView.frame = self.view.bounds
    scrollView.contentSize = contentSizzze
    return scrollView
}()

private lazy var contentView: UIView = {
    let contentView = UIView()
    contentView.backgroundColor = .gray
    contentView.frame.size = contentSizzze
    return contentView
}()
    private let textView: UITextView = {
        let textView = UITextView()
        textView.font?.withSize(40)
        textView.backgroundColor = .gray
        textView.text = """
                                            Правила игры

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

private var contentSizzze: CGSize {
    CGSize(width: view.frame.width, height: view.frame.height + 400)
}

override func viewDidLoad() {
    super.viewDidLoad()
    
    view.addSubview(scrollView)
    scrollView.addSubview(contentView)
    contentView.addSubview(textView)

    setupViewsConstraints()
}
}


//MARK: - Setup Views
extension RulesController {
private func setupViewsConstraints() {
    textView.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
        textView.topAnchor.constraint(equalTo: contentView.topAnchor),
        textView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
        textView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
        textView.heightAnchor.constraint(equalTo: contentView.heightAnchor)
    ])
    
}


}
