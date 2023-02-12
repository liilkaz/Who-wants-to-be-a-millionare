//
//  QuestionStackView.swift
//  who is wants to be a millionare
//
//  Created by Андрей Фроленков on 7.02.23.
//

import UIKit

class QuestionStackView: UIStackView {

    let iconHeight: CGFloat = 120
    let iconWidth: CGFloat = 120
    
    let iconImage: UIImageView = {
        let iconImage = UIImageView()
        iconImage.image = UIImage(named: "image1")
        return iconImage
    }()
    
    let questionLabel: UILabel = {
        let label = UILabel()
        label.text = "Could you pass me the salt?"
        label.textColor = .white
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 25)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        axis = .horizontal
        alignment = .center
        distribution = .fill
        spacing = 10
        
        addArrangedAllSubview()
        settingConstraints()
    }
    
    // MARK: addArrangedAllSubview
    private func addArrangedAllSubview() {
        addArrangedSubview(iconImage)
        addArrangedSubview(questionLabel)
    }
    
    // MARK: settingConstraints
    private func settingConstraints() {
        // iconImage
        NSLayoutConstraint.activate([
            iconImage.heightAnchor.constraint(equalToConstant: iconHeight),
            iconImage.widthAnchor.constraint(equalToConstant: iconWidth)
        ])
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
