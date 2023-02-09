//
//  LoseViewController.swift
//  who is wants to be a millionare
//
//  Created by Нахид Гаджалиев on 09.02.2023.
//

import UIKit

class LoseViewController: UIViewController {
    
    private let backgroundView = Background(frame: .zero)
    var loseBrain = LoseScreenBrain()
    var wonMoney = 0
    
    private let logoView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "image1")
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 50, weight: .bold)
        label.textColor = .systemBackground
        label.textAlignment = .center
        label.numberOfLines = 0
        
        return label
    }()
    
    private let playAgainButton: UIButton = {
        let button = UIButton()
        button.setTitle("Играть снова", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 25, weight: .medium)
        button.setBackgroundImage(UIImage(named: BackgroundColors.green.rawValue), for: .normal)
        button.addTarget(nil, action: #selector(turnToRootView), for: .touchUpInside)
        
        return button
    }()
    
    lazy var verticalStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [logoView, titleLabel, playAgainButton])
        stack.axis = .vertical
        stack.spacing = 20
        stack.alignment = .center
        
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewUpdate()
        setupConstraints()
//        titleUpdate()
    }
    
}

extension LoseViewController {
    
    private func viewUpdate() {
        view.addSubview(backgroundView)
        view.addSubview(verticalStack)
    }
    
    func takenMoney(money: Int) {
        
        titleLabel.text = "Вы выиграли \(money)"
    }
    
    private func titleUpdate() {
        if loseBrain.checkWonMoney(money: wonMoney) {
            titleLabel.text = "Вы выиграли \(wonMoney)"
        } else {
            titleLabel.text = "Вы проиграли"
        }
    }
    
    private func setupConstraints() {
        
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        verticalStack.translatesAutoresizingMaskIntoConstraints = false
        logoView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backgroundView.leftAnchor.constraint(equalTo: view.leftAnchor),
            backgroundView.rightAnchor.constraint(equalTo: view.rightAnchor),
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            verticalStack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            verticalStack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
            verticalStack.topAnchor.constraint(equalTo: view.topAnchor, constant: 15),
            verticalStack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -90),
            
            playAgainButton.heightAnchor.constraint(equalToConstant: 50),
            
            logoView.topAnchor.constraint(equalTo: verticalStack.safeAreaLayoutGuide.topAnchor),
            logoView.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    @objc func turnToRootView() {
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
}
