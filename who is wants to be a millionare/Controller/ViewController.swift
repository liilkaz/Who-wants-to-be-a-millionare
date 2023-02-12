//
//  ViewController.swift
//  who is wants to be a millionare
//
//  Created by Лилия Феодотова on 05.02.2023.
//

import UIKit

class ViewController: UIViewController {
    
    let background: Background = {
        return Background(frame: .zero)
    }()
    
    let stackView: MainStackView = {
        let stackView = MainStackView(frame: .zero)
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setConstraints()
    }
    
    func setupView(){
        view.addSubview(background)
        view.addSubview(stackView)
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            background.topAnchor.constraint(equalTo: view.topAnchor),
            background.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            background.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            background.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc func buttonStartGamePressed(sender: UIButton){
        let startGameVC = StartGameVC()
        startGameVC.modalPresentationStyle = .fullScreen
        self.present(startGameVC, animated: true)
    }

    @objc func rulesButtonPressed (sender: UIButton) {
        let rulesController = RulesViewController()
        
        let navVC = UINavigationController(rootViewController: rulesController)
        navVC.modalPresentationStyle = .fullScreen
        
        self.present(navVC, animated: true)
    }
}

