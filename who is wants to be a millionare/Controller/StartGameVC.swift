//
//  StartGameVC.swift
//  who is wants to be a millionare
//
//  Created by Андрей Фроленков on 7.02.23.
//

import UIKit
import AVFoundation

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
        
    }
    
    private func startTimer() {
        
        playSound("zvuk-chasov")
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(update), userInfo: nil, repeats: true)
        
    }
    
    @objc func update() {
        
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
