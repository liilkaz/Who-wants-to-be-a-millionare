//
//  StartGameVC.swift
//  who is wants to be a millionare
//
//  Created by Андрей Фроленков on 7.02.23.
//

import UIKit
import AVFoundation

class StartGameVC: UIViewController {
    
    // Flag For button promtMistake
    var promt: Bool = false
    
    private var questionBrain = QuestionBrain()
    // mainStackView
    private let generalStackView: GeneralStackView = {
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
    
    var shapeLayer = CAShapeLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addAllSubview()
        settingConstraints()
        startTimer()
        updateUI()
        generalStackView.promtStackView.promtFour.isEnabled = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        basicAnimtion()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        animationCircular()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        player?.stop()
        timer?.invalidate()
    }
    
    // Animation
    
    func animationCircular() {
        
        let center = CGPoint(x:
                                generalStackView.moneyStackView.shapeView.frame.width / 2, y:
                                generalStackView.moneyStackView.shapeView.frame.height / 2)
        
        let endAngle = (-CGFloat.pi / 2)
        let startAngle = 2 * CGFloat.pi + endAngle
        let radius = CGFloat(generalStackView.moneyStackView.shapeView.frame.width + 25) / CGFloat.pi
        
        let circularPath = UIBezierPath(arcCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        
        shapeLayer.path = circularPath.cgPath
        shapeLayer.lineWidth = 10
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeEnd = 1
        shapeLayer.lineCap = CAShapeLayerLineCap.round
        shapeLayer.strokeColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        generalStackView.moneyStackView.shapeView.layer.addSublayer(shapeLayer)
    }
    
    func basicAnimtion() {
        
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.toValue = 0
        basicAnimation.duration = CFTimeInterval(count)
        basicAnimation.fillMode = CAMediaTimingFillMode.forwards
        basicAnimation.isRemovedOnCompletion = false
        shapeLayer.add(basicAnimation, forKey: "basicAnimation")
        
    }
    
}



// MARK: - ADDING OBJC ACTIONS
extension StartGameVC {
    
