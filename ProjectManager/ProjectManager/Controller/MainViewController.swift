//
//  MainViewController.swift
//  ProjectManager
//
//  Created by kyungmin on 2023/10/26.
//

import UIKit

final class MainViewController: UIViewController {
    private var todoViewController: UIViewController
    private var doingViewController: UIViewController
    private var doneViewController: UIViewController
    
    private let navigationBar: UINavigationBar = {
        let navigationBar = UINavigationBar()
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        
        return navigationBar
    }()
    
    private let planStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.backgroundColor = .systemGray5
        
        return stackView
    }()
    
    let tabBar: UITabBar = {
        let tabBar = UITabBar()
        tabBar.translatesAutoresizingMaskIntoConstraints = false
        
        return tabBar
    }()
    
    init(
        todoViewController: UIViewController,
        doingViewController: UIViewController,
        doneViewController: UIViewController) {
        self.todoViewController = todoViewController
        self.doingViewController = doingViewController
        self.doneViewController = doneViewController
            
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setupComponents()
        setupConstraints()
    }
}

// MARK: - ConfigureUI
extension MainViewController {
    private func configureUI() {
        configureView()
        configurePlanStackView()
    }
    
    private func configureView() {
        view.addSubview(navigationBar)
        view.addSubview(tabBar)
        view.addSubview(planStackView)
    }
    
    private func configurePlanStackView() {
        planStackView.addArrangedSubview(todoViewController.view)
        planStackView.addArrangedSubview(doingViewController.view)
        planStackView.addArrangedSubview(doneViewController.view)
    }
}

// MARK: - SetupComponents
extension MainViewController {
    private func setupComponents() {
        setupView()
        setupNavigationBar()
    }
    
    private func setupView() {
        view.backgroundColor = .white
    }
    
    private func setupNavigationBar() {
        let navigationItem = UINavigationItem(title: "Project Manager")
        let historyButton = UIBarButtonItem(
            title: "History",
            style: .plain,
            target: self,
            action: #selector(didTapHistoryButton))
        let plusButton = UIBarButtonItem(
            title: "+",
            style: .plain,
            target: self,
            action: #selector(didTapPlusButton))
        navigationItem.leftBarButtonItem = historyButton
        navigationItem.rightBarButtonItem = plusButton
        
        navigationBar.setItems([navigationItem], animated: true)
    }
}

// MARK: - SetupConstraint
extension MainViewController {
    private func setupConstraints() {
        setupNavigationBarConstraint()
        setupTabBarConstraint()
        setupPlanStackViewConstraint()
    }
    
    private func setupNavigationBarConstraint() {
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            navigationBar.topAnchor.constraint(equalTo: safeArea.topAnchor),
            navigationBar.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            navigationBar.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor)
        ])
    }
    
    private func setupTabBarConstraint() {
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            tabBar.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            tabBar.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            tabBar.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor)
        ])
    }
    
    private func setupPlanStackViewConstraint() {
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            planStackView.topAnchor.constraint(equalTo: navigationBar.bottomAnchor),
            planStackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            planStackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            planStackView.bottomAnchor.constraint(equalTo: tabBar.topAnchor)
        ])
    }
}

// MARK: - ButtonAction
extension MainViewController {
    @objc private func didTapPlusButton() {
        print("didTapPlusButton")
    }
    
    @objc private func didTapHistoryButton() {
        print("didTapHistoryButton")
    }
}
