//
//  MoneyStackView.swift
//  who is wants to be a millionare
//
//  Created by Андрей Фроленков on 7.02.23.
//

import UIKit

class MoneyStackView: UIStackView {

    lazy var moneyCountLabel: UILabel = {
        return settingLabel(text: "Question 1", size: 20, alignment: .left)
    }()
    
    lazy var timerCountLabel: UILabel = {
        return settingLabel(text: "30", size: 70, alignment: .center)
    }()
    
    lazy var questionCountLabel: UILabel = {
        return settingLabel(text: "USD", size: 20, alignment: .right)
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
        addArrangedSubview(timerCountLabel)
        addArrangedSubview(questionCountLabel)
    }
    
    func settingLabel(text: String, size: CGFloat, alignment: NSTextAlignment) -> UILabel {
        
        let label = UILabel()
        label.text = text
        label.textAlignment = alignment
        label.textColor = .white
        label.font = .systemFont(ofSize: size)
        return label
        
    }
    
    func setTextForCountLabel(text: String) {
        timerCountLabel.text = text
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