    // MARK: BUTTON TAPPED
    @objc func buttonAnswer(sender: UIButton) {
        
        shapeLayer.removeAllAnimations()
        
        guard let title = sender.titleLabel, let answerUser = title.text else { return }
        
        let questionsVC = QuestionsViewController()
        questionsVC.modalPresentationStyle = .fullScreen
        
        // MARK: Проверка на пустую кнопку
        if answerUser != " " {
            let answerResponse = checkAnswer(trueOrFalse: questionBrain.checkAnswer(answer: answerUser))
            let currentQuestion = questionBrain.questionNumber + 1
            questionsVC.currentQuestion = currentQuestion
            answerTappedPreparation(sender: sender)
            
            if promt {
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) { [weak self] in // 5
                    
                    questionsVC.trueOrFalse = answerResponse.trueFalse
                    
                    switch questionsVC.trueOrFalse {
                    case true:
                        self?.answerRightAction(sender: sender, controller: questionsVC,
                                          trueFalse: questionsVC.trueOrFalse, question: currentQuestion, color: answerResponse.color)
                    case false:
                        self?.checkVersion(button: sender, color: BackgroundColors.red.rawValue)
                        self?.playSound("zvuk-chasov")
                        self?.startTimer()
                        self?.generalStackView.enableButtons(trueFalse: true)
                        self?.generalStackView.enablePromts(trueFalse: true)
                    }
                }
                
                promt = false
                
            } else {
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) { [weak self] in // 5
                    
                    questionsVC.trueOrFalse = answerResponse.trueFalse
                    
                    self?.answerRightAction(sender: sender, controller: questionsVC,
                                            trueFalse: questionsVC.trueOrFalse, question: currentQuestion, color: answerResponse.color)
                }
            }

        }
        
    }
    
    @objc private func updateUI() {
        let textButton = questionBrain.getQuestionTextButton()
        generalStackView.questionStackView.questionLabel.text = questionBrain.getQuestionText()
        generalStackView.moneyStackView.questionCountLabel.text = "Вопрос \(questionBrain.questionNumber + 1)"
        generalStackView.moneyStackView.moneyCountLabel.text = "\(questionBrain.getMoney()) ₽"
        
        setTitleButton(textButton: textButton)
        
        if #available(iOS 15.0, *) {
            generalStackView.answerStackView.buttonOne.configuration?.background.image = UIImage(named: "blue")
            generalStackView.answerStackView.buttonTwo.configuration?.background.image = UIImage(named: "blue")
            generalStackView.answerStackView.buttonThree.configuration?.background.image = UIImage(named: "blue")
            generalStackView.answerStackView.buttonFour.configuration?.background.image = UIImage(named: "blue")
        } else {
            generalStackView.answerStackView.buttonOne.setBackgroundImage(UIImage(named: "blue"), for: .normal)
            generalStackView.answerStackView.buttonTwo.setBackgroundImage(UIImage(named: "blue"), for: .normal)
            generalStackView.answerStackView.buttonThree.setBackgroundImage(UIImage(named: "blue"), for: .normal)
            generalStackView.answerStackView.buttonFour.setBackgroundImage(UIImage(named: "blue"), for: .normal)
        }
    }
    
    @objc func promtButton(sender: UIButton) {
        
        switch sender.tag {
        case 1:
            promtFiftyFifty(sender: sender)
        case 2:
            askTheAudience()
        case 3:
            rightToMakeMistakes(sender: sender)
        case 4:
            takeMoney()
        default:
            print("Error")
        }
    }
    
    @objc private func updateTimer() {
        if count > 0 {
            count -= 1
//            generalStackView.setTextForCountLabel(text: "\(count)")
            generalStackView.moneyStackView.timerLabel.text = "\(count)"
        } else {
            buttonDidNotPressed()
            if let timer = timer {
                timer.invalidate()
//                generalStackView.setTextForCountLabel(text: "\(count)")
                generalStackView.moneyStackView.timerLabel.text = "\(count)"
            }
        }
    }
    
}

// MARK: - BUTTON ACTIONS
extension StartGameVC {
    
    private func answerTappedPreparation(sender: UIButton) {
        generalStackView.enableButtons(trueFalse: false)
        generalStackView.enablePromts(trueFalse: false)
        count = 30
        player?.stop()
        timer?.invalidate()
        playSound("Ответ принят")
        checkVersion(button: sender, color: BackgroundColors.yellow.rawValue)
    }
    
    private func answerRightAction(sender: UIButton, controller: UIViewController, trueFalse: Bool, question: Int, color: String) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in // 1
            self?.checkVersion(button: sender, color: color)
            self?.present(controller, animated: true)
            if trueFalse && question < 15 {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) { // 3
                    self?.checkVersion(button: sender, color: BackgroundColors.blue.rawValue)
                    self?.correctAnswerTapped(button: sender)
                    self?.generalStackView.promtStackView.promtFour.isEnabled = true
                    self?.generalStackView.enableButtons(trueFalse: true)
                    self?.generalStackView.enablePromts(trueFalse: true)
                    self?.dismiss(animated: true)
                }
            } else if trueFalse && question == 15 {
                self?.correctAnswerTapped(button: sender)
            }

        }
        
    }
    
    // MARK: - ACTION IN CASE CORRECT ANSWER
    private func correctAnswerTapped(button: UIButton) {
        questionBrain.nextQuestion()
        timer?.invalidate()
        startTimer()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(self.updateUI), userInfo: nil, repeats: false)
    }
    
    private func buttonDidNotPressed() {
        let vc = QuestionsViewController()
        vc.modalPresentationStyle = .fullScreen
        vc.currentQuestion = questionBrain.questionNumber + 1
        vc.trueOrFalse = false
        player?.stop()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { // 1
            self.present(vc, animated: true)
        }
    }
    
}

