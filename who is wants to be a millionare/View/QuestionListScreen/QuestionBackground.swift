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
        label.textAlignment = .left
        
        return label
    }()
    
    lazy var moneyLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemBackground
        label.font = .systemFont(ofSize: 18)
        label.textAlignment = .right
        
        return label
    }()
    
    lazy var stackLabel: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [questionNumberLabel, moneyLabel])
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentMode = .scaleToFill
        addSubview(stackLabel)
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        stackLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            stackLabel.topAnchor.constraint(equalTo: topAnchor),
            stackLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 10),
            stackLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            stackLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

