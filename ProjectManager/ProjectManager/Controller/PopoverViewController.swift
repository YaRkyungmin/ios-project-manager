//
//  PopoverViewController.swift
//  ProjectManager
//
//  Created by kyungmin on 2023/12/06.
//

import UIKit

class PopoverViewController: UIViewController {
    let testStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    let testButton: UIButton = {
        let button = UIButton()
        button.setTitle("Move to Doing", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.backgroundColor = .systemBackground
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    let testButton2: UIButton = {
        let button = UIButton()
        button.setTitle("Move to Done", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.backgroundColor = .systemBackground
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(testStack)
        view.backgroundColor = .systemGray5
        testStack.addArrangedSubview(testButton)
        testStack.addArrangedSubview(testButton2)
        
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            testStack.topAnchor.constraint(equalTo: safeArea.topAnchor ,constant: 10),
            testStack.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 10),
            testStack.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -10),
            testStack.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -10)
        ])
    }
}
