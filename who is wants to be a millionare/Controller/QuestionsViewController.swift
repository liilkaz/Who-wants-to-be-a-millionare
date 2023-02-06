//
//  QuestionsViewController.swift
//  who is wants to be a millionare
//
//  Created by Нахид Гаджалиев on 06.02.2023.
//

import UIKit

class QuestionsViewController: UIViewController {
    
    private let tableView = UITableView()
    
    private let backgroundImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "background")
        image.contentMode = .scaleAspectFill
        
        return image
    }()
    
    private let logoImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "image1")
        
        return image
    }()
    
    lazy var stackView: UIStackView = {
        let stack =  UIStackView(arrangedSubviews: [logoImage, tableView])
        stack.axis = .vertical
        stack.spacing = 10
        return stack
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        viewUpdate()
    }
    
    // MARK: - Private functions
    
    private func viewUpdate() {
        view.addSubview(backgroundImage)
        view.addSubview(logoImage)
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backgroundImage.leftAnchor.constraint(equalTo: view.leftAnchor),
            backgroundImage.rightAnchor.constraint(equalTo: view.rightAnchor),
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            logoImage.heightAnchor.constraint(equalToConstant: 90),
            logoImage.widthAnchor.constraint(equalToConstant: 90),
            
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
        ])
    }
    
}


extension QuestionsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else { fatalError() }
        cell.textLabel?.text = "Question"
        return cell
    }
    
    
}
