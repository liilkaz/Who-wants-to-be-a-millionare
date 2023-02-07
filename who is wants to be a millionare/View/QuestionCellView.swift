//
//  QuestionCellView.swift
//  who is wants to be a millionare
//
//  Created by Нахид Гаджалиев on 06.02.2023.
//

import UIKit

class QuestionCellView: UITableViewCell {
    
    static let identifier = "questionCellView"
    private var questionCellBrain = QuestionCellBrain()
    
    lazy var backgroundImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        
        return image
    }()
    
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(backgroundImage)
        backgroundColor = .clear
        backgroundImage.addSubview(questionNumberLabel)
        backgroundImage.addSubview(moneyLabel)
        isUserInteractionEnabled = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        questionNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        moneyLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backgroundImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 40),
            backgroundImage.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -40),
            backgroundImage.heightAnchor.constraint(equalTo: self.heightAnchor, constant: -5),
            
            questionNumberLabel.leftAnchor.constraint(equalTo: backgroundImage.leftAnchor, constant: 5),
            questionNumberLabel.centerYAnchor.constraint(equalTo: backgroundImage.centerYAnchor),
            
            moneyLabel.rightAnchor.constraint(equalTo: backgroundImage.rightAnchor, constant: 5),
            moneyLabel.centerYAnchor.constraint(equalTo: backgroundImage.centerYAnchor),
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        questionNumberLabel.text = nil
        moneyLabel.text = nil
    }
    
    func configure(money: Int, numberOfQuestion: Int) {
        
        backgroundImage.image = UIImage(named: questionCellBrain.checkQuestionNumber(questionNumber: numberOfQuestion).rawValue)
        questionNumberLabel.text = "Вопрос \(numberOfQuestion)"
        moneyLabel.text = "\(money) ₽"
        
    }
    
}
