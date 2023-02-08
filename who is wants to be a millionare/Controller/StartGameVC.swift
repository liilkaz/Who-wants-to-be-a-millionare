//
//  StartGameVC.swift
//  who is wants to be a millionare
//
//  Created by Андрей Фроленков on 7.02.23.
//

import UIKit
import AVFoundation

class StartGameVC: UIViewController {
    
    var questionBrain = QuestionBrain()
    
    // mainStackView
    let mainStackView: GeneralStackView = {
        let stack = GeneralStackView(frame: .zero)
        return stack
    }()
    // BackgroundView
    let backgroundView: Background = {
        return Background(frame: .zero)
    }()
    
    // AudioPlayer
    var player: AVAudioPlayer?
    
    // Timer
    var timer: Timer?
    
    private var count = 30
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addAllSubview()
        settingConstraints()
        startTimer()
        updateUI()
        
    }
    
    // MARK: BUTTON TAPPED
    @objc func buttonAnswer(sender: UIButton) {
        count = 30
        
        guard let title = sender.titleLabel, let userAnswer = title.text else { return }
        let userGotItRight = questionBrain.checkAnswer(answer: userAnswer)
        
        if userGotItRight {
            if #available(iOS 15.0, *) {
                sender.configuration?.background.image = UIImage(named: "green")
            } else {
                sender.setBackgroundImage(UIImage(named: "green"), for: .normal)
            }
        } else {
            if #available(iOS 15.0, *) {
                sender.configuration?.background.image = UIImage(named: "red")
            } else {
                sender.setBackgroundImage(UIImage(named: "red"), for: .normal)
            }
        }
        
        questionBrain.nextQuestion()
        
        timer?.invalidate()
        startTimer()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        

    }
    
    @objc func updateUI() {
        
        mainStackView.questionStackView.questionLabel.text = questionBrain.getQuestionText()
        mainStackView.moneyStackView.questionCountLabel.text = "Question \(questionBrain.questionNumber + 1)"
        mainStackView.moneyStackView.moneyCountLabel.text = "\(questionBrain.getMoney()) RUB"
        let textButton = questionBrain.getQuestionTextButton()
        mainStackView.answerStackView.buttonOne.setTitle(textButton[0], for: .normal)
        mainStackView.answerStackView.buttonTwo.setTitle(textButton[1], for: .normal)
        mainStackView.answerStackView.buttonThree.setTitle(textButton[2], for: .normal)
        mainStackView.answerStackView.buttonFour.setTitle(textButton[3], for: .normal)
        
        if #available(iOS 15.0, *) {
            mainStackView.answerStackView.buttonOne.configuration?.background.image = UIImage(named: "blue")
            mainStackView.answerStackView.buttonTwo.configuration?.background.image = UIImage(named: "blue")
            mainStackView.answerStackView.buttonThree.configuration?.background.image = UIImage(named: "blue")
            mainStackView.answerStackView.buttonFour.configuration?.background.image = UIImage(named: "blue")
        } else {
            mainStackView.answerStackView.buttonOne.setBackgroundImage(UIImage(named: "blue"), for: .normal)
            mainStackView.answerStackView.buttonTwo.setBackgroundImage(UIImage(named: "blue"), for: .normal)
            mainStackView.answerStackView.buttonThree.setBackgroundImage(UIImage(named: "blue"), for: .normal)
            mainStackView.answerStackView.buttonFour.setBackgroundImage(UIImage(named: "blue"), for: .normal)
        }
        
        
    }
    
    // MARK: START TIMER
    private func startTimer() {
        
        playSound("zvuk-chasov")
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        mainStackView.setTextForCountLabel(text: count.description)
        
    }
    
    @objc func updateTimer() {
        
        if count > 0 {
            count -= 1
            mainStackView.setTextForCountLabel(text: count.description)
            
        } else {
            if let timer = timer {
                timer.invalidate()
                mainStackView.setTextForCountLabel(text: "")
            }
        }
    }
    
    // MARK: PlAY SOUND
    func playSound(_ soundName: String) {
        
        guard let url = Bundle.main.url(forResource: soundName, withExtension: "mp3") else { return }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            
            guard let player = player else { return }
            
            player.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
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
