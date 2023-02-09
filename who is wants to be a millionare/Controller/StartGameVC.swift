//
//  StartGameVC.swift
//  who is wants to be a millionare
//
//  Created by Андрей Фроленков on 7.02.23.
//

import UIKit
import AVFoundation

class StartGameVC: UIViewController {
    
    private var questionBrain = QuestionBrain()
    
    // mainStackView
    private let mainStackView: GeneralStackView = {
        let stack = GeneralStackView(frame: .zero)
        return stack
    }()
    // BackgroundView
    private let backgroundView: Background = {
        return Background(frame: .zero)
    }()
    
    // AudioPlayer
    private var player: AVAudioPlayer?
    
    // Timer
    
    private var timer: Timer?
    private var count = 30
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addAllSubview()
        settingConstraints()
        startTimer()
        updateUI()
        
    }
    
}

// MARK: - ADDING OBJC ACTIONS
extension StartGameVC {
    
    @objc func promtButton(sender: UIButton) {
        
        switch sender.tag {
        case 1:
            promtFiftyFifty(sender: sender)
        case 2:
            print("Two")
        case 3:
            print("Three")
            
        default:
            print("Error")
        }
    }
    
    // MARK: BUTTON TAPPED
    @objc func buttonAnswer(sender: UIButton) {
        
        guard let title = sender.titleLabel,
              let answerUser = title.text else { return }
        
        let vc = QuestionsViewController()
        vc.modalPresentationStyle = .fullScreen
        vc.wonMoney = questionBrain.savedMoneyCheck() // Несгораемая сумма
        print(vc.wonMoney)
        
        // MARK: Проверка на пустую кнопку
        if answerUser != " " {
            
            self.count = 30
            player?.stop()
            timer?.invalidate()
            playSound("Ответ принят")
            vc.currentQuestion = questionBrain.questionNumber + 1
            checkVersion(button: sender, color: BackgroundColors.yellow.rawValue)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [self] in // 5
                if questionBrain.checkAnswer(answer: answerUser) {
                    vc.trueOrFalse = true
                    playSound("Верный ответ")
                    checkVersion(button: sender, color: BackgroundColors.green.rawValue)
                } else {
                    vc.trueOrFalse = false
                    playSound("Неверный ответ")
                    checkVersion(button: sender, color: BackgroundColors.red.rawValue)
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) { // 1
                    self.present(vc, animated: true)
                    
                    if vc.trueOrFalse {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { // 3
                            self.correctAnswerTapped(button: sender)
                        }
                    }
                    self.checkVersion(button: sender, color: BackgroundColors.blue.rawValue)
                }
                
            }
        }
        
    }
    
    @objc private func updateUI() {
        
        let textButton = questionBrain.getQuestionTextButton()
        mainStackView.questionStackView.questionLabel.text = questionBrain.getQuestionText()
        mainStackView.moneyStackView.questionCountLabel.text = "Вопрос \(questionBrain.questionNumber + 1)"
        mainStackView.moneyStackView.moneyCountLabel.text = "\(questionBrain.getMoney()) ₽"
        
        setTitleButton(textButton: textButton)
        
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
    
    @objc private func updateTimer() {
        
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
}

// MARK: - ADDING StartGameVC METHODS
extension StartGameVC {
    
    // MARK: - ADD All SUBVIEW
    private func addAllSubview() {
        view.addSubview(backgroundView)
        view.addSubview(mainStackView)
    }
    
    // MARK: - SETTING CONSTRAINTS
    private func settingConstraints() {
        
        // MARK: BackgroundView Constraints
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        // MARK: MainStackView Constraints
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    // MARK: - For Button Set Title
    private func setTitleButton(textButton: [String]) {
        
        mainStackView.answerStackView.buttonOne.setTitle(textButton[0], for: .normal)
        mainStackView.answerStackView.buttonTwo.setTitle(textButton[1], for: .normal)
        mainStackView.answerStackView.buttonThree.setTitle(textButton[2], for: .normal)
        mainStackView.answerStackView.buttonFour.setTitle(textButton[3], for: .normal)
    }
    
    // MARK: - START TIMER
    private func startTimer() {
        
        playSound("zvuk-chasov")
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        mainStackView.setTextForCountLabel(text: count.description)
        
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
    
    // MARK: - ACTION IN CASE CORRECT ANSWER
    private func correctAnswerTapped(button: UIButton) {
        self.questionBrain.nextQuestion()
        self.timer?.invalidate()
        self.startTimer()
        self.dismiss(animated: true)
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(self.updateUI), userInfo: nil, repeats: false)
    }
    
    // MARK: - CHECKING DEVICE VERSION
    private func checkVersion(button: UIButton, color: String) {
        if #available(iOS 15.0, *) {
            button.configuration?.background.image = UIImage(named: color)
        } else {
            button.setBackgroundImage(UIImage(named: color), for: .normal)
        }
    }
    
    // MARK: - FIFTY FIFTY PROMT BUTTON
    private func promtFiftyFifty(sender: UIButton) {
        
        let question = questionBrain.getFiftyFiftyArray()
        setTitleButton(textButton: question)
        sender.setBackgroundImage(UIImage(named: "button1Used"), for: .normal)
        sender.isEnabled = false
        
    }
    
}