// MARK: - ADDING StartGameVC METHODS
extension StartGameVC {
    
    private func checkAnswer(trueOrFalse: Bool) -> (trueFalse: Bool, color: String) {
        
        switch trueOrFalse {
        case true:
            return (true, BackgroundColors.green.rawValue)
        case false:
            return (false, BackgroundColors.red.rawValue)
        }
        
    }
    
    private func askTheAudience() {
        
        let view = AudienceAskResultView(frame: .zero)
        self.view.addSubview(view)
        setConstraintsForAskView(askView: view)
        self.backgroundView.layer.opacity = 0.5
        view.delegate = self
        
        let arrayAsk = questionBrain.askTheAudienceResult()
        view.labelA.text = "A: \(arrayAsk[0]) %"
        view.answerAPercent.progress = calculatePercentage(element: arrayAsk[0])
        
        view.labelB.text = "B: \(arrayAsk[1]) %"
        view.answerBPercent.progress = calculatePercentage(element: arrayAsk[1])
        
        view.labelC.text = "C: \(arrayAsk[2]) %"
        view.answerCPercent.progress = calculatePercentage(element: arrayAsk[2])
        
        view.labelD.text = "D: \(arrayAsk[3]) %"
        view.answerDPercent.progress = calculatePercentage(element: arrayAsk[3])
        
        generalStackView.promtStackView.promtTwo.isEnabled = false
        generalStackView.promtStackView.promtTwo.setBackgroundImage(UIImage(named: "button2Used"), for: .normal)
        
    }
    
    private func calculatePercentage(element: Int) -> Float {
        let percentage = Float(element) / 100
        return percentage
    }
    
    
    private func setConstraintsForAskView(askView: UIView) {
        NSLayoutConstraint.activate([
            askView.heightAnchor.constraint(equalToConstant: 300),
            askView.widthAnchor.constraint(equalToConstant: 300),
            askView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            askView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        
    }
    
    private func rightToMakeMistakes(sender: UIButton) {
        promt = true
        generalStackView.promtStackView.promtThree.isEnabled = false
        sender.setBackgroundImage(UIImage(named: "promtMistakeUsed"), for: .normal)
    }
    
    private func takeMoney() {
        let money = questionBrain.savedMoneyCheck()
        let vc = FinalViewController()
        vc.modalPresentationStyle = .fullScreen
        vc.takenMoney(money: money)
        self.present(vc, animated: true)
    }
    
    // MARK: - ADD All SUBVIEW
    private func addAllSubview() {
        view.addSubview(backgroundView)
        view.addSubview(generalStackView)
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
            generalStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            generalStackView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            generalStackView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            generalStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    // MARK: - For Button Set Title
    private func setTitleButton(textButton: [String]) {
        generalStackView.answerStackView.buttonOne.setTitle(textButton[0], for: .normal)
        generalStackView.answerStackView.buttonTwo.setTitle(textButton[1], for: .normal)
        generalStackView.answerStackView.buttonThree.setTitle(textButton[2], for: .normal)
        generalStackView.answerStackView.buttonFour.setTitle(textButton[3], for: .normal)
    }
    
    // MARK: - START TIMER
    private func startTimer() {
        playSound("zvuk-chasov")
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        generalStackView.setTextForCountLabel(text: count.description)
    }
    
    // MARK: - PLAY SOUND
    private func playSound(_ soundName: String) {
        
        guard let url = Bundle.main.url(forResource: soundName,
                                        withExtension: "mp3") else { return }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            guard let player = player else { return }
            player.prepareToPlay()
            player.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
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

extension StartGameVC: AudienceAskResultViewDelegate {
    
    func change(opacity: Float) {
        self.backgroundView.layer.opacity = opacity
    }
    
}
