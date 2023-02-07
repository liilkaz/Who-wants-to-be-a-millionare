//
//  QuestionsViewController.swift
//  who is wants to be a millionare
//
//  Created by Нахид Гаджалиев on 06.02.2023.
//

import UIKit

class QuestionsViewController: UIViewController {
    
    private var questionsBrain = QuestionListBrain()
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(QuestionCellView.self, forCellReuseIdentifier: QuestionCellView.identifier)
        table.backgroundColor = .clear
        table.isUserInteractionEnabled = false
        
        return table
    }()
    
    private let backgroundImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "background")
        image.contentMode = .scaleAspectFill
        
        return image
    }()
    
    private let logoImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "image1")
        image.contentMode = .scaleAspectFit
        
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
    
}

// MARK: - Adding QuestionsViewController methods

extension QuestionsViewController {
    
    private func viewUpdate() {
        view.addSubview(backgroundImage)
        view.addSubview(stackView)
        tableView.dataSource = self
        setupConstraints()
    }
    
    private func setupConstraints() {
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backgroundImage.leftAnchor.constraint(equalTo: view.leftAnchor),
            backgroundImage.rightAnchor.constraint(equalTo: view.rightAnchor),
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            stackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10),
            
            logoImage.topAnchor.constraint(equalTo: stackView.safeAreaLayoutGuide.topAnchor),
            logoImage.heightAnchor.constraint(equalToConstant: view.bounds.height / 10),
            
        ])
    }
}

// MARK: - Adding TableView DataSource

extension QuestionsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questionsBrain.getQuestionsCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: QuestionCellView.identifier) as? QuestionCellView else { fatalError() }
        cell.configure(money: questionsBrain.questionsList[indexPath.row],
                       numberOfQuestion: questionsBrain.number[indexPath.row])
        return cell
    }
    
}
