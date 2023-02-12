//
//  Background.swift
//  who is wants to be a millionare
//
//  Created by Лилия Феодотова on 07.02.2023.
//

import UIKit

class Background: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        image = UIImage(named: "background")
        contentMode = .scaleAspectFill
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
