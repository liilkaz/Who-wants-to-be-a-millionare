//
//  MainStackView.swift
//  who is wants to be a millionare
//
//  Created by Лилия Феодотова on 07.02.2023.
//

import UIKit

class MainStackView: UIStackView {

    let image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "image1")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Добро пожаловать!"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let labelText: UILabel = {
        let label = UILabel()
        label.text = "Кто хочет стать миллионером"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 25)
        label.numberOfLines = 0
        return label
    }()
    
    let rulesButton: UIButton = {
        let button = UIButton()
        button.setTitle("Правила игры", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 25)
        button.setTitleColor( .green, for: .normal)
        button.addTarget(nil, action: #selector(ViewController.rulesButtonPressed),
            for: .touchUpInside)
        return button
    }()
    
    let startButton: UIButton = {
        let button = UIButton()
        button.setTitle("Начало игры", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 25)
        button.setTitleColor( .green, for: .normal)
        button.addTarget(nil, action: #selector(ViewController.buttonStartGamePressed), for: .touchUpInside)
        
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addArrangedSubview(image)
        addArrangedSubview(welcomeLabel)
        addArrangedSubview(labelText)
        addArrangedSubview(rulesButton)
        addArrangedSubview(startButton)
        
        translatesAutoresizingMaskIntoConstraints = false
        axis = .vertical
        distribution = .fillProportionally
        alignment = .center
        spacing = 20
        
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            image.heightAnchor.constraint(equalToConstant: 100),
            image.widthAnchor.constraint(equalToConstant: 100),
        ])
        
    }
}
