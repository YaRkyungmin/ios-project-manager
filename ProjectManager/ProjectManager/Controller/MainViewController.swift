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
    
    private lazy var navigationBarLeftButton: UIButton = {
        let button = UIButton()
        button.setTitle("History", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .body)
        button.backgroundColor = .systemBackground
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapHistoryButton(_:)), for: .touchUpInside)
        
        return button
    }()
    
    private let navigationBarTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Project Manager"
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var navigationBarRightButton: UIButton = {
        let button = UIButton()
        button.setTitle("+", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title1)
        button.backgroundColor = .systemBackground
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapPlusButton), for: .touchUpInside)
        
        return button
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
        configureNavigationbar()
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
    
    private func configureNavigationbar() {
        navigationBar.addSubview(navigationBarLeftButton)
        navigationBar.addSubview(navigationBarTitleLabel)
        navigationBar.addSubview(navigationBarRightButton)
    }
}

// MARK: - SetupComponents
extension MainViewController {
    private func setupComponents() {
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .white
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
            navigationBar.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            navigationBarLeftButton.centerYAnchor.constraint(equalTo: navigationBar.centerYAnchor),
            navigationBarLeftButton.leadingAnchor.constraint(equalTo: navigationBar.leadingAnchor, constant: 15),
            navigationBarTitleLabel.centerXAnchor.constraint(equalTo: navigationBar.centerXAnchor),
            navigationBarTitleLabel.centerYAnchor.constraint(equalTo: navigationBar.centerYAnchor),
            navigationBarRightButton.centerYAnchor.constraint(equalTo: navigationBar.centerYAnchor),
            navigationBarRightButton.trailingAnchor.constraint(equalTo: navigationBar.trailingAnchor, constant: -15)
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
        let test = DetailPlanViewController()
        test.modalPresentationStyle = .pageSheet
        present(test, animated: false, completion: nil)
    }
    
    @objc private func didTapHistoryButton(_ sender: UIButton) {
        let historyViewController = HistoryViewController()
        historyViewController.modalPresentationStyle = .popover
        historyViewController.preferredContentSize = CGSize(width: view.frame.width * 0.45, height: view.frame.height * 0.55)
        let buttonFrame = sender.frame
        historyViewController.popoverPresentationController?.sourceView = view
        historyViewController.popoverPresentationController?.sourceRect = CGRect(x: buttonFrame.minX, y: navigationBar.frame.maxY, width: 0, height: 0)
        historyViewController.popoverPresentationController?.permittedArrowDirections = [.up]

        present(historyViewController, animated: false)
    }
}
