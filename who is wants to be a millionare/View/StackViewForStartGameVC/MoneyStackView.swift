//
//  MoneyStackView.swift
//  who is wants to be a millionare
//
//  Created by Андрей Фроленков on 7.02.23.
//

import UIKit

class MoneyStackView: UIStackView {

    let moneyCountLabel: UILabel = {
        let label = UILabel()
        label.text = "Question 1"
        label.textColor = .white
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    
    let questionCountLabel: UILabel = {
        let label = UILabel()
        label.text = "USD"
        label.textAlignment = .right
        label.textColor = .white
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        axis = .horizontal
        alignment = .fill
        distribution = .fillEqually
        
        addArrangedAllSubview()
    }
    
    // MARK: addArrangedAllSubview
    private func addArrangedAllSubview() {
        
        addArrangedSubview(moneyCountLabel)
        addArrangedSubview(questionCountLabel)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
