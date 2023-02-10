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
    var wonMoney = 0
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
        let stack =  UIStackView(arrangedSubviews: [logoImage])
        stack.axis = .vertical
        stack.spacing = 10
        
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewUpdate()
    }
    
}


// MARK: - Adding QuestionsViewController methods

extension QuestionsViewController {
    
    // MARK: - UPDATE FOR ELEMENTS
    private func viewUpdate() {
        view.addSubview(backgroundView)
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
            
            creatingLoseOrWinView()
            
            NSLayoutConstraint.activate([
                question.heightAnchor.constraint(equalToConstant: 35),
                question.leftAnchor.constraint(equalTo: stackView.leftAnchor, constant: 15),
                question.rightAnchor.constraint(equalTo: stackView.rightAnchor, constant: -15)
            ])
        }
        
    }
    
    private func creatingLoseOrWinView() {
        
        let finalVC = FinalViewController()
        finalVC.modalPresentationStyle = .fullScreen
        
        switch trueOrFalse {
        case true:
            
            if currentQuestion == 15 {
                playSound("Выигрыш миллион")
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    finalVC.winScreen()
                    self.present(finalVC, animated: true)
                }
                
            } else {
                playSound("Верный ответ")
            }
            
        case false:
            
            playSound("Неверный ответ")
            
            switch questionListBrain.checkSavedMoney(currentQuestion: currentQuestion) {
            case 0:
                finalVC.loseScreen()
            default:
                finalVC.takenMoney(money: questionListBrain.checkSavedMoney(currentQuestion: currentQuestion))
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [self] in
                self.present(finalVC, animated: true)
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
            backgroundView.leftAnchor.constraint(equalTo: view.leftAnchor),
            backgroundView.rightAnchor.constraint(equalTo: view.rightAnchor),
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            stackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            
            logoImage.topAnchor.constraint(equalTo: stackView.safeAreaLayoutGuide.topAnchor),
            
        ])
    }
    
}


