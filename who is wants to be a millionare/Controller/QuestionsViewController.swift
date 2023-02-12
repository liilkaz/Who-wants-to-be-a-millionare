//
//  QuestionsViewController.swift
//  who is wants to be a millionare
//
//  Created by Нахид Гаджалиев on 07.02.2023.
//

import UIKit
import AVFoundation

class QuestionsViewController: UIViewController {
    
    private var questionListBrain = QuestionListBrain()
    var trueOrFalse = false
    var currentQuestion = 0
    private var player: AVAudioPlayer?
    
    // Creating background image
    private let backgroundView = Background(frame: .zero)
    
    // Creating logo
    private let logoImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "image1")
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    lazy var stackView: UIStackView = {
        let stack =  UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.distribution = .fillEqually
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewUpdate()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        creatingLoseOrWinView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        player = nil
    }

}

// MARK: - Adding QuestionsViewController methods

extension QuestionsViewController {
    
    // MARK: - UPDATE FOR ELEMENTS
    private func viewUpdate() {
        view.addSubview(backgroundView)
        view.addSubview(logoImage)
        view.addSubview(stackView)
        createImages()
        setupConstraints()
    }
    
    // Creating questions list background
    private func createImages() {
        
        for index in 0...questionListBrain.getQuestionsCount() - 1 {
            let question = QuestionBackground(frame: .zero)
            
            question.image = UIImage(named: questionListBrain.checkingAnswer(
                currentNumber: currentQuestion == questionListBrain.questionNumberArray[index],
                trueFalse: trueOrFalse,
                indexForCheck: questionListBrain.questionNumberArray[index]))
            
            question.questionNumberLabel.text = "Вопрос \(questionListBrain.questionNumberArray[index])"
            question.moneyLabel.text = "\(questionListBrain.moneyList[index]) ₽"
            
            stackView.addArrangedSubview(question)
            
        }
        
    }
    
    private func creatingLoseOrWinView() {
        
        let finalVC = FinalViewController()
        finalVC.modalPresentationStyle = .fullScreen
        
        switch trueOrFalse {
        case true:
            playSound("Верный ответ")
            if currentQuestion == 15 {
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
                    finalVC.winScreen()
                    self?.present(finalVC, animated: true)
                }
                
            }
            
        case false:
            
            playSound("Неверный ответ")
            
            switch questionListBrain.checkSavedMoney(currentQuestion: currentQuestion) {
            case 0:
                finalVC.loseScreen()
            default:
                finalVC.takenMoney(money: questionListBrain.checkSavedMoney(currentQuestion: currentQuestion))
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
                self?.present(finalVC, animated: true)
            }
            
        }
        
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
    
    // MARK: - CREATING CONSTRAINTS FOR ELEMENTS
    private func setupConstraints() {
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            stackView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            logoImage.heightAnchor.constraint(lessThanOrEqualToConstant: 150),
            logoImage.widthAnchor.constraint(lessThanOrEqualToConstant: 150),
            logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            logoImage.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: -10)
        ])
    }
    
}


