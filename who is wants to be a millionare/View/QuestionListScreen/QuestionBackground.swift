//
//  QuestionBackground.swift
//  who is wants to be a millionare
//
//  Created by Нахид Гаджалиев on 07.02.2023.
//

import UIKit

// MARK: - Отдельный класс для списка вопросов
class QuestionBackground: UIImageView {
    
    lazy var questionNumberLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemBackground
        label.font = .systemFont(ofSize: 18)
        
        return label
    }()
    
    lazy var moneyLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemBackground
        label.font = .systemFont(ofSize: 18)
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentMode = .scaleToFill
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(questionNumberLabel)
        addSubview(moneyLabel)
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        questionNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        moneyLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            questionNumberLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            questionNumberLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            moneyLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            moneyLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

