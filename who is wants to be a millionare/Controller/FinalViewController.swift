//
//  FinalViewController.swift
//  who is wants to be a millionare
//
//  Created by Нахид Гаджалиев on 09.02.2023.
//

import UIKit
import AVFoundation

class FinalViewController: UIViewController {
    
    private let backgroundView = Background(frame: .zero)
    private var player: AVAudioPlayer?
    
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
        stack.distribution = .fillProportionally
        stack.alignment = .center
        
        return stack
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewUpdate()
        setupConstraints()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        player = nil
    }
    
}

extension FinalViewController {
    
    private func viewUpdate() {
        view.addSubview(backgroundView)
        view.addSubview(verticalStack)
    }
    
    func takenMoney(money: Int) {
        titleLabel.text = "Вы выиграли \(money) ₽"
    }
    
    func loseScreen() {
        titleLabel.text = "Вы проиграли"
    }
    
    func winScreen() {
        playSound("Выигрыш миллион")
        titleLabel.text = "Поздравляем! Вы выиграли 1,000,000 ₽!"
        let goldenImageView: UIImageView = {
            let image = UIImageView()
            image.translatesAutoresizingMaskIntoConstraints = false
            image.image = UIImage(named: "image2")
            image.contentMode = .scaleAspectFit
            return image
        }()
        
        backgroundView.addSubview(goldenImageView)
        
        NSLayoutConstraint.activate([
            goldenImageView.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor),
            goldenImageView.rightAnchor.constraint(equalTo: backgroundView.rightAnchor),
            goldenImageView.leftAnchor.constraint(equalTo: backgroundView.leftAnchor),
        ])
    }
    
    // MARK: - PLAY SOUND
    private func playSound(_ soundName: String) {
        
        guard let url = Bundle.main.url(forResource: soundName, withExtension: "mp3") else { return }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            guard let player = player else { return }
            player.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    private func setupConstraints() {
        
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        verticalStack.translatesAutoresizingMaskIntoConstraints = false
        logoView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            verticalStack.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            verticalStack.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            verticalStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            verticalStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            playAgainButton.heightAnchor.constraint(equalToConstant: 50),
            
            logoView.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    @objc func turnToRootView() {
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
        
    }
}
