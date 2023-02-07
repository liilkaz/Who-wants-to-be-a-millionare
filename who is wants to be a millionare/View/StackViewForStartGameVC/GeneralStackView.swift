//
//  GeneralStackView.swift
//  who is wants to be a millionare
//
//  Created by Андрей Фроленков on 7.02.23.
//

import UIKit

class GeneralStackView: UIStackView {

    let questionStackView: QuestionStackView = {
        let stackView = QuestionStackView()
        return stackView
    }()
    
    let moneyStackView: MoneyStackView = {
        let stackView = MoneyStackView()
        return stackView
    }()

    let answerStackView: AnswerStackView = {
        let stackView = AnswerStackView()
        return stackView
    }()
    
    let promtStackView: PromtStackView = {
        let stackView = PromtStackView()
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        axis = .vertical
        alignment = .fill
        distribution = .equalSpacing
        translatesAutoresizingMaskIntoConstraints = false
        addArrangedAllSubview()
    }
    
    // MARK: addArrangedAllSubview
    private func addArrangedAllSubview() {
        
        addArrangedSubview(questionStackView)
        addArrangedSubview(moneyStackView)
        addArrangedSubview(answerStackView)
        addArrangedSubview(promtStackView)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
