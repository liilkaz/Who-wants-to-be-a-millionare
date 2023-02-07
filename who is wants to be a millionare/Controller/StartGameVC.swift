//
//  StartGameVC.swift
//  who is wants to be a millionare
//
//  Created by Андрей Фроленков on 7.02.23.
//

import UIKit

class StartGameVC: UIViewController {

    // mainStackView
    let mainStackView: GeneralStackView = {
        let stack = GeneralStackView(frame: .zero)
        return stack
    }()
    // BackgroundView
    let backgroundView: Background = {
        return Background(frame: .zero)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addAllSubview()
        settingConstraints()
        
    }
    
    @objc func buttonAnswer(sender: UIButton) {
        
        guard let title = sender.titleLabel, let text = title.text else { return }
        print(text)
    
    }
    
    @objc func promtButton(sender: UIButton) {
        
        print(sender.tag)
    }
    
    // MARK: addAllSubview
    private func addAllSubview() {
        
        self.view.addSubview(backgroundView)
        self.view.addSubview(mainStackView)
        
    }
    // MARK: settingConstraints
    private func settingConstraints() {
        
        // backgroundView Constraints
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        // mainStackView Constraints
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

}
