//
//  PromtStackView.swift
//  who is wants to be a millionare
//
//  Created by Андрей Фроленков on 7.02.23.
//

import UIKit

class PromtStackView: UIStackView {

    let buttomHeight: CGFloat = 70
    
    lazy var promtOne: UIButton = {
        return settingButton(imageName: "button1", tag: 1)
    }()
    
    lazy var promtTwo: UIButton = {
        return settingButton(imageName: "button2", tag: 2)
    }()
    
    lazy var promtThree: UIButton = {
        return settingButton(imageName: "promtMistake", tag: 3)
    }()
    
    lazy var promtFour: UIButton = {
        return settingButton(imageName: "button4", tag: 4)
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        axis = .horizontal
        alignment = .fill
        distribution = .fillEqually
        spacing = 20
        
        addArrangedAllSubview()
        settingConstraints()
    }
    
    // MARK: addArrangedAllSubview
    private func addArrangedAllSubview() {
        
        addArrangedSubview(promtOne)
        addArrangedSubview(promtTwo)
        addArrangedSubview(promtThree)
        addArrangedSubview(promtFour)
    }
    
    // MARK: settingConstraints
    private func settingConstraints() {
        
        // For all Button
        NSLayoutConstraint.activate([
            promtOne.heightAnchor.constraint(equalToConstant: buttomHeight)
        ])
    }
    
    private func settingButton(imageName: String, tag: Int) -> UIButton {
        
        let button = UIButton()
        let image = UIImage(named: imageName)
        button.tag = tag
        button.setBackgroundImage(image, for: .normal)
        button.addTarget(nil, action: #selector(StartGameVC.promtButton(sender:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
